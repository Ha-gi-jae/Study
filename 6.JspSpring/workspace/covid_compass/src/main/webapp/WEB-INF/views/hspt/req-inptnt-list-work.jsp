<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<style>
.on {
	background-color: rgb(236, 236, 236);
}
</style>
</head>
<title></title>
<body>
  <section class="content">
    <div class="row" style="margin: 1px; margin-top: 7px;">
      <div class="col-lg-6 pl-0">
        <section class="content">
          <div class="card" style="margin: 1px; height: 763px; margin-top: 13px;">
            <div class="card-header d-flex p-0">
              <ul class="nav nav-pills ml-auto p-2" role="tablist">
                <li class="nav-item"><div class="input-group float-right" style="max-width: 600px; width: 300px;">
                    <!-- search bar -->
                    <select class="form-control " name="searchType" id="searchType">
                      <option value="" ${pageMaker.cri.searchType eq '' ? 'selected':''}>검색구분</option>
                      <option value="name" ${pageMaker.cri.searchType eq 'name' ? 'selected':''}>성 명</option>
                      <option value="telno" ${pageMaker.cri.searchType eq 'telno' ? 'selected':''}>전화번호</option>
                      <option value="instNm" ${pageMaker.cri.searchType eq 'instNm' ? 'selected':''}>신청기관명</option>
                    </select>

                    <!-- keyword -->
                    <input class="form-control" type="text" name="keyword" value="${pageMaker.cri.keyword }" style="width: 18%; display: inline-block;" /> <span class="input-group-append">
                      <button class="btn btn-primary" type="button" id="searchBtn" style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px; margin-left: -7px;" data-card-widget="search" onclick="list_go('1', '<%=request.getContextPath()%>/rest-hspt/req-inptnt-list');">
                        <i class="fa fa-fw fa-search"></i>
                      </button>
                    </span>
                    <!-- end : search bar -->
                  </div></li>
              </ul>
            </div>
            <div class="card-body">
              <div class="tab-content" id="custom-tabs-three-tabContent">
                <div class="tab-pane fade show active" id="custom-psti-detail" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
                  <%@ include file="./req-inptnt-list-module-work.jsp"%>
                </div>
              </div>
            </div>
            <!-- /.card -->
          </div>

        </section>

      </div>
      <div class="col-lg-6 pr-0">
        <section class="content">
          <div class="card" style="margin: 1px; height: 763px; margin-top: 13px;">
            <div class="card-body pb-0" style="padding-top: 8px;">
              <table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
                <thead>
                  <tr>
                    <th colspan="4" style="font-size: 17px; padding: 7px;">
                    
                        <div class="row m-0" style="justify-content: space-between;">
                    		<label style="font-size: 17px; margin: 0px;">승인대기 환자상세</label>
                    		<button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
                    	</div>
                    	
                    </th>
                  </tr>
                </thead>
                <tbody id="req-inptnt-detail-info-module">
                  <tr class="ddoing req-inptnt-detail-info" style="height: 15px;"></tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th class="col-sm-3">성명</th>
                    <td class="col-sm-4"></td>
                    <th class="col-sm-2">국적</th>
                    <td class="col-sm-3"></td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>병상신청일자</th>
                    <td></td>
                    <th>백신접종</th>
                    <td></td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>성별</th>
                    <td></td>
                    <th>나이</th>
                    <td></td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>확정일자</th>
                    <td></td>
                    <th>결과</th>
                    <td></td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>발열여부</th>
                    <td></td>
                    <th>임신여부</th>
                    <td></td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>주민/외국인등록번호</th>
                    <td></td>
                    <th>연락처</th>
                    <td></td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>주소</th>
                    <td colspan="3"></td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>증상</th>
                    <td colspan="3"></td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>병상신청기관</th>
                    <td></td>
                    <th>기관연락처</th>
                    <td></td>
                  </tr>
                  <tr class="shittr req-inptnt-detail-info">
                    <th>신청기관 주소</th>
                    <td colspan="3"></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="card-body pb-0" style="">
              <table class="table table-bordered">
                <tbody>
                  <tr class="shittr">
                    <th class="col-md-3">진료병원</th>
                    <td class="col-md-4" id="dgnssHsptNm"></td>
                    <th class="col-md-2">진료결과</th>
                    <td class="col-md-3" id="dgnssResultCode"></td>
                  </tr>
                  <tr class="shittr">
                    <th rowspan="4" style="vertical-align: middle;">진료메모</th>
                    <td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="dgnssNote"></td>
                  </tr>
                </tbody>
              </table>
              <div class="form-group row" style="padding-top: 70px;">
                <div class="col-md-6"></div>
                <div class="col-md-3">
                  <button type="button" class="btn btn-block btn-primary btn-sm" style="background-color: #1a4f72; border-color: #1a4f72;" id="agree-btn" onclick="accept_go();">승인</button>
                </div>
                <div class="col-md-3">
                  <button type="button" class="btn btn-block btn-danger btn-sm" id="reject-btn" onclick="reject_go();">반려</button>
                </div>
              </div>
            </div>
            <form name="sckbdreqProcessForm" style="display: none;">
              manageNo<input type="text" name="manageNo"> sckbdreqNo<input type="text" name="sckbdreqNo"> type<input type="text" name="type"> requestCode<input type="text" name="requestCode"> hsptNo<input type="text" name="hsptNo"> childNo<input type="text" name="childNo">
            </form>
          </div>
        </section>
        <!-- /.card -->
      </div>
      <!-- search bar -->
    </div>
  </section>
<script type="text/x-handlebars-template" id="req-inptnt-detail-template">
     <tr class="ddoing req-inptnt-detail-info" style="height: 15px;"></tr>
      <tr class="req-inptnt-detail-info">
        <th class="col-sm-3">성명</th>
        <td class="col-sm-4">{{pstiNm}}</td>
        <th class="col-sm-2">국적</th>
        <td class="col-sm-3">{{nlty}}</td>
      </tr>
      <tr class="shittr req-inptnt-detail-info" >
        <th>병상신청일자</th>
        <td>{{prettifyDate sckbdreqYmd}}</td>
        <th>백신접종</th>
        <td>{{vacType}}</td>
      </tr>
      <tr class="shittr req-inptnt-detail-info" >
        <th>성별</th>
        <td>{{gender}}</td>
        <th>나이</th>
        <td>{{age}}</td>
      </tr>
      <tr class="shittr req-inptnt-detail-info" >
        <th>확정일자</th>
        <td>{{prettifyDate resYmd}}</td>
        <th>결과</th>
        <td>{{pstvYn}}</td>
      </tr>
      <tr class="shittr req-inptnt-detail-info" >
        <th>발열여부</th>
        <td>{{feverYn}}</td>
        <th>임신여부</th>
        <td>{{pregnYn}}</td>
      </tr>
      <tr class="shittr req-inptnt-detail-info" >
        <th>주민/외국인등록번호</th>
        <td id="dataRrn">{{rrn}}</td>
        <th>연락처</th>
        <td>{{pstiTelno}}</td>
      </tr>
      <tr class="shittr req-inptnt-detail-info" >
        <th>주소</th>
        <td colspan="3">{{pstiAdres}}</td>
      </tr>
      <tr class="shittr req-inptnt-detail-info" >
        <th>증상</th>
        <td colspan="3">{{symptms}}</td>
      </tr>
    <tr class="shittr req-inptnt-detail-info" >
            <th>병상신청기관</th>
            <td>{{instNm}}</td>
            <th>기관연락처</th>
            <td>{{instTelno}}</td>
          </tr>
          <tr class="shittr req-inptnt-detail-info" >
            <th>신청기관 주소</th>
            <td colspan="3">{{instAdres}}</td>
          </tr>
</script>

<script>

function showDetail(manageNo){
  var trs = $('tr.each-req-inptnt-element');
  
  trs.removeClass('on');
  
  var target = $('tr[data-manage-no="'+manageNo+'"]');
  
  target.addClass('on');
  
  var sckbdreqNo = target.attr('data-sckbdreq-no');
  var type = target.attr('data-type');
  var requestCode = target.attr('data-request-code');
  var hsptNo = target.attr('data-hspt-no');
  var childNo = target.attr('data-child-no');
  
  $('form[name="sckbdreqProcessForm"] input[name="sckbdreqNo"]').val(sckbdreqNo);
  $('form[name="sckbdreqProcessForm"] input[name="type"]').val(type);
  $('form[name="sckbdreqProcessForm"] input[name="hsptNo"]').val(hsptNo);
  $('form[name="sckbdreqProcessForm"] input[name="requestCode"]').val(requestCode); 
  $('form[name="sckbdreqProcessForm"] input[name="childNo"]').val(childNo); 
  $('form[name="sckbdreqProcessForm"] input[name="manageNo"]').val(manageNo);
  
  
  var url = '<%=request.getContextPath()%>/rest-hspt/req-inptnt-detail';
  $.ajax({
      url : url,
      type : 'post',
      dataType : 'json',
      data : {'manageNo' : manageNo},
      success : function(reqInptntDetailCommand){
        
    	  $('#enableReadRrn').data('rrn', reqInptntDetailCommand.rrn);
    	  $('#enableReadRrn').data('manageNo', manageNo);
    	  reqInptntDetailCommand.rrn = (reqInptntDetailCommand.rrn.substring(0,8) + '******');
    	  
    	  printData(reqInptntDetailCommand, $('#req-inptnt-detail-info-module'), $('#req-inptnt-detail-template'), '.req-inptnt-detail-info');
        
        $('#dgnssHsptNm').html(reqInptntDetailCommand.dgnssHsptNm);
        $('#dgnssResultCode').html(reqInptntDetailCommand.dgnssResultCode);
        $('#dgnssNote').html(reqInptntDetailCommand.dgnssNote);
        
      },
      error : function(error){
        alert('error' + error.status);
      }
    });
}


function accept_go(){
  //alert('accept_go');
  
  if(!confirm('병상신청을 승인하시겠습니까?')) return;
  
  var url = '<%=request.getContextPath()%>/rest-hspt/process-sckbdreq-accept';
  
  var sckbdreqProcessForm = $('form[name="sckbdreqProcessForm"]');
  
  $.ajax({
      url : url,
      type : 'post',
      dataType : 'json',
      data : sckbdreqProcessForm.serialize(),
      success : function(dataMap){
        if(dataMap.msg == "success"){
          alert('병상신청을 승인하였습니다.');
        }else{
          alert(dataMap.msg);
        }
        location.reload(true);
      },
      error : function(error){
        alert('error' + error.status);
      }
    }); 
}
function reject_go(){
  //alert('reject_go');
  if(!confirm('병상신청을 반려하시겠습니까?')) return;
  
  var url = '<%=request.getContextPath()%>/rest-hspt/process-sckbdreq-reject';
  
  var sckbdreqProcessForm = $('form[name="sckbdreqProcessForm"]');
  
  $.ajax({
      url : url,
      type : 'post',
      dataType : 'json',
      data : sckbdreqProcessForm.serialize(),
      success : function(dataMap){
        if(dataMap.msg == "success"){
            alert("병상신청을 반려하였습니다.");
        }else{
            alert(dataMap.msg);
        }
        location.reload();
      },
      error : function(error){
        alert('error' + error.status);
      }
    }); 
}

</script> 
</body>

