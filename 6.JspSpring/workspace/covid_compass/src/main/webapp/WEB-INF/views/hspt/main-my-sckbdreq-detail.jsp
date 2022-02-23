<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=553e55e7a953a05a2adfe2bfc2932452&libraries=services"></script>
</head>
<title>병상신청 정보조회</title>

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
function prettifyDetailDate(timeValue){
	if(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		
		var hour = dateObj.getHours();
		var minute = dateObj.getMinutes();
		var second = dateObj.getSeconds();
		
		date += '';
		if(date.length < 2){
			date = '0' + date;
		}
		month += '';
		if(month.length < 2){
			month = '0' + month;
		}
		hour += '';
		if(hour.length < 2){
			hour = '0' + hour;
		}
		minute += '';
		if(minute.length < 2){
			minute = '0' + minute;
		}
		second += '';
		if(second.length < 2){
			second = '0' + second;
		}
		
		
		return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
	}
}
function cancle_go(sckbdreqNo, childNo, type){
	
	if(!confirm('병상신청을 취소하시겠습니까?')) return; 
	
	var url = '<%=request.getContextPath()%>/rest-hspt/process-sckbdreq-cancle';
	
	var data =
		{
    		 'sckbdreqNo' : sckbdreqNo
    		,'childNo' : childNo
    		,'type' : type
    	}
	
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		data : data,
		success : function(dataMap) {
			alert('병상신청을 취소하였습니다.');
			CloseWindow();
		},
		error : function(error) {
			alert('error' + error.status);
		}
	})		
}
window.onload = function(){
  
  if('${resYmd}'){
    var resYmd = new Date('${resYmd}').getTime();
      $('#resYmd').html(prettifyDateFn(resYmd));
  }
  if('${sckbdReqYmd}'){
    var sckbdReqYmd = new Date('${sckbdReqYmd}').getTime();
      $('#sckbdReqYmd').html(prettifyDetailDate(sckbdReqYmd));
  }
	
  var test = false;
  var cancleYmd = new Date('${cancleYmd}').getTime();

  test = parseInt(Date.now()) < parseInt(cancleYmd);
	
  console.log(parseInt(Date.now()), parseInt(cancleYmd));
  console.log(test);
  
  console.log('${sckbdreqDetailCommand.lastRecord}' == true);
  console.log('${sckbdreqDetailCommand.lastRecord}' == 'true');

  // 가장 최신의 레코드인지 확인하라.
  if('${sckbdreqDetailCommand.lastRecord}' == 'true'){
	  // 승인대기상태이면 취소가능한지 판단하라.
	  if('${sckbdreqDetailCommand.sckbdreqCode}' == '승인대기'){
		  if(test){
			  $('#cancleBtn').attr('disabled', false);
		  }else{
			  $('#cancleBtn').attr('disabled', true);
		  }
	  	return;
	  }
  }
  
  // 가장 최신의 레코드가 아니면 취소버튼 비활성화
  
  // 승인대기상태가 아니면 취소버튼 비활성화
  $('#cancleBtn').attr('disabled', true);
  
  
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
                    		<label style="font-size: 17px; margin: 0px;">${sckbdreqDetailCommand.type eq 'A' ? '이원' : '입소'}신청 환자상세</label>
                    		<button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableOpenRrn(this);" data-enable="N" data-rrn="${sckbdreqDetailCommand.rrn }" data-manageNo="${sckbdreqDetailCommand.manageNo }">개인정보 열람</button>
                    	</div>                    
						<div id="hiddenRrn" style="display: none;">${sckbdreqDetailCommand.rrn }</div>
                    
                    </th>
                  </tr>
                </thead>
                <tbody id="req-inptnt-detail-info-module">
                  <tr class="ddoing req-inptnt-detail-info" style="height: 15px;"></tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th class="col-sm-3">성명</th>
                    <td class="col-sm-4">${sckbdreqDetailCommand.pstiNm }</td>
                    <th class="col-sm-2">국적</th>
                    <td class="col-sm-3">${sckbdreqDetailCommand.nlty }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>병상신청일자</th>
                    <td id="sckbdReqYmd"></td>
                    <th>백신접종</th>
                    <td>${sckbdreqDetailCommand.vacType }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>성별</th>
                    <td>${sckbdreqDetailCommand.gender }</td>
                    <th>나이</th>
                    <td>${sckbdreqDetailCommand.age }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>확정일자</th>
                    <td id="resYmd"></td>
                    <th>결과</th>
                    <td>${sckbdreqDetailCommand.pstvYn }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>발열여부</th>
                    <td>${sckbdreqDetailCommand.feverYn }</td>
                    <th>임신여부</th>
                    <td>${sckbdreqDetailCommand.pregnYn }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;">주민/외국인<br>등록번호</th>
                    <td id="openRrn">${fn:substring(sckbdreqDetailCommand.rrn,0,8) }******</td>
                    <th>연락처</th>
                    <td>${sckbdreqDetailCommand.pstiTelno }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>주소</th>
                    <td colspan="3">${sckbdreqDetailCommand.pstiAdres }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>증상</th>
                    <td colspan="3">${sckbdreqDetailCommand.symptms }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>병상신청기관</th>
                    <td>${sckbdreqDetailCommand.instNm }${sckbdreqDetailCommand.ltctNm }</td>
                    <th>기관연락처</th>
                    <td>${sckbdreqDetailCommand.instTelno }${sckbdreqDetailCommand.ltctTelno }</td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>신청기관 주소</th>
                    <td colspan="3">${sckbdreqDetailCommand.instAdres }${sckbdreqDetailCommand.ltctAdres }</td>
                  </tr>
                  <tr class="shittr">
                    <th>신청결과</th>
                    <td colspan="3">${sckbdreqDetailCommand.sckbdreqCode }</td>
                  </tr>                  
                </tbody>
              </table>
            </div>
            <div class="card-body pb-0" style="">
              <table class="table table-bordered">
                <tbody>
                  <tr class="shittr">
                    <th class="col-md-3">진료병원</th>
                    <td class="col-md-4" id="dgnssHsptNm">${sckbdreqDetailCommand.dgnssHsptNm }</td>
                    <th class="col-md-2">진료결과</th>
                    <td class="col-md-3" id="dgnssResultCode">${sckbdreqDetailCommand.dgnssResultCode }</td>
                  </tr>
                  <tr class="shittr">
                    <th rowspan="4" style="vertical-align: middle;">진료메모</th>
                    <td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="dgnssNote">${sckbdreqDetailCommand.dgnssNote }</td>
                  </tr>
                </tbody>
              </table>
                  <div class="form-group row" style="padding-top: 6px;">
                    <div class="col-md-6"></div>
                    <div class="col-md-3">
                      <button type="button" id="cancleBtn" class="btn btn-block btn-primary btn-sm" style="background-color: #1a4f72; border-color: #1a4f72;"
                              onclick="cancle_go('${sckbdreqDetailCommand.sckbdreqNo}','${sckbdreqDetailCommand.childNo }', '${sckbdreqDetailCommand.type }');">${sckbdreqDetailCommand.type eq 'A' ? '이원' : '입소'}신청취소</button>
                    </div>
                    <div class="col-md-3">
                      <button type="button" class="btn btn-block btn-danger btn-sm" onclick="window.close();">닫기</button>
                    </div>
                  </div>
            </div>
          </div>
        </section>

</body>