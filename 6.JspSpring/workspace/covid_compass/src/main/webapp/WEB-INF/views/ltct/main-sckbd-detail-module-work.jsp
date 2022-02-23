<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head></head>
<title>병상신청 상세정보</title>

<body>
<c:set var="reqsckbd" value="${sckbdreq}" />
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
			alert(pstiNm+"님의 병상신청 승인이 정상적으로 처리되었습니다.");
			window.opener.parent.location.reload();
			window.close();
		},
		error : function(error){
			alert('error' + error.status);
		}
	})
}
function Close(){
	var check = confirm("페이지를 닫으시겠습니까?");
	if(check){
		window.close();
	}else{
		return;
	}
}
function sckbdreqReturn(){
	var pstiNm = $('#pstiNm').val();
	var manageNo = $('#manageNo').val();
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-ltct/sckbdreq-return',
		type: 'post',
		data : {'manageNo' : manageNo},
		success : function(success){
			alert(pstiNm+"님의 병산신청이 반려되었습니다.");
			window.opener.parent.location.reload();
			window.close();
		},
		error : function(error){
			alert('error' + error.status);
		}
	})
}
</script>
<div class="col-lg-1"></div>
<div id="sckbd-detail-module">
<div class="sckbd-detail-element col-lg-10">
<table class="table table-bordered" style=" margin-top:10px; border-left-color: white; border-right-color: white;">
					<thead>
						<tr>
							<th style="font-size: 17px;">
								<div class="row m-0" style="justify-content: space-between;">
		                    		<label style="font-size: 17px; margin: 0px;">병상신청 상세정보</label>
		                    		<button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableOpenRrn(this);" data-enable="N" data-rrn="${reqsckbd.rrn }" data-manageNo="${reqsckbd.manageNo }">개인정보 열람</button>
		                    		<div id="hiddenRrn" style="display: none;">${reqsckbd.rrn }</div>
		                    	</div>
							</th>
						</tr>
					</thead>
						<tr class="ddoing" style="height: 5px; border : 1px solid white;"></tr>
					</table>
<table class="table table-bordered">
  <tbody>
    <tr style="text-align: left;">
      <th class="col-md-2">성명</th>
      <td class="col-md-4">${reqsckbd.pstiNm }</td>
      <th class="col-md-2">국적</th>
      <td class="col-md-4">${reqsckbd.nlty }</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>백신접종</th>
      <td>${reqsckbd.vac }</td>
 	  <th>결과</th>
      <td>${reqsckbd.smplResCode eq 'K101' ? '검사중' : reqsckbd.smplResCode eq 'K102' ? '양성' : reqsckbd.smplResCode eq 'K103' ? '음성' : '' }</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>성별</th>
      <td>${reqsckbd.gender eq 'M' ? '남' : '여' }</td>
      <th>나이</th>
      <td>${reqsckbd.age }</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>발열여부</th>
      <td>${reqsckbd.feverYn }</td>
      <th>임신여부</th>
      <td>${reqsckbd.pregnYn }</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>확정일자</th>
      <td><fmt:formatDate value="${reqsckbd.inYmd }" pattern="yyyy-MM-dd"/></td>
      
	  <th>신청일자</th>
      <td><fmt:formatDate value="${reqsckbd.sckbdreqYmd }" pattern="yyyy-MM-dd"/></td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;">주민/외국인<br>등록번호</th>
      <td id="openRrn">${fn:substring(reqsckbd.rrn,0,8) }******</td>
      <th>연락처</th>
      <td>${reqsckbd.pstiTelno }</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>주소</th>
      <td colspan="3">${reqsckbd.pstiAdres }</td>
    </tr>
    <tr class="shittr" style="text-align: left;">
      <th>증상</th>
      <td colspan="3">${reqsckbd.symptms }</td>
    </tr>
  </tbody>
</table>
		<table class="table table-bordered">
		<tbody>
			<tr class="shittr">
				<th class="col-md-2">진료병원</th>
				<td class="col-md-4" id="slf_inst_nm">${reqsckbd.instNm }</td>
				<th class="col-md-2">진료결과</th>
				<td class="col-md-4" id="slf_dgnss_result_code">${reqsckbd.dgnssResultCode eq 'D101' ? '중증 및 중등증' : reqsckbd.dgnssResultCode eq 'D102' ? '미중증 및 경증' : reqsckbd.dgnssResultCode eq 'D103' ? '무증상' : ''}</td>
			</tr>
			<tr class="shittr" style="text-align: center;">
				<th style="vertical-align: middle;">진료메모</th>
				<td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="slf_dgnss_note">${reqsckbd.dgnssNote }</td>
			</tr>
		</tbody>
	</table>
<div class="form-group row">
  <div class="col-md-3">
    <button type="button" onclick="sckbdreqOK();" class="btn btn-block btn-primary" style="background-color: #1a4f72; color: white; border-color: #1a4f72;">승인</button>
  </div>
  <div class="col-md-3">
    <button type="button" onclick="sckbdreqReturn();" class="btn btn-block btn-primary" style="background-color: #c82333; color: #fff; border-color: #bd2130;">반려</button>
  </div>
  <div class="col-md-3"></div>
  <div class="col-md-3" style="float:right;">
  	<button class="btn btn-block btn-primary" onclick="Close();" type="button" style="background-color: #c82333; border-color: #bd2130;">닫기</button>
  </div>
</div>
<input type="hidden" id="pstiNm" value="${reqsckbd.pstiNm}">
<input type="hidden" id="hsptNo" value="${reqsckbd.hsptNo}">
<input type="hidden" id="manageNo" value="${reqsckbd.manageNo}">
</div>
</div>
<div class="col-lg-1"></div>
</body>