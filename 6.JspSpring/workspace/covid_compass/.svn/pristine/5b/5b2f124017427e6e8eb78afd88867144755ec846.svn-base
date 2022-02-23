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
                <li class="nav-item" style="width: 160px;"><select class="form-control" name="pbhtNm" id="pbhtNm" style="width: 160px; margin-right: 5px; height: 28px; margin-top: 1px; max-height: 100px;">
                    <c:forEach items="${pbhtList }" var="pbht">
                      <option class="pbhtNo" value="${pbht.pbhtNo }">${pbht.instNm }</option>
                    </c:forEach>
                </select></li>
                <li class="nav-item"><button type="button" class="btn btn-primary float-left" style="background: #1a4f72; border: 0px; width: 90px; margin-top: 1px; margin-left: 4px; margin-right: 51px;" onclick="requestSmpl();">재검신청</button></li>
                <li class="nav-item"><div class="input-group float-right" style="max-width: 600px; width: 300px;">
                    <!-- search bar -->
                    <select class="form-control " name="searchType" id="searchType">
                      <option value="" ${pageMaker.cri.searchType eq '' ? 'selected':''}>검색구분</option>
                      <option value="n" ${pageMaker.cri.searchType eq 'n' ? 'selected':''}>성명</option>
                      <option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected':''}>연락처</option>
                    </select>

                    <!-- keyword -->
                    <input class="form-control" type="text" name="keyword" value="${pageMaker.cri.keyword }" style="width: 18%; display: inline-block;" /> <span class="input-group-append">
                      <button class="btn btn-primary" type="button" id="searchBtn" style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px; margin-left: -7px;" data-card-widget="search" onclick="list_go(1, '<%=request.getContextPath()%>/rest-hspt/inptnt-list');">
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
                  <%@ include file="./inptnt-list-module-work.jsp"%>
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
            <div class="card-body pb-0">
              <table class="table table-bordered" style="border-left-color: white; border-right-color: white; margin-bottom: 10px;">
                <thead>
                  <tr>
                    <th colspan="4" style="font-size: 17px;">
                    	<div class="row m-0" style="justify-content: space-between;">
                    		<label style="font-size: 17px; margin: 0px;">입원환자 상세</label>
                    		<button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
                    	</div>
                    </th>
                  </tr>
                </thead>
              </table>
              <div class="tab-content" id="custom-tabs-three-tabContent">
                <div class="tab-pane fade show active" id="custom-psti-detail" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
                  <div id="inptnt-detail-info-module">
                    <div class="psti-detail-element">
                      <div class="register-card-body" style="padding: 0px;">
                        <div class="card pb-0" style="padding: 10px;">
                          <div class="row">
                            <div class="form-group col-lg-4">
                              <div class="row">
                                <input type="hidden" name="pstiNo" id="pstiNo" value=""> <label for="pstiNm" class="col-sm-5 control-label text-left">성명</label>
                              </div>
                              <div class="row">
                                <div class="col-sm-12" style="padding-left: 5px;">
                                  <input name="pstiNm" type="text" class="form-control modifyPossible" id="pstiNm" value="" readonly>
                                </div>
                              </div>
                            </div>

                            <div class="form-group col-lg-4">
                              <div class="row">
                                <label for="nlty" class="col-sm-6 control-label text-left" style="padding-top: 0px;">국적</label>
                                <div class="col-sm-12">
                                  <input name="nlty" type="text" class="form-control" id="nlty" value="" readonly>
                                </div>
                              </div>
                            </div>

                            <div class="form-group col-lg-4">
                              <div class="row">
                                <div class="col-lg-6">
                                  <label for="age" class="col-sm-12 control-label text-left">나이</label>
                                  <div class="row">
                                    <div class="col-sm-12">
                                      <input name="age" type="text" class="form-control" id="age" value="" readonly>
                                    </div>
                                  </div>
                                </div>
                                <div class="col-lg-6">
                                  <label for="gender" class="col-sm-12 control-label text-left">성별</label>
                                  <div class="row">
                                    <div class="col-sm-12">
                                      <input name="gender" type="text" class="form-control" id="gender" value="" readonly>
                                    </div>
                                  </div>
                                </div>

                              </div>

                            </div>
                          </div>


                          <div class="row">
                            <div class="form-group col-lg-4">
                              <div class="row">
                                <label for="rrn" class="col-sm-12 control-label text-left">주민/외국인등록번호 </label>
                              </div>
                              <div class="row">
                                <div class="col-sm-12" style="padding-left: 5px;">
                                  <input name="rrn" type="text" class="form-control" id="inputRrn" value="" readonly>
                                </div>
                              </div>
                            </div>

                            <div class="form-group col-lg-4">
                              <div class="row">
                                <label for="pstiTelno" class="col-sm-4 control-label text-left">연락처</label>
                                <div class="col-sm-12">
                                  <input name="pstiTelno" type="text" class="form-control modifyPossible" id="pstiTelno" maxlength="13" oninput="autoHyphen(this)" readonly>
                                </div>
                              </div>
                            </div>

                            <div class="form-group col-lg-4">
                              <div class="row">
                                <label for="job" class="col-sm-4 control-label text-left">직업</label>
                                <div class="col-sm-12">
                                  <input name="jobCode" type="text" class="form-control" id="job" value="" readonly>
                                </div>
                              </div>
                            </div>


                          </div>

                          <div class="row">
                            <div class="form-group col-lg-12">
                              <div class="row">
                                <label for="pstiAdres" class="col-sm-12 control-label text-left">주소</label>
                              </div>
                              <div class="row">
                                <div id="changeclass" class="col-sm-12" style="padding-left: 5px;">
                                  <input name="pstiAdres" type="text" class="form-control modifyPossible" id="pstiAdres" value="" readonly>
                                </div>
                                <div id="showAdress" class="col-sm-3" style="display: none;">
                                  <button type="button" style="background-color: #1a4f72; border-color: #1a4f72;" onclick="adress();" class="btn btn-block btn-primary">주소 검색</button>
                                </div>
                              </div>
                            </div>

                          </div>
                        </div>


                        <div class="card" style="padding: 10px;">
                          <div class="row">
                            <div class="form-group col-lg-3">
                              <div class="row">
                                <label for="inYmd" class="col-sm-12 control-label text-left">입원일자</label>
                              </div>
                              <div class="row">
                                <div class="col-sm-12" style="padding-left: 5px;">
                                  <input name="inYmd" type="text" class="form-control" id="inYmd" value="" readonly>
                                </div>
                              </div>
                            </div>

                            <div class="form-group col-lg-3">
                              <div class="row">
                                <label for="critCode" class="col-sm-12 control-label text-left">중증도</label>
                                <div class="col-sm-12">
                                  <input name="critCode" type="text" class="form-control" id="critCode" value="" readonly>
                                </div>
                              </div>
                            </div>


                            <div class="form-group col-lg-2">
                              <div class="row">
                                <label for="ngtvCnt" class="col-sm-12 control-label text-left" style="padding-top: 0px;">누적음성수</label>
                                <div class="col-sm-12">
                                  <input name="ngtvCnt" type="text" class="form-control" id="ngtvCnt" value="" readonly>
                                </div>
                              </div>
                            </div>

                            <div class="form-group col-lg-2">
                              <div class="row">
                                <label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">발열여부</label>
                                <div class="col-sm-12">
                                  <input name="feverYn" type="text" class="form-control" id="feverYn" value="" readonly>
                                </div>
                              </div>
                            </div>
                            <div class="form-group col-lg-2">
                              <div class="row">
                                <label for="pregnYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">임신여부</label>
                                <div class="col-sm-12">
                                  <input name="pregnYn" type="text" class="form-control" id="pregnYn" value="" readonly>
                                </div>
                              </div>
                            </div>



                          </div>

                          <div class="row">
                            <div class="form-group col-lg-12">
                              <div class="row">
                                <div class="form-group col-lg-12">
                                  <div class="row">
                                    <label for="symptms" class="col-sm-12 control-label text-left">증상</label>
                                  </div>
                                  <div class="row">
                                    <div class="col-sm-12" style="padding-left: 5px;">
                                      <input name="symptms" type="text" class="form-control modifyPossible" id="symptms" value="" readonly>
                                    </div>
                                  </div>
                                </div>

                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="form-group col-lg-12 mb-0">
                              <div class="row">
                                <div class="form-group col-lg-12 mb-0">
                                  <div class="row mb-0">
                                    <label for="expire" class="col-sm-6 control-label text-left">상태</label>
                                      <select id="select-status" class="form-control col-sm-5" name="statusCode" onchange="enableBtn(this);" disabled>
                                          <option value="">진단</option>
                                          <option value="E104">사망</option>
                                      </select>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>


                        <div class="card pb-0" style="padding: 10px;">
                          <table class="table table-bordered">
                            <tbody>
                              <tr class="shittr">
                                <th class="col-md-2">진료병원</th>
                                <td class="col-md-4" id="dgnssHsptNm"></td>
                                <th class="col-md-2">진료결과</th>
                                <td class="col-md-4" id="dgnssResultCode"></td>
                              </tr>
                              <tr class="shittr">
                                <th rowspan="4" style="vertical-align: middle;">진료메모</th>
                                <td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="dgnssNote"></td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>

                      <div class="form-group row">
                        <div class="col-sm-4" id="inptnt-expire-div">
                                    <button style="background-color: #1a4f72; border-color: #1a4f72; margin-top: 8px; visibility: hidden" type="button" class="btn btn-block btn-primary btn-sm"
                                      id="expire-btn" onclick="goExpire()">확인</button>     
                        </div>
                        <div class="form-group row col-sm-8" style="float: right;">
                          <div class="col-md-6" id="inptnt-sckbdreq-div">
                          <button style="background-color: #1a4f72; border-color: #1a4f72; margin-top: 8px;" type="button" 
                                  name="sckbdreq-inptnt-button" class="btn btn-block btn-primary btn-sm" data-manage-no="" data-psti-nm="" 
                                  onclick="openInptntGo(this, 'B');"
                                  id="inptnt-sckbdreq-btn">이원신청</button>
                          </div>
                          <div class="col-md-6" style="display: none;" id="inptnt-save-div">
                          <button style="background-color: #1a4f72; border-color: #1a4f72; margin-top: 8px;" type="button" 
                                  id="inptnt-save-btn" class="btn btn-block btn-primary btn-sm" onclick="save();">저장</button>
                          </div>
                          <div class="col-md-6" id="inptnt-modify-div">
                          <button style="background-color: #1a4f72; border-color: #1a4f72; margin-top: 8px;" type="button" 
                                  id="inptnt-modify-btn" class="btn btn-block btn-primary btn-sm" onclick="modify();">수정</button>
                          </div>
                          <div class="col-md-6" style="display: none;" id="inptnt-modify-cancle-div">
                          <button style="margin-top: 8px;" type="button" 
                                  id="inptnt-cancle-btn" class="btn btn-block btn-danger btn-sm" onclick="cancle();">취소</button>
                          </div>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
            </div>

            <form name="inptntModifyForm" style="display: none;">
              pstiNm<input type="text" name="pstiNm">
              pstiTelno<input type="text" name="pstiTelno">
              pstiAdres<input type="text" name="pstiAdres">
              symptms<input type="text" name="symptms">
              areaNo<input type="text" name="areaNo">
              pstiNo<input type="text" name="pstiNo">
              manageNo<input type="text" name="manageNo">
            </form>
        </section>
      </div>

    </div>
    <!-- /.card-body -->
  </section>



  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
  <script type="text/x-handlebars-template" id="inptnt-list-template">
{{#each .}}
          <tr
			data-manage-no="{{manageNo}}" data-psti-nm="{{pstiNm}}"
            ondblclick="OpenWindow('sckbdreq-inptnt?manageNo={{manageNo}}', '진료 신청 정보', 1250, 800)"
            onclick="showDetail('{{manageNo}}')"
            class="each-inptnt-element" style="cursor: pointer;">
            <td><input {{fnToday today}} type="checkbox" name="checkSmple"
				class="form-check-input" value="{{manageNo}}" style="margin-left: -7px;"
              onclick="cancleAll()"></td>
            <td style="text-align: left;">{{pstiNm}}</td>
            <td>{{age}}</td>
            <td>{{getGender gender}}</td>
            <td>{{pstiTelno}}</td>
            <td>{{prettifyDate inYmd}}</td>
            <td>{{ngtvCnt}}</td>
          </tr>
{{/each}}
</script>

  <script type="text/x-handlebars-template" id="inptnt-pagination-template">
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="1"> <i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-inptnt-pagination-element"><a class="page-link {{checkDisabled prev}}" href="{{#if prev}}{{prevPageNum}}{{/if}}"> <i class="fas fa-angle-left" style="color:#1a4f72;"></i>
    </a></li>

{{#each pageNum}}
    <li class="page-item each-inptnt-pagination-element {{signActive this}}" ><a class="page-link" href="{{this}}" >{{this}}</a></li>
{{/each}}

    <li class="page-item each-inptnt-pagination-element"><a class="page-link {{checkDisabled next}}" href="{{#if next}}{{nextPageNum}}{{/if}}"> <i class="fas fa-angle-right" style="color:#1a4f72;"></i>
    </a></li>
    <li class="page-item each-inptnt-pagination-element"><a class="page-link" href="{{realEndPage}}"> <i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
</a></li>
</script>

  <%@ include file="../template/handlebars_js.jsp"%>
  <!-- 주소API js -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>

function requestSmpl(){
	var checkedManageNo ='';
	var count = 0;
	$('input[class="form-check-input"]:checked').each(function(){
		checkedManageNo += $(this).val() + ",";
		count += 1;
	});
	var selectPbht = $('#pbhtNm');
	var data = {
				"checkedManageNo" : checkedManageNo
				,"pbhtNo" : selectPbht.val()
			}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-hspt/process-regist-smpl',
		type: 'post',
		data : data,
		success : function(dataMap){
			alert(count+"명의 시료를 성공적으로 " + dataMap.pbht.instNm + "에 전달하였습니다.");
			location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
		
	})
		
}	

function goExpire(){
	
	
	var pstiNm = $('form[name="inptntModifyForm"] input[name="pstiNm"]').val();
	
	if(confirm(pstiNm + "환자를 정말로 사망처리 하시겠습니까?\n 한번 사망처리하면 다시 되돌릴 수 없습니다.") == false) return;
	
	var manageNo = $('form[name="inptntModifyForm"] input[name="manageNo"]').val();
	
	var url = '<%=request.getContextPath()%>/rest-hspt/expire-inptnt';
	
	$.ajax({
		url : url,
		type: 'post',
		data : {"manageNo" : manageNo},
		dataType : 'json',
		success : function(dataMap){
			alert("환자를 사망처리하였습니다.");
			location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
		
	})	
	
}

function openInptntGo(btn, type){
	$(btn).attr('data-manage-no');
	$(btn).attr('data-psti-nm');
	
	var openUrl = 'sckbdreq-inptnt?manageNo=' +  $(btn).attr('data-manage-no') + '&pstiNm=' + $(btn).attr('data-psti-nm')
					+ '&type=' + type;
	
	OpenWindow(openUrl, '병원 조회', 1260, 715);
	
}
	//주소 API
function adress() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("pstiAdres").value = extraAddr;
            
            } else {
                document.getElementById("pstiAdres").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("pstiAdres").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("pstiAdres").focus();
        }
    }).open();
}

	</script>
  <script>


function prettyDate(timeValue){
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

    function checkAllBox(checkBox){
      var length = document.getElementsByName("checkSmple").length;
      if(document.getElementById('all').checked==true){
        for(var i=0; i<length; i++) {
        	if(document.getElementsByName('checkSmple')[i].disabled==false){
	        	document.getElementsByName("checkSmple")[i].checked=true;
        	}
        }
      }
      
      if(document.getElementById('all').checked==false){
        for(var i=0; i<length; i++) document.getElementsByName("checkSmple")[i].checked=false;
      }
      
      
    }
    
    function cancleAll(){
      //alert("눌림");
      if(document.getElementById('all').checked==true){
        document.getElementById('all').checked=false;
      }
    }

Handlebars.registerHelper({
	"prettifyDate" : function(timeValue){
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
	},
	"checkDisabled" : function(flag){
	    if(!flag) return 'disabled';
	},
	"signActive" : function(pageNum){
	  if(pageNum == page) return 'active';
	},
	"getInstNm" : function(pbhtNm, ltctNm){
		
		return pbhtNm || ltctNm;
	},
	"addClass" : function(pbhtNm, ltctNm){
		if(pbhtNm){
			return "pbht";
		}
		if(ltctNm){
			return "ltct";
		}
	},
	"getGender" : function(gender){
		if(gender == "M"){
			return "남";
		}
		if(gender == "F"){
			return "여";
		}
	},
	"fnToday" : function(today){
		if(today > 0){
			return "disabled";
		}
	}
	
	});


var page = 1;

window.onload = function(){

  var url = '<%=request.getContextPath() %>/rest-hspt/inptnt-list';

  list_go(page, url);
	$('ul.pagination').on('click','li a',function(event){
		if($(this).attr("href")) {
			page=$(this).attr("href");
			getPage(url, make_form(page));
		}
		
		return false;
	});
}
function make_form(pageParam){
  var jobForm=$('#jobForm');
  
  if(!pageParam) page = 1;
  
  page = pageParam;
  
  jobForm.find("[name='page']").val(page);
  jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
//  jobForm.find("[name='perPageNum']").val(2);
  jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
  jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
  
  return jobForm;
}

function list_go(pageParam, url){
	
  getPage(url, make_form(pageParam));
}

function getPage(handelbarsProcessingURL, form){

	$.ajax({
    url : handelbarsProcessingURL,
    type : 'get',
    dataType : 'json',
    data : form.serialize(),
    success : function(dataMap){
    	
		if(dataMap.inptntList.length == 0){
			$('#enableReadRrn').attr('disabled', true);
			$('#inptnt-sckbdreq-btn').attr('disabled', true);
			$('#inptnt-modify-btn').attr('disabled', true);
			
			$('#inptnt-list-table-tbody').html('<tr class="each-inptnt-element"><td colspan="7" id="initialTd">페이지 로딩중 입니다.</td></tr>');
	          
    		$('#initialTd').html('데이터가 없습니다.');
    		dataMap.pageMaker.endPage = 1;
    		printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
    		
    		cancle();
    		emptyDetail();
	      
    	}else{
			$('#enableReadRrn').attr('disabled', false);
			$('#inptnt-sckbdreq-btn').attr('disabled', false);
			$('#inptnt-modify-btn').attr('disabled', false);
			
	     	printData(dataMap.inptntList, $('#inptnt-list-table-tbody'), $('#inptnt-list-template'), '.each-inptnt-element');
	        printPagination(dataMap.pageMaker, $('#inptnt-list-pagination-ul'), $('#inptnt-pagination-template'), '.each-inptnt-pagination-element');
	        
	        if(dataMap.firstRecord){
		        showDetail(dataMap.firstRecord.manageNo);
	        }
    	}

       
    },
    error : function(error){
      alert('error' + error.status);
    }
  })
 }
 
//jsonArray는 ResponseEntity에서 넣어준 List가 들어가는 자리
//target은 handlebars로 생성한 마크업을 append할 대상으로 jquery객체이며 리스트에서 쓸 경우 보통 tbody에 id를 줘서 target으로 잡는다.
//templateObject는 handlebars를 이용하여 만든 템플릿으로 jquery객체이다.
//removeClass는 append하기전에 기존에 있던 리스트<여기서는 handlebars로 붙인 요소 목록>를 지우기 위해서 '.(클래스이름)'을 넣는다.
//이를 위하여 templateObject에서 handlebars로 붙인 요소 목록를 지칭할 class를 주어야 한다. 여기서는 .each-inptnt-element이며,
//tr태그에 붙어있다.
function printData(jsonArray, target, templateObject, removeClass){

	// templateObject를 json data를 받으면 마크업을 return하는 function template로 반환한다.
	var template = Handlebars.compile(templateObject.html());
	
	// 함수 template에 파라미터 jsonArray를 넣어서 실행하여 html을 생성한다.
	var html = template(jsonArray);
	
	// 해당 html요소를 append하기 전에 기존에 있던 내용을 지운다. (안그러면 리스트 목록이 10개씩만 보이는 게 아니라 10개, 20개, 30개 등 페이지 클릭할 때마다 10개씩 추가되므로)
	$(removeClass).remove();
	
	// html요소를 append한다.
	target.append(html);
}

function printPagination(pageMaker, target, templateObject, removeClass){
	 
	
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNum;  
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html("").html(html);
}

function showDetail(manageNo){
	
	cancle();
	
	var trs = $('tr.each-inptnt-element');
	
	trs.removeClass('on');
	
	var target = $('tr[data-manage-no="'+manageNo+'"]');
	
	target.addClass('on');
	
	var url = '<%=request.getContextPath()%>/rest-hspt/inptnt-detail';
	
	var openInptntbtn = $('button[name="sckbdreq-inptnt-button"]');
	
	$(openInptntbtn).attr('data-manage-no', manageNo);
	$(openInptntbtn).attr('data-psti-nm', target.attr('data-psti-nm'));
	
	$.ajax({
	    url : url,
	    type : 'post',
	    dataType : 'json',
	    data : {'manageNo': manageNo},
	    success : function(inptntDetailCommand){
	    	
	    	console.log(inptntDetailCommand);
	    	
	    	console.log(inptntDetailCommand.disabled);
	    	
	    	var flag = inptntDetailCommand.disabled == 'disabled';
	    	
	    	console.log(flag);
	    	
	    	$('#inptnt-sckbdreq-btn').attr('disabled', flag);
	    	
        	var age               = inptntDetailCommand.age               ;
        	var areaNo            = inptntDetailCommand.areaNo            ;
        	var dgnssCode         = inptntDetailCommand.dgnssCode         ;
        	var dgnssNo           = inptntDetailCommand.dgnssNo           ;
        	var dgnssNote         = inptntDetailCommand.dgnssNote         ;
        	var dgnssResultCode   = inptntDetailCommand.dgnssResultCode   ;
        	var feverYn           = inptntDetailCommand.feverYn           ;
        	var gender            = inptntDetailCommand.gender            ;
        	var inYmd             = inptntDetailCommand.inYmd             ;
        	var jobCode           = inptntDetailCommand.jobCode           ;
        	var manageNo          = inptntDetailCommand.manageNo          ;
        	var nlty              = inptntDetailCommand.nlty              ;
        	var pregnYn           = inptntDetailCommand.pregnYn           ;
        	var pstiAdres         = inptntDetailCommand.pstiAdres         ;
        	var pstiNm            = inptntDetailCommand.pstiNm            ;
        	var pstiNo            = inptntDetailCommand.pstiNo            ;
        	var pstiTelno         = inptntDetailCommand.pstiTelno         ;
        	var pstvYn            = inptntDetailCommand.pstvYn            ;
        	var reqYmd            = inptntDetailCommand.reqYmd            ;
        	var resYmd            = inptntDetailCommand.resYmd            ;
        	var rrn               = inptntDetailCommand.rrn               ;
        	var smplNo            = inptntDetailCommand.smplNo            ;
        	var symptms           = inptntDetailCommand.symptms           ;
        	var vacCode           = inptntDetailCommand.vacCode           ;
        	var vacType           = inptntDetailCommand.vacType           ;
        	var ngtvCnt			  = inptntDetailCommand.ngtvCnt			  ;
          
        	$('input[name="pstiNm"]').val(pstiNm);
        	$('input[name="pstiTelno"]').val(pstiTelno);
        	$('input[name="pstiAdres"]').val(pstiAdres);
        	$('input[name="symptms"]').val(symptms);
        	$('input[name="pstiNo"]').val(pstiNo);
        	$('input[name="nlty"]').val(nlty);
        	$('input[name="age"]').val(age);
        	$('input[name="gender"]').val(gender);
        	
        	$('#enableReadRrn').data('rrn', rrn);
        	$('#enableReadRrn').data('manageNo', manageNo);
        	$('input[name="rrn"]').val(rrn.substring(0,8) + '******');
        	
        	$('input[name="jobCode"]').val(jobCode);
        	$('input[name="inYmd"]').val(prettyDate(inYmd));
          	$('input[name="critCode"]').val(dgnssResultCode);
          	$('input[name="ngtvCnt"]').val(ngtvCnt);
        	$('input[name="feverYn"]').val(feverYn);
        	$('input[name="pregnYn"]').val(pregnYn);
        	
        	$('#dgnssHsptNm').html(inptntDetailCommand.dgnssHsptNm);
        	$('#dgnssNote').html(dgnssNote);
        	$('#dgnssResultCode').html(dgnssResultCode);
        	
        	$('form[name="inptntModifyForm"] input[name="pstiNm"]').val(pstiNm);
        	$('form[name="inptntModifyForm"] input[name="pstiTelno"]').val(pstiTelno);
        	$('form[name="inptntModifyForm"] input[name="pstiAdres"]').val(pstiAdres);
        	$('form[name="inptntModifyForm"] input[name="symptms"]').val(symptms);	
        	$('form[name="inptntModifyForm"] input[name="areaNo"]').val(areaNo);	
        	$('form[name="inptntModifyForm"] input[name="pstiNo"]').val(pstiNo);
        	$('form[name="inptntModifyForm"] input[name="manageNo"]').val(manageNo);

	    },
	    error : function(error){
	      alert('error' + error.status);
	    },
	    beforeSend : function(){
	    	var template = Handlebars.compile($('#loading-template').html());
	    	var html = template();
	    	$('.inptnt-detail-info').css('display','none');
	    	$('#inptnt-detail-info-module').append(html);
	    },
	    complete : function(){
	    	$('.loading-class').remove();
	    	$('.inptnt-detail-info').css('display','');
	    	
	    }
	  });
}
</script>

<script>

function emptyDetail(){
	
	
	$('#enableReadRrn').data('rrn', '');
	$('#enableReadRrn').data('manageNo', '');
	
	$('input[name="pstiNm"]').   val('');
	$('input[name="pstiTelno"]').val('');
	$('input[name="pstiAdres"]').val('');
	$('input[name="symptms"]').  val('');
	$('input[name="pstiNo"]').   val('');
	$('input[name="nlty"]').     val('');
	$('input[name="age"]').      val('');
	$('input[name="gender"]').   val('');
	$('input[name="rrn"]').      val('');
	$('input[name="jobCode"]').  val('');
	$('input[name="inYmd"]').    val('');
  	$('input[name="critCode"]'). val('');
  	$('input[name="ngtvCnt"]').  val('');
	$('input[name="feverYn"]').  val('');
	$('input[name="pregnYn"]').  val('');
	
	$('#dgnssHsptNm').    html('');
	$('#dgnssNote').      html('');
	$('#dgnssResultCode').html('');	
	
	
	$('form[name="inptntModifyForm"] input[name="pstiNm"]').   val('');
	$('form[name="inptntModifyForm"] input[name="pstiTelno"]').val('');
	$('form[name="inptntModifyForm"] input[name="pstiAdres"]').val('');
	$('form[name="inptntModifyForm"] input[name="symptms"]').  val('');	
	$('form[name="inptntModifyForm"] input[name="areaNo"]').   val('');	
	$('form[name="inptntModifyForm"] input[name="pstiNo"]').   val('');
	$('form[name="inptntModifyForm"] input[name="manageNo"]'). val('');	
}

</script>


<script type="text/javascript">
    function modify(){
      alert("수정후 저장 버튼을 눌러주세요");
      
    $('#changeclass').removeClass('col-sm-12');
    $('#changeclass').addClass('col-sm-9');
    $('#showAdress').css('display', 'inline');
      
      $('.modifyPossible').attr('readonly', false);
      $('.modifyPossible').css('border-color', 'blue');
      
      $('#inptnt-modify-cancle-div').css('display', '');
      $('#inptnt-save-div').css('display', '');
      $('#inptnt-modify-div').css('display', 'none');
      $('#inptnt-sckbdreq-div').css('display', 'none');
      $('#select-status').attr('disabled', false);
      
    }
    function cancle(){
      //alert("취소!");
      $('.modifyPossible').attr('readonly', true);
      $('.modifyPossible').css('border-color', '');
      
      $('#inptnt-modify-cancle-div').css('display', 'none');
      $('#inptnt-save-div').css('display', 'none');
      $('#inptnt-modify-div').css('display', '');
      $('#inptnt-sckbdreq-div').css('display', '');
      $('#expire-btn').css('visibility','hidden');
      $('#select-status').attr('disabled', true);
      
    $('#changeclass').removeClass('col-sm-9');
    $('#changeclass').addClass('col-sm-12');
    $('#showAdress').css('display', 'none');      
    
      $('input[name="pstiNm"]').val($('form[name="inptntModifyForm"] input[name="pstiNm"]').val());
    $('input[name="pstiTelno"]').val($('form[name="inptntModifyForm"] input[name="pstiTelno"]').val());
    $('input[name="pstiAdres"]').val($('form[name="inptntModifyForm"] input[name="pstiAdres"]').val());
    $('input[name="symptms"]').val($('form[name="inptntModifyForm"] input[name="symptms"]').val());
    }
    
    function save(){
      var pstiNm = $('#inptnt-detail-info-module input[name="pstiNm"]').val();
      var pstiTelno = $('#inptnt-detail-info-module input[name="pstiTelno"]').val();
      var pstiAdres = $('#inptnt-detail-info-module input[name="pstiAdres"]').val();
      var symptms = $('#inptnt-detail-info-module input[name="symptms"]').val();
      var pstiNo =$('#inptnt-detail-info-module input[name="pstiNo"]').val();
      var areaNo = $('form[name="inptntModifyForm"] input[name="areaNo"]').val();
      
      console.log(pstiNm, pstiTelno, pstiAdres, symptms, pstiNo, areaNo);
      
      var data = {
           'pstiNm':pstiNm
          ,'pstiTelno':pstiTelno
          ,'pstiAdres':pstiAdres
          ,'symptms':symptms
          ,'pstiNo':pstiNo
          ,'areaNo':areaNo
      }
      
      var url = '<%=request.getContextPath()%>/rest-hspt/process-inptnt-modify';
      
    $.ajax({
      url : url,
      type : 'post',
      data : data,
      dataType : 'json',
      success : function(dataMap) {
        if(dataMap.msg == "success"){
          alert('성공적으로 수정이 완료되었습니다.');
        }
        $('.modifyPossible').attr('readonly', true);
        $('.modifyPossible').css('border-color', '');
        
        $('#inptnt-modify-cancle-div').css('display', 'none');
        $('#inptnt-save-div').css('display', 'none');
        $('#inptnt-modify-div').css('display', '');
        $('#inptnt-sckbdreq-div').css('display', '');
        $('#expire-btn').css('visibility','hidden');
        $('#select-status').attr('disabled', true);
        
      $('#changeclass').removeClass('col-sm-9');
      $('#changeclass').addClass('col-sm-12');
      $('#showAdress').css('display', 'none');      
      
        $('input[name="pstiNm"]').val(pstiNm);
      $('input[name="pstiTelno"]').val(pstiTelno);
      $('input[name="pstiAdres"]').val(pstiAdres);
      $('input[name="symptms"]').val(symptms);
      },
      error : function(error) {
        alert('error' + error.status);
      },
      complete : function(){
        
      }
    });     
      
    }
  </script>
  <script>
function enableBtn(ele){
	
	if(ele.value=='E104'){
		$('#expire-btn').css('visibility', 'visible');
	}else{
		$('#expire-btn').css('visibility', 'hidden');
	}
	
}

const autoHyphen = (target) => {
	target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/,`$1-$2-$3`);
}

</script>

  
</body>
