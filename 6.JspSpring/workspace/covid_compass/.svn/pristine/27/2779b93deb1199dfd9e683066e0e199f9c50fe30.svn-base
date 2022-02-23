<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=553e55e7a953a05a2adfe2bfc2932452&libraries=services"></script>
</head>
<title>입원환자 조회</title>

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
  
  if('${inYmd}'){
    var inYmd = new Date('${inYmd}').getTime();
      $('#inYmd').html(prettifyDateFn(inYmd));
  }
//  if({})
//    dgnss-note-td
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
                    		<label style="font-size: 17px; margin: 0px;">입원환자 상세</label>
                    		<button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableOpenRrn(this);" data-enable="N" data-rrn="${inptntDetailCommand.rrn }" data-manageNo="${inptntDetailCommand.manageNo }">개인정보 열람</button>
                    	</div>                    
						<div id="hiddenRrn" style="display: none;">${inptntDetailCommand.rrn }</div>
                    
                    </th>
                  </tr>
                </thead>
                <tbody id="dgnss-detail-info-module">
                  <tr class="ddoing dgnss-detail-info" style="height: 15px;"></tr>
                  <tr class="shittr dgnss-detail-info">
                    <th class="col-sm-3">성명</th>
                    <td class="col-sm-4">${inptntDetailCommand.pstiNm }</td>
                    <th class="col-sm-2">국적</th>
                    <td class="col-sm-3">${inptntDetailCommand.nlty }</td>
                  </tr>
                  
                  <tr class="shittr dgnss-detail-info">
                    <th>입원일</th>
                    <td id="inYmd"></td>
                    <th>중증도</th>
                    <td>${inptntDetailCommand.dgnssResultCode }</td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th>성별</th>
                    <td>${inptntDetailCommand.gender }</td>
                    <th>나이</th>
                    <td>${inptntDetailCommand.age }</td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th>발열여부</th>
                    <td>${inptntDetailCommand.feverYn }</td>
                    <th>임신여부</th>
                    <td>${inptntDetailCommand.pregnYn }</td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;">주민/외국인<br>등록번호</th>
                    <td id="openRrn">${fn:substring(inptntDetailCommand.rrn,0,8) }******</td>
                    <th>연락처</th>
                    <td>${inptntDetailCommand.pstiTelno }</td>
                  </tr>
                  <tr class="shittr">
                    <th>직업</th>
                    <td colspan="3">${inptntDetailCommand.jobCode }</td>
                  </tr>                  
                  <tr class="shittr dgnss-detail-info">
                    <th>주소</th>
                    <td colspan="3">${inptntDetailCommand.pstiAdres }</td>
                  </tr>
                  <tr class="shittr dgnss-detail-info">
                    <th>증상</th>
                    <td colspan="3">${inptntDetailCommand.symptms }</td>
                  </tr>
                  <tr class="shittr" style="text-align: center;">
                    <th style="vertical-align: middle;">진료메모</th>
                    <td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="dgnss-note-td">${inptntDetailCommand.dgnssNote }</td>
                  </tr>           
                </tbody>
              </table>
              <div class="row" style="flex-direction: row-reverse; padding-top: 5px;" >
	         		<div class="col-md-12">
	           			<button type="button" class="btn btn-block btn-danger btn-sm" onclick="window.close();">닫기</button>
	           		</div>
	             </div>
              </div>

            <!-- /.card -->
          </div>
          <!-- search bar -->
        </section>

</body>

