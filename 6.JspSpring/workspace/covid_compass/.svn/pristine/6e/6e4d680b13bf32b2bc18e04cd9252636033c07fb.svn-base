<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/x-handlebars-template" id="sckbd-detail-template">
<div class="sckbd-detail-element">
<table class="table table-bordered">
  <tbody>
    <tr style="text-align: left;">
      <th class="col-md-2">성명</th>
      <td class="col-md-4">{{pstiNm}}</td>
      <th class="col-md-2">국적</th>
      <td class="col-md-4">{{nlty}}</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>백신접종</th>
      <td>{{vac}}</td>
 	  <th>결과</th>
      <td>{{fnsmplResCode smplResCode}}</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>성별</th>
      <td>{{fnGender gender}}</td>
      <th>나이</th>
      <td>{{age}}</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>발열여부</th>
      <td>{{feverYn}}</td>
      <th>임신여부</th>
      <td>{{pregnYn}}</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>확정일자</th>
      <td>{{prettifyDate inYmd}}</td>
      
	  <th>신청일자</th>
      <td>{{prettifyDate sckbdreqYmd}}</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;">주민/외국인<br>등록번호</th>
      <td id="dataRrn">{{rrn}}</td>
      <th>연락처</th>
      <td>{{pstiTelno}}</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>주소</th>
      <td colspan="3">{{pstiAdres}}</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>증상</th>
      <td colspan="3">{{symptms}}</td>
    </tr>
  </tbody>
</table>
		<table class="table table-bordered">
		<tbody>
			<tr class="shittr">
				<th class="col-md-2">진료병원</th>
				<td class="col-md-4" id="slf_inst_nm">{{instNm}}</td>
				<th class="col-md-2">진료결과</th>
				<td class="col-md-4" id="slf_dgnss_result_code">{{fnDgnssResult dgnssResultCode}}</td>
			</tr>
			<tr class="shittr" style="text-align: left;">
				<th style="vertical-align: middle;">진료메모</th>
				<td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="slf_dgnss_note">{{dgnssNote}}</td>
			</tr>
		</tbody>
	</table>
<div class="form-group row">
  <div class="col-md-6"></div>
  <div class="col-md-3">
    <button id="sckbdreqOkBtn" type="button" onclick="sckbdreqOK();" class="btn btn-block btn-sm" style="background-color: #1a4f72; color: white; border-color: #1a4f72;">승인</button>
  </div>
  <div class="col-md-3">
    <button id="sckbdreqReturnBtn" type="button" onclick="sckbdreqReturn();" class="btn btn-block btn-danger btn-sm">반려</button>
  </div>
</div>
<input type="hidden" id="pstiNm" value="{{pstiNm}}">
<input type="hidden" id="hsptNo" value="{{hsptNo}}">
<input type="hidden" id="manageNo" value="{{manageNo}}">
</div>
</script>
<script>
function sckbdreqOK(){
	var pstiNm = $('#pstiNm').val();
	var manageNo = $('#manageNo').val();
	var hsptNo = $('#hsptNo').val();
	var datas = manageNo + "," + hsptNo;
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-ltct/sckbdreq-ok',
		type : 'post',
		data: {'datas' : datas},
		success : function(success){
			alert(pstiNm+"님의 입소신청이 승인되었습니다.");
			location.reload();
		},
		error : function(error){
// 			alert('error' + error.status);
		}
	})
}

function sckbdreqReturn(){
	var pstiNm = $('#pstiNm').val();
	var manageNo = $('#manageNo').val();
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-ltct/sckbdreq-return',
		type: 'post',
		data : {'manageNo' : manageNo},
		success : function(success){
			alert(pstiNm+"님의 입소신청이 반려되었습니다.");
			location.reload();
		},
		error : function(error){
// 			alert('error' + error.status);
		}
	})
}
function showDetail(manageNo){
	var trs = $('tr.each-sckbd-element');
	
	trs.removeClass('on');
	
	var target = $('tr[data-manage-no="'+manageNo+'"]');
	
	target.addClass('on');

	var url = '<%=request.getContextPath()%>/rest-ltct/sckbd-detail?manageNo='+manageNo;
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		success : function(basicDetail){
			
			$('#enableReadRrn').data('rrn', basicDetail.rrn);
			$('#enableReadRrn').data('manageNo', manageNo);
	      	basicDetail.rrn = (basicDetail.rrn.substring(0,8) + '******');
			
			printData(basicDetail, $('#sckbd-detail-module'), $('#sckbd-detail-template'), '.sckbd-detail-element');
		},
		error : function(error){
// 			alert('error' + error.status);
		}
	});
}
</script>

<div id="sckbd-detail-module">
<div class="sckbd-detail-element">
<table class="table table-bordered">
  <tbody>
    <tr style="text-align: left;">
      <th class="col-md-2">성명</th>
      <td class="col-md-4"></td>
      <th class="col-md-2">국적</th>
      <td class="col-md-4"></td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>백신접종</th>
      <td></td>
 	  <th>결과</th>
      <td></td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>성별</th>
      <td></td>
      <th>나이</th>
      <td></td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>발열여부</th>
      <td></td>
      <th>임신여부</th>
      <td></td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>확정일자</th>
      <td></td>
      
	  <th>신청일자</th>
      <td></td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;">주민/외국인<br>등록번호</th>
      <td></td>
      <th>연락처</th>
      <td></td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>주소</th>
      <td colspan="3"></td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>증상</th>
      <td colspan="3"></td>
    </tr>
  </tbody>
</table>
		<table class="table table-bordered">
		<tbody>
			<tr class="shittr">
				<th class="col-md-2">진료병원</th>
				<td class="col-md-4" id="slf_inst_nm"></td>
				<th class="col-md-2">진료결과</th>
				<td class="col-md-4" id="slf_dgnss_result_code"></td>
			</tr>
			<tr class="shittr" style="text-align: center;">
				<th style="vertical-align: middle;">진료메모</th>
				<td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="slf_dgnss_note"></td>
			</tr>
		</tbody>
	</table>
<div class="form-group row">
  <div class="col-md-6"></div>
  <div class="col-md-3">
    <button id="sckbdreqOkBtn" type="button" onclick="sckbdreqOK();" class="btn btn-block btn-sm" style="background-color: #1a4f72; color: white; border-color: #1a4f72;">승인</button>
  </div>
  <div class="col-md-3">
    <button id="sckbdreqReturnBtn" type="button" onclick="sckbdreqReturn();" class="btn btn-block btn-danger btn-sm">반려</button>
  </div>
</div>
<input type="hidden" id="pstiNm" value="{{pstiNm}}">
<input type="hidden" id="hsptNo" value="{{hsptNo}}">
<input type="hidden" id="manageNo" value="{{manageNo}}">
</div>
</div>
