<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=553e55e7a953a05a2adfe2bfc2932452&libraries=services"></script>
</head>
<title>피검자 상세</title>

<body>

	<script>
function prettifyDateFn(timeValue){
  if(timeValue){
    var dateObj = new Date(timeValue);
    var year = dateObj.getFullYear();
    var month = dateObj.getMonth() + 1;
    month += '';
    if(month.length < 2){
      month = '0' + month;
    }
    var date = dateObj.getDate();
    date += '';
    if(date.length < 2){
      date = '0' + date;
    }
    return year + "-" + month + "-" + date;
  }
}
window.onload = function(){
  
  if('${wrtYmd}'){
    var wrtYmd = new Date('${wrtYmd}').getTime();
      $('#wrtYmd').html(prettifyDateFn(wrtYmd));
  }
  if('${reqYmd}'){
    var reqYmd = new Date('${reqYmd}').getTime();
      $('#reqYmd').html(prettifyDateFn(reqYmd));
  }
  if('${resYmd}'){
    var resYmd = new Date('${resYmd}').getTime();
      $('#resYmd').html(prettifyDateFn(resYmd));
  }
}

</script>

	<section class="content">
		<div class="" style="margin: 1px; margin-top: 13px;">
			<div class="card-body pb-0" style="padding-top: 8px;">
				<table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
					<thead>
						<tr>
							<th colspan="4" style="font-size: 17px; padding: 7px;">
              
                              <div class="row m-0" style="justify-content: space-between;">
                                <label style="font-size: 17px; margin: 0px;">피검자 상세</label>
                                <button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableOpenRrn(this);" data-enable="N" data-rrn="${psti.rrn }" data-manageNo="${psti.pstiNo }">개인정보 열람</button>
                                <div id="hiddenRrn" style="display: none;">${psti.rrn }</div>
                              </div>
              
                          </th>
						</tr>
					</thead>
					<tbody id="dgnss-detail-info-module">
						<tr class="ddoing dgnss-detail-info" style="height: 15px;"></tr>
						<tr class="shittr dgnss-detail-info">
							<th class="col-xs-3">성명</th>
							<td class="col-xs-4">${psti.pstiNm }</td>
							<th class="col-xs-2">국적</th>
							<td class="col-xs-3">${psti.nlty }</td>
						</tr>

						<tr class="shittr dgnss-detail-info">
							<th>성별</th>
							<td>${psti.gender }</td>
							<th>나이</th>
							<td>${psti.age }</td>
						</tr>
						<tr class="shittr dgnss-detail-info">
							<th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;" >주민/외국인<br>등록번호</th>
							<td id="openRrn">${fn:substring(psti.rrn,0,8) }******</td>
							<th>연락처</th>
							<td>${psti.pstiTelno }</td>
						</tr>
						<tr class="shittr">
							<th>직업</th>
							<td colspan="3">${psti.jobCode }</td>
						</tr>
						<tr class="shittr dgnss-detail-info">
							<th>주소</th>
							<td colspan="3">${psti.pstiAdres }</td>
						</tr>

						<tr class="shittr dgnss-detail-info">
							<th>문진표작성일</th>
							<td id="wrtYmd"></td>
							<th>검사경위</th>
							<td>${psti.rechkdYn }</td>
						</tr>
						<tr class="shittr dgnss-detail-info">
							<th>백신접종</th>
							<td>${psti.vacCode }</td>
							<th>발열여부</th>
							<td>${psti.pregnYn }</td>
						</tr>
						<tr class="shittr dgnss-detail-info">
							<th>증상</th>
							<td colspan="3">${psti.symptms }</td>
						</tr>
					</tbody>
				</table>
				<br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="4">검사결과 정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="col-xs-3"><strong>요청일자</strong></th>
							<td class="col-xs-4" id="reqYmd"></td>
							<th class="col-xs-2"><strong>검사기관</strong></th>
							<td class="col-xs-3" id="pbhtNm">${pbhtNm }</td>
						</tr>
						<tr>
							<th><strong>확정일자</strong></th>
							<td id="resYmd"></td>
							<th><strong>검사결과</strong></th>
							<td>${pstvYn }</td>
						</tr>
					</tbody>
				</table>
				<br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="4">검사 요청기관</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="col-xs-3"><strong>요청기관</strong></th>
							<td class="col-xs-4" id="reqInstNm">${insp.instNm }</td>
							<th class="col-xs-2"><strong>연락처</strong></th>
							<td class="col-xs-3" id="instTelno">${insp.instTelno }</td>
						</tr>

						<tr>
							<th><strong>주소</strong></th>
							<td colspan="3" id="instAdres">${insp.instAdres }</td>
						</tr>

						<tr class="shittr" style="text-align: center;">
							<td colspan="4">
								<button type="button" style="background-color: #1a4f72; border-color: #1a4f72;" class="btn btn-block btn-primary btn-sm" onclick="window.close();">닫기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<!-- /.card -->
		</div>
		<!-- search bar -->
	</section>

</body>

