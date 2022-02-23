<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
function getHsptMainSckbdCountAndStats(){
	$.ajax({
		url: '<%=request.getContextPath()%>/rest-hspt/main-sckbdCountAndStats',
		type : 'post',
		dataType: 'json',
		success:function(dataMap){
			
			console.log(dataMap);
			
			var hspt = dataMap.loginHspt;
			var color = '';
			if(dataMap.loginHspt){
				var sckbdCnt = parseInt(hspt.sckbdCnt);
				var rmndSckbdCnt = parseInt(hspt.rmndSckbdCnt);
				
				var curInptntCnt = dataMap.curInptntCnt;
				
				var toCheckSckbdCnt = sckbdCnt - rmndSckbdCnt - curInptntCnt;
				
				$('#toCheckSckbdCnt').html(toCheckSckbdCnt);
				
				var opRate = 0;
				if(sckbdCnt == 0){
					opRate = 0;
				}else{
					opRate = Math.round(( (sckbdCnt - rmndSckbdCnt) / sckbdCnt)  * 100);
				}
				$('#rmndSckbdCnt').html(hspt.rmndSckbdCnt);
				$('#rmndSckbdCntHead').html('잔여병상수 ' + hspt.rmndSckbdCnt + '개');
				$('#sckbdCnt').html(hspt.sckbdCnt);
				
				$('#curInptntCnt').html(dataMap.curInptntCnt);
				
				if(opRate > 80){
					color = '#dc3545';
				}else if(opRate > 60){
					color = '##ffc107';
				}else if(opRate > 40){
					color = '#28a745';
				}else{
					color = '#007bff';
				}
				
				$('#opRate').css('backgroundColor', color);
				$('#opRate').css('borderColor', color);
				$('#opRate').html(opRate + '%');
				
			}else{
				$('#rmndSckbdCnt').html('0');
				$('#sckbdCnt').html('0');
				$('#opRate').html('0');
			}
			
			var hsptStats = dataMap.hsptStats;
			
			if(dataMap.hsptStats){
				$('#inptntCnt').html(hsptStats.inptntCnt);
				$('#rlsedCnt').html(hsptStats.rlsedCnt);
				$('#outCnt').html(hsptStats.outCnt);
				$('#deathCnt').html(hsptStats.deathCnt);
			}else{
				$('#inptntCnt').html('0');
				$('#rlsedCnt').html('0');
				$('#outCnt').html('0');
				$('#deathCnt').html('0');
			}
			
		},
		error : function(error){
			alert("등록된 병상이 없습니다. 병상을 등록해주세요.");
		}
	})
}

function statsTest(){
	// alert('test');
	
	$.ajax({
		url: '<%=request.getContextPath()%>/rest-hspt/stats-test',
		type : 'post',
		dataType: 'json',
		success:function(dataMap){
			if(dataMap.msg == "success"){
				alert('통계 갱신에 성공하였습니다.');
			}
		},
		error : function(error){
			alert("등록된 병상이 없습니다. 병상을 등록해주세요.");
		}
	})
}

</script>

<div class="card" style="position: relative; left: 1%; top: 0px; width: 32%">
<div class="card-header ui-sortable-handle">
	<tr role="row">
		<th tabindex="0" aria-controls="example2" rowspan="1"
			style="text-align: center;" colspan="1" aria-label="">
			<div class="col-md-4" style="font-weight: bold; color: #333333; font-size: 16px;">
                          병상관리
			</div>
			<div class="card-tools ">
				<b id="rmndSckbdCntHead">잔여병상수 ${hspt.rmndSckbdCnt}개</b>
                <button type="button" class="btn btn-tool"
                        onclick="statsTest();" style="display: none;">
                                          통계갱신
                </button>
      
				<button type="button" class="btn btn-tool"
					onclick="OpenWindow('./sckbd-modify','', 780,600)">
					<i class="fas fa-plus" style="color: black"></i>
				</button>

			</div>
		</th>
	</tr>

</div>
<div class="card-body">
	<table class="table table-bordered table-sm">
		<thead>
			<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
				<th style="text-align: center;" colspan="5">병상현황</th>
			</tr>
		</thead>
		<tbody>
			<tr
				style="text-align: center; font-weight: bold; background-color: #f5fafc">
				<th style="text-align: center; width: 20%;" class="col-md-3">총<br>병상수</th>
				<th style="text-align: center; width: 20%;" class="col-md-3">입원<br>환자수</th>
				<th style="text-align: center; width: 20%;" class="col-md-3">잔여<br>병상수</th>
				<th style="text-align: center; width: 20%;" class="col-md-3">처리대기<br>병상수</th>
				<th style="text-align: center; width: 20%; vertical-align: middle;" class="col-md-3">가동률</th>
			</tr>
			<tr style="text-align: center">
				<td id="sckbdCnt"></td>
				<td><span class="badge badge-primary" id="curInptntCnt" style="background-color: #007bff; width: 45px;"></span></td>
				<td><span class="badge badge-info" id="rmndSckbdCnt" style="background-color: #17a2b8; width: 45px;"></span></td>
				<td><span class="badge badge-info" id="toCheckSckbdCnt" style="background-color: #28a745; width: 45px;"></span></td>
				<td ><span class="badge badge-warning" id="opRate" style="width: 45px; color: white;"></span></td>
			</tr>
		</tbody>
	</table>
	<div style="height: 8px;"></div>
	<table class="table table-bordered table-sm">
		<thead>
			<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
				<th style="text-align: center;" colspan="4">일주일 현황</th>
			</tr>
		</thead>
		<tbody>
			<tr
				style="text-align: center; font-weight: bold; background-color: #f5fafc">
				<th style="text-align: center;" class="col-md-3">입원</th>
				<th style="text-align: center;" class="col-md-3">완치</th>
				<th style="text-align: center;" class="col-md-3">이원</th>
				<th style="text-align: center;" class="col-md-3">사망</th>
			</tr>
			<tr style="text-align: center">
				<td id="inptntCnt"></td>
				<td id="rlsedCnt"></td>
				<td id="outCnt"></td>
				<td id="deathCnt"></td>
			</tr>
		</tbody>
	</table>
</div>
</div>