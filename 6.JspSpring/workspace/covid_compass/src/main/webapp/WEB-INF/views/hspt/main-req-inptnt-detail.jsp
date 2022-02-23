<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=553e55e7a953a05a2adfe2bfc2932452&libraries=services"></script>
</head>
<title>병상승인대기 조회</title>

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



function accept_go(sckbdreqNo, manageNo, childNo, requestCode){
  //alert('accept_go');
  
  if(!confirm('병상신청을 승인하시겠습니까?')) return;
  
  var url = '<%=request.getContextPath()%>/rest-hspt/process-sckbdreq-accept';
  
  var data = 
	  {
		  'sckbdreqNo' : sckbdreqNo
		 ,'manageNo' : manageNo
		 ,'childNo' : childNo
		 ,'requestCode' : requestCode
	  }
  
  $.ajax({
      url : url,
      type : 'post',
      dataType : 'json',
      data : data,
      success : function(dataMap){
        if(dataMap.msg == "success"){
        	alert('병상신청을 승인하셨습니다.')
        }else{
        	alert(dataMap.msg);
        }
    	window.opener.location.reload(true);		
    	window.close();
      },
      error : function(error){
        alert('error' + error.status);
      }
    }); 
}
function reject_go(sckbdreqNo){
  //alert('reject_go');
  if(!confirm('병상신청을 반려하시겠습니까?')) return;
  
  var url = '<%=request.getContextPath()%>/rest-hspt/process-sckbdreq-reject';
  
  var data = 
	  {
		  'sckbdreqNo' : sckbdreqNo
	  }
  
  $.ajax({
      url : url,
      type : 'post',
      dataType : 'json',
      data : data,
      success : function(dataMap){
          if(dataMap.msg == "success"){
          	alert('병상신청을 반려하셨습니다.')
          }else{
          	alert(dataMap.msg);
          };
      	  window.opener.location.reload(true);		
    	  window.close();
      },
      error : function(error){
        alert('error' + error.status);
      }
  });
}
    

window.onload = function(){
  
  if('${resYmd}'){
    var resYmd = new Date('${resYmd}').getTime();
      $('#resYmd').html(prettifyDateFn(resYmd));
  }
  if('${sckbdReqYmd}'){
    var sckbdReqYmd = new Date('${sckbdReqYmd}').getTime();
      $('#sckbdReqYmd').html(prettifyDateFn(sckbdReqYmd));
  }
}

</script>

<section class="content">
          <div class="card" style="margin: 1px; height: 763px; margin-top: 13px;">
            <div class="card-body pb-0" style="padding-top: 8px;">
              <table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
                <thead>
                  <tr>
                    <th colspan="4" style="font-size: 17px; padding: 7px;">
                        <div class="row m-0" style="justify-content: space-between;">
                    		<label style="font-size: 17px; margin: 0px;">승인대기 환자상세</label>
                    		<button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableOpenRrn(this);" data-enable="N" data-rrn="${reqInptntDetailCommand.rrn }" data-manageNo="${reqInptntDetailCommand.manageNo }">개인정보 열람</button>
                    	</div>                    
						<div id="hiddenRrn" style="display: none;">${reqInptntDetailCommand.rrn }</div>         
                    </th>
                  </tr>
                </thead>
                <tbody id="req-inptnt-detail-info-module">
                  <tr class="ddoing req-inptnt-detail-info" style="height: 15px;"></tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th class="col-sm-3">성명</th>
                    <td class="col-sm-4">${reqInptntDetailCommand.pstiNm }</td>
                    <th class="col-sm-2">국적</th>
                    <td class="col-sm-3">${reqInptntDetailCommand.nlty }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>병상신청일자</th>
                    <td id="sckbdReqYmd"></td>
                    <th>백신접종</th>
                    <td>${reqInptntDetailCommand.vacType }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>성별</th>
                    <td>${reqInptntDetailCommand.gender }</td>
                    <th>나이</th>
                    <td>${reqInptntDetailCommand.age }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>확정일자</th>
                    <td id="resYmd"></td>
                    <th>결과</th>
                    <td>${reqInptntDetailCommand.pstvYn }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>발열여부</th>
                    <td>${reqInptntDetailCommand.feverYn }</td>
                    <th>임신여부</th>
                    <td>${reqInptntDetailCommand.pregnYn }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;">주민/외국인<br>등록번호</th>
                    <td id="openRrn">${fn:substring(reqInptntDetailCommand.rrn,0,8) }******</td>
                    <th>연락처</th>
                    <td>${reqInptntDetailCommand.pstiTelno }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>주소</th>
                    <td colspan="3">${reqInptntDetailCommand.pstiAdres }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>증상</th>
                    <td colspan="3">${reqInptntDetailCommand.symptms }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>병상신청기관</th>
                    <td>${reqInptntDetailCommand.instNm }</td>
                    <th>기관연락처</th>
                    <td>${reqInptntDetailCommand.instTelno }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>신청기관 주소</th>
                    <td colspan="3">${reqInptntDetailCommand.instAdres }</td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="card-body pb-0" style="">
              <table class="table table-bordered">
                <tbody>
                  <tr class="shittr">
                    <th class="col-md-3">진료병원</th>
                    <td class="col-md-4" id="dgnssHsptNm">${reqInptntDetailCommand.dgnssHsptNm }</td>
                    <th class="col-md-2">진료결과</th>
                    <td class="col-md-3" id="dgnssResultCode">${reqInptntDetailCommand.dgnssResultCode }</td>
                  </tr>
                  <tr class="shittr">
                    <th rowspan="4" style="vertical-align: middle;">진료메모</th>
                    <td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="dgnssNote">${reqInptntDetailCommand.dgnssNote }</td>
                  </tr>
                </tbody>
              </table>
                  <div class="form-group row" style="padding-top: 6px;">
                    <div class="col-md-3">
                      <button type="button" class="btn btn-block btn-primary btn-sm" style="background-color: #1a4f72; border-color: #1a4f72;"
                              onclick="accept_go('${sckbdreqNo}','${manageNo }','${childNo }','${requestCode }');">승인</button>
                    </div>
                    <div class="col-md-3">
                      <button type="button" class="btn btn-block btn-danger btn-sm" 
                              onclick="reject_go('${sckbdreqNo}');">반려</button>
                    </div>
                    <div class="col-md-3"></div>
                    <div class="col-md-3">
                      <button type="button" class="btn btn-block btn-danger btn-sm" onclick="window.close();">닫기</button>
                    </div>
                  </div>
            </div>
          </div>
        </section>

</body>


