<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="sckbdCountAndStats-template">
<table class="table table-bordered hold-element">
	<thead>
		<tr>
			<th colspan="5" style="text-align:center;">현황</th>
		</tr>
	</thead>
	<tbody>
		<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
			<th class="col-md-2" style="text-align:center";>총 병상</th>
			<th class="col-md-2" style="text-align:center";>입소환자</th>
			<th class="col-md-2" style="text-align:center";>잔여병상</th>
			<th class="col-md-2" style="text-align:center";>승인대기</th>
			<th class="col-md-2" style="text-align:center";>가동률</th>
		</tr>
		<tr style="text-align: center">
			<td>{{sckbdCnt}}</td>
			<td><span class="badge badge-primary" style="width: 45px;">{{isoptntCount}}</span></td>
			<td><span class="badge badge-info" style="width: 45px;">{{fnRmndSckbdCnt rmndSckbdCnt}}</span></td>
			<td><span class="badge badge-success" style="width: 45px;">{{sckbdreqCount}}</span></td>
			<td><span class="badge badge-{{fnBadgesckbdCnt rmndSckbdCnt sckbdCnt}}" style="width: 45px;">{{fnUsePer rmndSckbdCnt sckbdCnt}}%</span></td>
		</tr>
	</tbody>
</table>
<table class="table table-bordered hold-element" style="margin-top:25px;">
	<thead>
		<tr>
			<th colspan="4" style="text-align:center;">전날 현황</th>
		</tr>
	</thead>
	<tbody>
		<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
			<th class="col-md-3" style="text-align:center";>진료요청</th>
			<th class="col-md-3" style="text-align:center";>격리인원</th>
			<th class="col-md-3" style="text-align:center";>이원인원</th>
			<th class="col-md-3" style="text-align:center";>퇴원인원</th>
		</tr>
		<tr style="text-align: center">
			<td>{{reqDgnssCnt}}</td>
			<td>{{inIsoptntCnt}}</td>
			<td>{{outIsoptntCnt}}</td>
			<td>{{rlsedCnt}}</td>
		</tr>
	</tbody>
</table>
</script>
<script type="text/x-handlebars-template" id="nopeCountAndStats-template">
<table class="table table-bordered hold-element">
							<thead>
								<thead>
									<tr>
										<th colspan="5" style="text-align:center;">현황</th>
									</tr>
								</thead>
							</thead>
							<tbody>
								<tr
									style="text-align: center; font-weight: bold; background-color: #f5fafc">
									<th style="text-align:center";>총 병상</th>
									<th style="text-align:center";>입소환자</th>
									<th style="text-align:center";>잔여병상</th>
									<th style="text-align:center";>승인대기</th>
									<th style="text-align:center";>가동률</th>
								</tr>
								<tr style="text-align: center">
									<td>0</td>
									<td><span class="badge badge-primary" style="width: 45px;">0</span></td>
									<td><span class="badge badge-info" style="width: 45px;">0</span></td>
									<td><span class="badge badge-success" style="width: 45px;">0</span></td>
									<td><span class="badge badge-success">0</span></td>
								</tr>
							</tbody>
						</table>
						<table class="table table-bordered hold-element" style="margin-top:25px;">
							<thead>
								<thead>
									<tr>
										<th colspan="4" style="text-align:center;">전날 현황</th>
									</tr>
								</thead>
							</thead>
							<tbody>
								<tr
									style="text-align: center; font-weight: bold; background-color: #f5fafc">
									<th class="col-md-3" style="text-align:center";>진료요청</th>
									<th class="col-md-3" style="text-align:center";>격리인원</th>
									<th class="col-md-3" style="text-align:center";>이원인원</th>
									<th class="col-md-3" style="text-align:center";>퇴원인원</th>
								</tr>
								<tr style="text-align: center">
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
							</tbody>
						</table>
</script>
<script>
function getSckbdCountAndStats(){
	$.ajax({
		url: '<%=request.getContextPath()%>/rest-ltct/main-sckbdCountAndStats',
		type : 'post',
		dataType: 'json',
		success:function(sckbdCountAndStats){
			printData(sckbdCountAndStats, $('#res-table'), $('#sckbdCountAndStats-template'), '.hold-element');
		},
		error : function(error){
			alert("등록된 병상이 없습니다. 병상을 등록해주세요.");
			printData(sckbdCountAndStats, $('#res-table'), $('#nopeCountAndStats-template'), '.hold-element');
		}
	})
}
</script>
<div class="card" style="height: 324px;">
					<div class="card-header ui-sortable-handle">
								<h3 class="card-title">
									병상관리
								</h3>
								<div class="card-tools ">
									<i class="ion ion-clipboard mr-1"></i><b>잔여병상수 <span id="rmndSckbdCount"></span>개</b>
									<button type="button" class="btn btn-tool" onclick="OpenWindow('./sckbd-modify','병상등록 페이지', 800,550)">
										<i class="fas fa-plus" style="color: black"></i>
									</button>
								</div>

					</div>
					<div class="card-body" id="res-table">
						<table class="table table-bordered hold-element">
								<tr style="text-align: center; font-weight: bold; background-color: #f5fafc">
									<td>페이지 로딩중 입니다.</td>
								</tr>
						</table>
						
					</div>
				</div>