<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<!--  임신여부 예 누르고 남자 누르고 여자 누르면 예 그대로 선택되있는거 풀어줘야함. -->
<!-- 모달 버블링 방지해야함. -->
<!--  모달에서 등록버튼누르면 체크되게해야함. -->
<style>
.fontred {
	color: red;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
.btn.btn-outline-primary:hover{
	background:#1a4f72!important;
	border-color:#1a4f72!important;
}
.btn.btn-outline-primary.active{
	background:#1a4f72!important;
	border-color:#1a4f72!important;
}
.active .bs-stepper-circle{
	background:#1a4f72!important;
}

</style>
</head>
<title></title>
<body>
	<div class="wrapper" style="max-width: 1280px; margin: 0 auto;">
		<div class="row col-12">
			<div class="col-12" style="margin-top: 10px;">
				<div class="card card-default">
					<div class="card-header">
					<div class="row" style="justify-content: space-between;">
						<div class="col-2 pt-2">
							<h3 class="card-title">문진표 작성</h3>
						</div>
						<div class="col-2">
							<button type="button" style="width: 90%;" onclick="fillQuestion();" class="btn btn-info">데이터입력</button>
						</div>
						<div class="col-2">
							<button type="button" onclick="questionCancle();" class="btn btn-block btn-primary" style="width: 90%;background: #1a4f72; border-color: #1a4f72;">뒤로가기</button>
						</div>
					</div>
					</div>
					<div class="card-body p-0">
						<div class="bs-stepper linear">
							<div class="bs-stepper-header" role="tablist">
								<!-- your steps here -->
								<div class="step active" data-target="#logins-part">
									<button type="button" class="step-trigger" role="tab" aria-controls="logins-part" id="logins-part-trigger" aria-selected="true">
										<span class="bs-stepper-circle">1</span> <span class="bs-stepper-label">개인정보</span>
									</button>
								</div>
								<div class="line"></div>
								<div class="step" data-target="#information-part">
									<button type="button" class="step-trigger" role="tab" aria-controls="information-part" id="information-part-trigger" aria-selected="false" disabled="disabled">
										<span class="bs-stepper-circle">2</span> <span class="bs-stepper-label">증상/기타정보</span>
									</button>
								</div>
							</div>
							<div class="bs-stepper-content">
								<!-- your steps content here -->
								<div id="logins-part" class="content active dstepper-block" role="tabpanel" aria-labelledby="logins-part-trigger">

									<div class="form-group">
										<label for="chck_reason_code">검사경위<span class="fontred">*</span></label><br>
										<div class="btn-group btn-group-toggle" data-toggle="buttons" style="width: 100%">
										
											<label class="btn btn-outline-primary active" id="code_my"> 
												<input type="radio" name="chck_reason_code" id="chck_reason_code_my" autocomplete="off" value="N" checked="">본인판단
											</label> 
											<div style="width: 1%"></div>
											<label class="btn btn-outline-primary" id="code_sick"> 
												<input type="radio" name="chck_reason_code" id="chck_reason_code_sick" autocomplete="off" value="Y">자가격리
											</label>
										</div>
									</div>

									<div class="form-group">
										<label for="psti_rrn">주민/외국인등록번호<span class="fontred">*</span></label> <input type="text" class="form-control" name="psti_rrn" id="psti_rrn" maxlength="14" oninput="rrnAutoHyphen(this)">
									</div>

									<div class="form-group">
										<label for="psti_nm">이름 <span class="fontred">*(숫자,특수문자 입력불가)</span></label> <input type="text" class="form-control" name="psti_nm" id="psti_nm" onKeyup="this.value=this.value.replace(/[^ㄱ-ㅎ|가-힣|a-z|A-Z]/g,'');">
									</div>

									<div class="form-group">
										<label for="birth">생년월일<span class="fontred">*</span></label> <input type="text" class="form-control" id="birth" placeholder="YYYYMMDD" maxlength="8" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</div>

									<div class="form-group">
										<label for="psti_sexdstn">성별<span class="fontred">*</span></label><br>
										<div class="btn-group btn-group-toggle" data-toggle="buttons" style="width: 100%">
											<label class="btn btn-outline-primary active" id="psti_sex_m"> 
											<input type="radio" name="psti_sexdstn" id="psti_sexdstn_m" autocomplete="off" value="M" checked>남
											</label> 
											<div style="width: 1%"></div>
											<label class="btn btn-outline-primary" id="psti_sex_w">
											 <input type="radio" name="psti_sexdstn" id="psti_sexdstn_w" autocomplete="off" value="F">여
											</label>
										</div>
									</div>

									<div class="form-group" id="pregnan" style="display: none;">
										<label for="psti_pregnan_yn">임신여부</label><br>
										<div class="btn-group btn-group-toggle" data-toggle="buttons" style="width: 100%">
											<label class="btn btn-outline-primary active"> 
											<input type="radio" name="psti_pregnan_yn" id="psti_pregnan_y" autocomplete="off" value="Y">예
											</label> 
											<div style="width: 1%"></div>
											<label class="btn btn-outline-primary" style="width: 3.5%;"> 
											<input type="radio"  name="psti_pregnan_yn" id="psti_pregnan_n" autocomplete="off" value="N" checked="">아니오
											</label>
										</div>
									</div>

									<div class="form-group">
										<label for="psti_nlty">국적<span class="fontred">*</span></label><br>
										<div class="btn-group btn-group-toggle" data-toggle="buttons" style="width: 100%">
											<label class="btn btn-outline-primary active" id="nlty_korea"> 
											<input type="radio" name="psti_nlty" id="psti_nlty_korean" autocomplete="off" value="KOR" checked="">내국인
											</label> 
											<div style="width: 1%"></div>
											<label class="btn btn-outline-primary" style="width: 6%;" id="nlty_foreigner"> 
											<input type="radio" name="psti_nlty_f" id="psti_nlty_foreigner_check" value="Foreigner" autocomplete="off">Foreigner
											</label>
										</div>
									</div>
									<input type="text" class="form-control" name="psti_nlty" style="display: none;" id="psti_nlty_foreigner" placeholder="Please enter your nationality.">

									<div class="form-group">
										<label for="psti_telno">휴대폰번호<span class="fontred">*</span></label> <input type="text" class="form-control" id="psti_telno" name="psti_telno" maxlength="13" oninput="autoHyphen(this)">
									</div>

									<div class="form-group">
										<label for="psti_adres">실거주지주소<span class="fontred">*</span></label><br>
										<div class="row">
											<input type="text" class="form-control" id="psti_adresnum" readonly style="width: 20%">
											<button type="button" onclick="address_go();" style="background:#1a4f72;border-color:#1a4f72;" class="btn btn-primary">주소검색</button>
											<input type="text" class="form-control" id="psti_adres1" name="psti_adres" readonly> <input type="text" class="form-control" id="psti_adres2" name="psti_adres" placeholder="상세주소를 입력하세요.">
										</div>
									</div>

									<div class="form-group">
										<label for="job_code">직업<span class="fontred">*</span></label><br>
										<select id="job_select" name="job_code">
											<option value="I101">의회의원,고위임직원 및 관리자</option>
											<option value="I102">전문가</option>
											<option value="I103">기술공 및 준전문가</option>
											<option value="I104">사무종사자</option>
											<option value="I114">서비스종사자</option>
											<option value="I105">판매종사자</option>
											<option value="I106">농업 및 어업숙련 종사자</option>
											<option value="I107">기능원 및 기능관련 종사자</option>
											<option value="I108">장치,기계조작 및 조립종사자</option>
											<option value="I109">단순노무 종사자</option>
											<option value="I110">군인</option>
											<option value="I111">(전업) 주부</option>
											<option value="I115">학생</option>
											<option value="I112">무직</option>
											<option value="I113">기타</option>
										</select>
									</div>
									<button class="btn btn-primary" onclick="ready();" style="width: 100%; margin: 0 auto;background:#1a4f72;border-color:#1a4f72;" id="nextview">다음</button>
								</div>
								<!-- 							</div> -->


								<div id="information-part" class="content" role="tabpanel" aria-labelledby="information-part-trigger">
									<label for="psti_pyrexia_yn">발열이 있으신가요?</label><br>
									<div class="btn-group btn-group-toggle" data-toggle="buttons" style="width: 100%;">
										<label class="btn btn-outline-primary active" id="pyrexia_y"> 
										<input type="radio" name="psti_pyrexia_yn" id="psti_pyrexia_y" autocomplete="off" value="Y">예
										</label>
										<div style="width: 1%"></div> 
										<label class="btn btn-outline-primary" id="pyrexia_n" style="width: 3.4%;"> 
										<input type="radio" name="psti_pyrexia_yn" id="psti_pyrexia_n" autocomplete="off" value="N">아니오
										</label>
									</div>

									<div class="form-group" style="display: none;" id="pyrexia">
										<label for="pyrexia">발열 온도가 몇 도인가요?</label>
										<div>
											<input type="number" step="0.1" class="form-control" name="pyrexia" id="pyrexia_input" placeholder="발열온도를 입력하세요.">
										</div>
										<div class="card">
											<span id="pyrexiacheck"> <input type="checkbox" id="pyrexiadonknow" value="Y" style="vertical-align: middle; margin-left: 10px;">&nbsp;&nbsp;&nbsp;<span style="vertical-align: middle;">잘 모릅니다.</span>
											</span>
										</div>
									</div>


									<div class="form-group">
										<label for="psti_symptms">현재 증상을 모두 선택해 주세요.</label>
									</div>

									<div class="symptom-list" style="padding: 1px">
										<div class="card col-3" style="float: left;">
											<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_999" value="증상없음" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_999" class="symptom-list__label" style="text-align: center;"> <img src="<%=request.getContextPath()%>/resources/image/ill_999.svg"><br> <span>증상없음</span>
											</label>
										</div>
										<div id="unchecked">
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_100" value="기침" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_100" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_100.svg"><br> <span>기침</span>
												</label>
											</div>
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_101" value="가래" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_101" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_101.svg"><br> <span>가래</span>
												</label>
											</div>
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_102" value="인후통" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_102" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_102.svg"><br> <span>인후통</span>
												</label>
											</div>
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_103" value="호흡곤란" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_103" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_103.svg"><br> <span>호흡곤란</span>
												</label>
											</div>
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_110" value="근육통" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_110" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_110.svg"><br> <span>근육통</span>
												</label>
											</div>
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_111" value="두통" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_111" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_111.svg"><br> <span>두통</span>
												</label>
											</div>
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_112" value="오한" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_112" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_112.svg"><br> <span>오한</span>
												</label>
											</div>
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_120" value="미각소실" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_120" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_120.svg"><br> <span>미각소실</span>
												</label>
											</div>
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_121" value="후각소실" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_121" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_121.svg"><br> <span>후각소실</span>
												</label>
											</div>
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_200" value="설사" data-val="설사" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_200" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_200.svg"><br> <span>설사</span>
												</label>
											</div>
											<div class="card col-3" style="float: left;">
												<input type="checkbox" class="symptom-list__checkbox" name="psti_symptms" id="smptm_300" value="폐렴" data-val="폐렴" placeholder="현재 증상을 모두 선택해 주세요." style="margin-top: 10px;"> <label for="smptm_300" class="symptom-list__label" style="text-align: center"> <img src="<%=request.getContextPath()%>/resources/image/ill_300.svg"><br> <span>폐렴</span>
												</label>
											</div>
										</div>
										<!-- unchecked div -->
									</div>

									<br>
									<div class="form-group">
										<label>백신 접종 상태</label>
										<select id="inocl_code">
											<option value="J101">미접종</option>
											<option value="J102">1차 접종</option>
											<option value="J103">2차 접종</option>
											<option value="J104">3차 접종이상</option>
										</select>
									</div>

									<div class="card">
										<label for="chk_agree" id="personokay"> <span> <input type="checkbox" id="chk_person" value="Y" style="vertical-align: middle; margin-left: 10px;">&nbsp;&nbsp;&nbsp;<span style="vertical-align: middle;">개인정보 수집 동의</span> <span> <a id="modal" data-toggle="modal" data-target="#myModal" style="vertical-align: middle;">[개인정보취급방침]</a>
											</span>
										</span>
										</label>
									</div>
									<div class="row">
										<div class="col-md-3 pr-0">
											<input type="text" id="inspCheck" class="form-control" style="width: 100%;" value="" readonly/>
										</div>
										<div class="col-md-2 pl-0">
											<button type="button" class="btn btn-primary" style="background:#1a4f72;border-color:#1a4f72;" id="inspSearch" onclick="inspSearch_go();">검사소검색</button>
										</div>
									</div>
									<br> <br>
									<div class="row">
										<div class="col-md-6">
											<button class="btn btn-danger" onclick="previous();" style="width: 100%; float: left;">이전</button>
										</div>
										<div class="col-md-6">
											<button type="submit" id="psti_submit" onclick="questionCheck();" class="btn btn-primary" style="width: 100%; float: right;background:#1a4f72;border-color:#1a4f72;">제출하기</button>
										</div>
									</div>
								
								</div>

							</div>

						</div>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width: 450px;">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">개인정보 수집 및 이용동의</h5>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<table class="table table-bordered">
						<tbody>
							<tr style="text-align: center;">
								<th style="width: 120px">목적</th>
								<td style="text-align: left;">검사소 기초역학조사 정보등록</td>
							</tr>

							<tr style="text-align: center;">
								<th style="width: 120px; vertical-align: middle;">항목</th>
								<td style="text-align: left;">주민/외국인등록번호, 이름, 생년월일, 성별, 국적, 휴대폰번호, 실거주지 주소, 직업, 증상, 검사경위</td>
							</tr>
							<tr style="text-align: center">
								<th style="width: 120px">보유기간</th>
								<td style="text-align: left;">코로나19 경계상황 종료 후 즉시 폐기</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button class="btn btn-primary" style="width: 50%">동의</button>
								</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</div>
	
	


<form id="questionForm" role="questionForm" action="gogo" method="post">
	<input id="rechkdYn" type="hidden" name="rechkdYn" value="" />
	<input id="rrn" type="hidden" name="rrn" value="" />
	<input id="pstiNm" type="hidden" name="pstiNm" value="" />
	<input id="gender" type="hidden" name="gender" value="" />
	<input id="pregnYn" type="hidden" name="pregnYn" value="N" />
	<input id="nlty" type="hidden" name="nlty" value="KOR" />
	<input id="pstiTelno" type="hidden" name="pstiTelno" value="" />
	<input id="pstiAdres" type="hidden" name="pstiAdres" value="" />
	<input id="jobCode" type="hidden" name="jobCode" value="" />
	<input id="feverYn" type="hidden" name="feverYn" value="" />
	<input id="symptms" type="hidden" name="symptms" value="" />
	<input id="vacCode" type="hidden" name="vacCode" value="" />
	<input id="inspNo" type="hidden" name="inspNo" value="" />
</form>

	<!-- //Stepper js -->
	<script src="https://cdn.jsdelivr.net/npm/bs-stepper/dist/js/bs-stepper.min.js"></script>
	<!-- 주소API js -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function inspSearch_go(){
	
	window.open("insp-list?backPage=question", "진료 신청 정보", "width=1280, height=900" ); 
	
}
	
function questionCancle(){
	
	var check = confirm("문진표 작성을 취소하시겠습니까?");
	
	if(check){
		history.go(-1);
	}
	else{
		return;
	}
	
}

function questionCheck(){
	
	var check = confirm("문진표를 등록하시겠습니까?");
	
	if(!check){
		return;
	}
	
	
	var pstiNm = $("input[id=psti_nm]").val();
	var rrn = $("input[id=psti_rrn]").val();
	
	var inspNm = $('#inspCheck').val();
	var symptomCheck = false;
	var arr_symptom = document.getElementsByClassName('symptom-list__checkbox'); 
	
    for(var i=0;i<arr_symptom.length;i++){
        if(arr_symptom[i].checked == true) {
        	symptomCheck = true;
            break;
        }
    }
	
    if(!symptomCheck){
 		alert("현재 증상을 한개이상 선택해 주세요.");
 		return false;
    }
    
    if(inspNm.length < 1){
    	alert("검사소를 선택해 주세요.");
    	return false;
    }
    
    $.ajax({
	    url : '<%=request.getContextPath()%>/guest/questionCheck',
	    type : 'post',
	    dataType : 'json',
	    data : {'pstiNm':pstiNm, 'rrn':rrn},
	    success : function(result){
	    	if(result > 0){
	    		alert("7일 이내에 검사받은 이력이 있어 문진표 등록이 불가능 합니다.");
	    		location.href='<%=request.getContextPath()%>/guest/guest-main';
	    	}else{
	    		questionRegist_go();
	    	}
	    
	    },
	    error : function(error){
	      alert('error' + error.status);
	    }
	  })
}

	
function questionRegist_go(){
	// 검사경위
	var rechkdYn = $("input[type=radio][name=chck_reason_code]:checked").val();
	$("input[id=rechkdYn]").val(rechkdYn);
	// 주민/외국인등록번호
	var rrn = $("input[id=psti_rrn]").val();
	$("input[id=rrn]").val(rrn);
	// 이름
	var pstiNm = $("input[id=psti_nm]").val();
	$("input[id=pstiNm]").val(pstiNm);
	// 성별
	var gender = $("input[type=radio][name=psti_sexdstn]:checked").val();
	$("input[id=gender]").val(gender);
	// 임신여부
	var pregnYn = $("input[type=radio][name=psti_pregnan_yn]:checked").val();
	$("input[id=pregnYn]").val(pregnYn);
	// 국적
	var nlty = $("input[id=psti_nlty_foreigner]").val();
	if(!nlty==""){
		$("input[id=nlty]").val(nlty);
	}else{
		$("input[id=nlty]").val("KOR");
	}
	// 연락처
	var pstiTelno = $("input[id=psti_telno]").val();
	$("input[id=pstiTelno]").val(pstiTelno);
	// 주소
	var psti_adres1 = $("input[id=psti_adres1]").val();
	var psti_adres2 = $("input[id=psti_adres2]").val();
	var pstiAdres = psti_adres1 + " " + psti_adres2;
	$("input[id=pstiAdres]").val(pstiAdres);
	// 직업
	var jobCode = $("select[id=job_select]").val();
	$("input[id=jobCode]").val(jobCode);
	// 발열여부
	var feverYn = $("input[type=radio][name=psti_pyrexia_yn]:checked").val();
	$("input[id=feverYn]").val(feverYn);
	// 증상 
	var symptms = []; 
	$("input[type=checkbox][name=psti_symptms]:checked").each(function(e){
		var value = $(this).val();
		symptms.push(value);
	});
	$("input[id=symptms]").val(symptms);
	// 백신접종 현황
	var vacCode = $("select[id=inocl_code]").val();
	$("input[id=vacCode]").val(vacCode);

	$("#questionForm").submit();

}


//Stepper setting
window.onload = function() {
	
$(function() {
	document.addEventListener('DOMContentLoaded', function() {
		window.stepper = new Stepper(document
				.querySelector('.bs-stepper'))
	})
})

// 여자일때 임신 여부 출력
$('input[type=radio][id=psti_sexdstn_w]').on('click', function(){
	var chkValuew = $('input[type=radio][id=psti_sexdstn_w]:checked');
	if(chkValuew){
		$('#pregnan').css('display', 'block');
	}
})
// 남자일때 임신 여부 숨기기
$('input[type=radio][id=psti_sexdstn_m]').on('click', function(){
	var chkValuem = $('input[type=radio][id=psti_sexdstn_m]:checked');
	if(chkValuem){
		$('#pregnan').css('display', 'none');
	}
})
// 내국일 일때 국적 입력칸 숨기기
$('input[type=radio][id=psti_nlty_korean]').on('click', function(){
	var chkValueKorea = $('input[type=radio][id=psti_nlty_korean]:checked');
	if(chkValueKorea){
		$('#psti_nlty_foreigner').css('display', 'none');
		$('#psti_nlty_foreigner').val("");
	}
})
// 외국인 일때 국적 입력칸 출력
$('input[type=radio][id=psti_nlty_foreigner_check]').on('click', function(){
	var chkValueForeigner = $('input[type=radio][id=psti_nlty_foreigner_check]:checked');
	if(chkValueForeigner){
		$('#psti_nlty_foreigner').css('display', 'block');
	}
})
// 발열 여부 예 일때 입력칸 출력
$('input[type=radio][id=psti_pyrexia_y]').on('click', function(){
	var chkValuepyrexiaY = $('input[type=radio][id=psti_pyrexia_y]:checked');
	if(chkValuepyrexiaY){
		$('#pyrexia').css('display', 'block');
	}
})
// 발열 여부 아니오 일때 입력칸 숨기기
$('input[type=radio][id=psti_pyrexia_n]').on('click', function(){
	var chkValuepyrexiaN = $('input[type=radio][id=psti_pyrexia_n]:checked');
	if(chkValuepyrexiaN){
		$('#pyrexia').css('display', 'none');
	}
})
// 온도 모릅니다 버튼 클릭시 input value 사라짐.
$('#pyrexiadonknow').on('change', function(){
	var chkValue = $('input[type=checkbox][id=pyrexiadonknow]:checked');
	if(chkValue){
		$('#pyrexia_input').val("");
	}
})
// 온도 input value 기입시 온도 모릅니다 버튼 클릭 해제
$('#pyrexia_input').on('keyup', function(){
	$('#pyrexiadonknow').prop('checked', false);
})

// 온도 잘 모릅니다 폼 클릭시 체크/해제
$('#pyrexiacheck').on('click', function(){
	var chkValue = $('#pyrexiadonknow').attr('checked');
	if(chkValue == 'checked'){
		$('#pyrexiadonknow').attr('checked', false);
	}else{
		$('#pyrexiadonknow').attr('checked', true);
	}
})
// 개인제공 폼 클릭시 체크/해제
$('#personokay').on('click', function(){
 	var chkValue = $('#chk_person').attr('checked');
 	if(chkValue == 'checked'){
		$('#chk_person').attr('checked', false);
 	}else{
		$('#chk_person').attr('checked', true);
 	}
})
// 주민등록번호 입력시 생년월일, 성별 자동 체크/해제
$('#psti_rrn').on('change', function(){
	var rrn_length = $('#psti_rrn').val().length;

	if(rrn_length == 14){
		var year = $('#psti_rrn').val().substring(0,2)
		if(year <= 22){
		var birth = '20'+ $('#psti_rrn').val().substring(0,6);
		}else{
		var birth = '19'+ $('#psti_rrn').val().substring(0,6);
		}

		$('#birth').val(birth);

		var sex = $('#psti_rrn').val().substring(7,8);
		var response_sexw = sex % 2 == 0;
		var response_sexm = sex % 2 == 1;
		if(response_sexw){
			$('#psti_sexdstn_w').trigger('click');
			$('#psti_pregnan_n').trigger('click');
		}
		if(response_sexm){
			$('#psti_sexdstn_m').trigger('click');
			$('#psti_pregnan_n').trigger('click');
		}
	}

})

// 검사경위 버튼 checked 값 변경
$('#chck_reason_code_my').on('click', function(){
	$('#chck_reason_code_my').attr('checked', true);
	$('#chck_reason_code_sick').attr('checked', false);
})
$('#chck_reason_code_sick').on('click', function(){
	$('#chck_reason_code_sick').attr('checked', true);
	$('#chck_reason_code_my').attr('checked', false);
})

// 국적 버튼 토글 checked 값 변경
$('#psti_nlty_korean').on('click', function(){
	$('#psti_nlty_korean').attr('checked', true);
	$('#psti_nlty_foreigner_check').attr('checked', false);
})
$('#psti_nlty_foreigner_check').on('click', function(){
	$('#psti_nlty_foreigner_check').attr('checked', true);
	$('#psti_nlty_korean').attr('checked', false);
})

// 발열 여부 버튼 checked 값 변경
$('#psti_pyrexia_y').on('click', function(){
	$('#psti_pyrexia_y').attr('checked', true);
	$('#psti_pyrexia_n').attr('checked', false);
})
$('#psti_pyrexia_n').on('click', function(){
	$('#psti_pyrexia_n').attr('checked', true);
	$('#psti_pyrexia_y').attr('checked', false);
	$('#pyrexia_input').val("");
	$('#pyrexiadonknow').attr('checked', false);
})
//문항 입력 확인
$('#nextview').on('click', function(){
	var rrn = $('#psti_rrn').val();
	var nm = $('#psti_nm').val();
	var bth = $('#birth').val();
	var tel = $('#psti_telno').val();
	var adres = $('#psti_adres1').val();
	var adress = $('#psti_adres2').val();
	

	var rrn_length = $('#psti_rrn').val().length;
	if(rrn_length < 14){
		alert("주민/외국인등록번호를 잘못 입력하셨습니다.\n다시 작성해주세요.")
		return previous();
	}

	if(!(rrn && nm && bth && tel && adres && adress)){
		alert("모든 문항을 입력해주셔야 다음문항으로 이동이 가능합니다.");
		return previous();
	}

})
// 전송 버튼 클릭시, 동의서 체크 확인
$('#psti_submit').on('click', function(){
	var person = $('#chk_person').is(':checked');
	var pyrexiay = $('#psti_pyrexia_y').is(':checked');
	var pyrexian = $('#psti_pyrexia_n').is(':checked');

	if(!(pyrexiay || pyrexian)){
		alert("발열 여부를 선택해주세요.")
		return;
	}

	if(!(person)){
		alert("개인 정보 수집 동의서에 체크를 해주셔야만 문진표 제출이 가능합니다.");
		return;
	}
})
// 증상없을 클릭시 증상 클릭 체크 해제
$('#smptm_999').on('click', function(){
	var smptm = $('#smptm_999').is(':checked');
	if(smptm){
		$('#unchecked input[name=psti_symptms]').prop('checked', false);
	}
})
// 증상 있음 클릭시 증상 없음 체크 해제
$('#unchecked .symptom-list__checkbox').on('click', function(){
	$('#smptm_999').prop('checked', false);
})

$('#modal').on('click', function(){
	$('#myModal').show();

})

} // window.onload function

// 주민등록번호 하이픈 자동 입력
const rrnAutoHyphen = (target) =>{
	target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{6})(\d{1,7})$/,`$1-$2`);
}

// 연락처 하이픈 자동 입력
const autoHyphen = (target) => {
	target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/,`$1-$2-$3`);
}

//Stepper setting
function ready() {
	var stepper = new Stepper(document.querySelector('.bs-stepper'));
	stepper.next();
}
function previous() {
	var stepper = new Stepper(document.querySelector('.bs-stepper'));
	stepper.previous();
}

//주소 API
function address_go() {
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
                document.getElementById("psti_adres1").value = extraAddr;

            } else {
                document.getElementById("psti_adres1").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('psti_adresnum').value = data.zonecode;
            document.getElementById("psti_adres1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("psti_adres2").focus();
        }
    }).open();
}

</script>

<!-- 데이터 입력버튼 스크립트 -->
<script>
function fillQuestion(){
	
	var names = [
		
		'오형우'
		 /* ,'배다정','추수진','임서은','조태우'
		,'손미선','손태훈','추서진','김세정','홍지하'
		,'남상혁','윤광수','조홍기','윤예성','서희태'
		,'손도영','성태호','허석훈','조재웅','전선아'
		,'이버들','김다운','오샘','홍한길','장샘'
		,'손나길','추다운','박달','홍한길','탁한결'
		,'정다운','남궁믿음','배나길','예믿음','성우람'
		,'고믿음','정믿음','신미르','풍달','설다운'
		,'이광준','설시혁','남궁윤정','손혜경','고상현'
		,'추주혁','서경아','노선옥','제갈지웅','유민성'
		,'김민준','이민준','박민준','김서연','이서연','박서연',
		'김서준','이서준','박서준','김서윤','이서윤','박서연',
		'김예준','이예준','박예준','김지우','이지우','박지우',
		'김도윤','이도윤','박도윤','김서현','이서현','박서현',
		'김시우','이시우','박시우','김민서','이민서','박민서',
		'김주원','이주원','박주원','김하은','이하은','박하은',
		'김하준','이하준','박하준','김하윤','이하윤','박하윤',
		'김지호','이지호','박지호','김윤서','이윤서','박윤서',
		'김지후','이지후','박지후','김지유','이지유','박지유',
		'김준서','이준서','박준서','김지민','이지민','박지민',
		'김준우','이준우','박준우','김채원','이채원','박채원',
		'김현우','이현우','박현우','김지윤','이지윤','박지윤',
		'김도현','이도현','박도현','김은서','이은서','박은서',
		'김지훈','이지훈','박지훈','김수아','이수아','박수아',
		'김건우','이건우','박건우','김다은','이다은','박다은',
		'김우진','이우진','박우진','김예은','이예은','박예은',
		'김선우','이선우','박선우','김지아','이지아','박지아',
		'김서진','이서진','박서진','김수빈','이수빈','박수빈',
		'김민재','이민재','박민재','김소율','이소율','박소율',
		'김현준','이현준','박현준','김예린','이예린','박예린',
		'김연우','이연우','박연우','김예원','이예원','박예원',
		'김유준','이유준','박유준','김지원','이지원','박지원',
		'김정우','이정우','박정우','김소윤','이소윤','박소윤'
		,'김승우','이승우','박승우','김민주','이민주','박민주',
		'김승현','이승현','박승현','김지은','이지은','박지은',
		'김시윤','이시윤','박시윤','김나은','이나은','박나은',
		'김준혁','이준혁','박준혁','김소은','이소은','박소은',
		'김은우','이은우','박은우','김다현','이다현','박다현',
		'김지환','이지환','박지환','김나윤','이나윤','박나윤',
		'김승민','이승민','박승민','김지율','이지율','박지율',
		'김유찬','이유찬','박유찬','김유빈','이유빈','박유빈',
		'김윤우','이윤우','박윤우','김채윤','이채윤','박채윤',
		'김민성','이민성','박민성','김유주','이유주','박유주',
		'김준영','이준영','박준영','김아린','이아린','박아린',
		'김시후','이시후','박시후','김시아','이시아','박시아',
		'김진우','이진우','박진우','김서영','이서영','박서영',
		'김수현','이수현','박수현','김민지','이민지','박민지',
		'김재윤','이재윤','박재윤','김예진','이예진','박예진',
		'김동현','이동현','박동현','김서아','이서아','박서아',
		'김수호','이수호','박수호','김예나','이예나','박예나',
		'김태윤','이태윤','박태윤','김예서','이예서','박예서',
		'김민규','이민규','박민규','김주아','이주아','박주아',
		'김재원','이재원','박재원','김시연','이시연','박시연',
		'김한결','이한결','박한결','김연서','이연서','박연서',
		'김재민','이재민','박재민','김하율','이하율','박하율',
		'김은찬','이은찬','박은찬','김다인','이다인','박다인'
		,'한상현','오성철','신희호','권규환','황보미희'
		,'심창식','하승옥','손지혁','임민영','안종하'
		,'강한길','남궁힘찬','성나라우람','조우람','조다운'
		,'임다운','박한길','설한길','권미르','이빛가람'
		,'서샘','복한길','전미르','손달','정한결'
		,'윤한결','조한길','백힘찬','남궁나라우람','이나길'
		,'허구름','한한별','탁하늘','복꽃','전햇살'
		,'손산다라','하여름','남궁별','복샛별','이겨울'
		,'류구름','임겨울','추새론','안마리','복은샘'
		,'정그루','강라온','손슬기','탁온','사공샘나' */
		
	];
	
	var addrs = [
		
/* 		 '서울 강남구 테헤란로22길 66','서울 송파구 동남로 99','서울 은평구 갈현로 181','서울 종로구 북촌로 31-4','서울 동대문구 서울시립대로 5'
		,'서울 강남구 테헤란로22길 66','서울 송파구 동남로 99','서울 은평구 갈현로 181','서울 종로구 북촌로 31-4','서울 동대문구 서울시립대로 5'
		,'서울 강남구 테헤란로22길 66','서울 송파구 동남로 99','서울 은평구 갈현로 181','서울 종로구 북촌로 31-4','서울 동대문구 서울시립대로 5'
		,'서울 강남구 테헤란로22길 66','서울 송파구 동남로 99','서울 은평구 갈현로 181','서울 종로구 북촌로 31-4','서울 동대문구 서울시립대로 5'
		,'서울 강남구 테헤란로22길 66','서울 송파구 동남로 99','서울 은평구 갈현로 181','서울 종로구 북촌로 31-4','서울 동대문구 서울시립대로 5'
		,'서울 강남구 테헤란로22길 66','서울 송파구 동남로 99','서울 은평구 갈현로 181','서울 종로구 북촌로 31-4','서울 동대문구 서울시립대로 5'
		,'부산 사상구 가야대로 1','부산 강서구 가덕해안로 3','부산 남구 무민사로 5','부산 사하구 감내1로 7','부산 강서구 경전철로 10'
		,'대구 수성구 고모로 31','대구 북구 문주길 2','대구 남구 경상길 1','대구 동구 경안로 790-11','대구 달서구 감삼길 15'
		,'인천 남동구 간석로 1','인천 부평구 갈산로 2','인천 계양구 갈미길 18-3','인천 강화군 강화읍 갑룡길 3','인천 강화군 강화읍 강화대로 96'
		,'광주 동구 경양로 211','광주 광산구 가마길 2-21','광주 남구 구성로 116','광주 북구 각화대로 2','광주 서구 구성로 1' */
		
		'대전 중구 대흥로 7'
		/* 
		'대전 서구 가수원로 5','대전 동구 대전로 387','대전 유성구 동서대로 195','대전 대덕구 계족로 535','대전 유성구 노은동로 8'
		,'대전 서구 가수원로 5','대전 동구 대전로 387','대전 유성구 동서대로 195','대전 대덕구 계족로 535','대전 유성구 노은동로 8'
		,'대전 서구 가수원로 5','대전 동구 대전로 387','대전 유성구 동서대로 195','대전 대덕구 계족로 535','대전 유성구 노은동로 8'
		,'대전 서구 가수원로 5','대전 동구 대전로 387','대전 유성구 동서대로 195','대전 대덕구 계족로 535','대전 유성구 노은동로 8'
		,'대전 서구 가수원로 5','대전 동구 대전로 387','대전 유성구 동서대로 195','대전 대덕구 계족로 535','대전 유성구 노은동로 8'
		,'대전 서구 가수원로 5','대전 동구 대전로 387','대전 유성구 동서대로 195','대전 대덕구 계족로 535','대전 유성구 노은동로 8' */
/* 		,'울산 남구 갈밭로 3','울산 북구 가대서길 25','울산 동구 고늘로 6','울산 중구 강정3길 57','울산 북구 구유길 2'
		,'경기 가평군 가평읍 가랫골길 1','경기 안성시 가사길 7-5','경기 여주시 가업길 12','경기 의정부시 고산로 43-21','경기 파주시 교하로 573'
		,'경기 가평군 가평읍 가랫골길 1','경기 안성시 가사길 7-5','경기 여주시 가업길 12','경기 의정부시 고산로 43-21','경기 파주시 교하로 573'
		,'경기 가평군 가평읍 가랫골길 1','경기 안성시 가사길 7-5','경기 여주시 가업길 12','경기 의정부시 고산로 43-21','경기 파주시 교하로 573'
		,'경기 가평군 가평읍 가랫골길 1','경기 안성시 가사길 7-5','경기 여주시 가업길 12','경기 의정부시 고산로 43-21','경기 파주시 교하로 573'
		,'경기 가평군 가평읍 가랫골길 1','경기 안성시 가사길 7-5','경기 여주시 가업길 12','경기 의정부시 고산로 43-21','경기 파주시 교하로 573'
		,'경기 가평군 가평읍 가랫골길 1','경기 안성시 가사길 7-5','경기 여주시 가업길 12','경기 의정부시 고산로 43-21','경기 파주시 교하로 573'
		,'강원 동해시 강원남부로 4589','강원 삼척시 강원남부로 4330','강원 원주시 가치래미길 1','강원 화천군 간동면 가래울길 20','강원 삼척시 동해대로 4273-1'
		,'전남 순천시 가곡길 2','전남 구례군 간전면 간문대평1길 1','전남 나주시 금남길 47-2','전남 화순군 사평면 개정지길 4','전남 목포시 만호로 29' */

	];
	
	var addrcode = [
		
		 /* '6245','5831','3325','3055','2592'
		,'6245','5831','3325','3055','2592'
		,'6245','5831','3325','3055','2592'
		,'6245','5831','3325','3055','2592'
		,'6245','5831','3325','3055','2592'
		,'6245','5831','3325','3055','2592'
		,'46990','46769','48557','49376','46719'
		,'42260','41491','42463','41073','42642'
		,'21510','21316','21002','23036','23026'
		,'61421','62404','61636','61165','61924' */
		
		'34944'
		
		/* 
		'35389','34694','34208','34395','34147'
		,'35389','34694','34208','34395','34147'
		,'35389','34694','34208','34395','34147'
		,'35389','34694','34208','34395','34147'
		,'35389','34694','34208','34395','34147'
		,'35389','34694','34208','34395','34147'
		
		 */
		/* ,'44715','44211','44056','44468','44233'
		,'12427','17585','12645','11801','10882'
		,'12427','17585','12645','11801','10882'
		,'12427','17585','12645','11801','10882'
		,'12427','17585','12645','11801','10882'
		,'12427','17585','12645','11801','10882'
		,'12427','17585','12645','11801','10882'
		,'25820','25906','26314','24134','25908'
		,'57923','57628','58248','58144','58753' */

	];
	
	var random = Math.floor(Math.random() * names.length);
	
	var addrRandom = Math.floor(Math.random() * addrs.length);
	
	// 주민번호 앞자리의 첫번째 자리
	var random1 = 10 - Math.floor(Math.random() * 5) - 1;
	
	// 주민번호 앞자리의 두번째 자리
	var random5 = 9 - Math.floor(Math.random() * 5) - 1;
	var random2 = 9 - Math.floor(Math.random() * 5) - 1;
	var random3 = 9 - Math.floor(Math.random() * 5) - 1;
	var random4 = 9 - Math.floor(Math.random() * 5) - 1;
	
	// 주민번호 뒷자리의 첫번째 자리, 1, 2
	var random11 = Math.floor(Math.random() * 2) + 1;
	
	// 주민번호 뒷자리의 나머지 자리
	var random12 = 9 - Math.floor(Math.random() * 10);
	var random13 = 9 - Math.floor(Math.random() * 10);
	var random14 = 9 - Math.floor(Math.random() * 10);
	var random15 = 9 - Math.floor(Math.random() * 10);
	var random16 = 9 - Math.floor(Math.random() * 10);
	var random17 = 9 - Math.floor(Math.random() * 10);
	
	console.log(random1, random5, '0', random2, '0', random4, '-', random11, random12, random13, random14, random15, random16, random17);
	
	var rrn = '' + random1 + random5 + '0' + random2 + '0' + random4 
			+ '-'
			+ '1' + random12 + random13 + random14 + random15 + random16 + random17;
	
	document.getElementById('psti_rrn').value = rrn;
	
	var sex = rrn.substring(7,8);
	var response_sexw = sex % 2 == 0;
	var response_sexm = sex % 2 == 1;
	if(response_sexw){
		$('#psti_sexdstn_w').trigger('click');
		$('#psti_pregnan_n').trigger('click');
	}
	if(response_sexm){
		$('#psti_sexdstn_m').trigger('click');
		$('#psti_pregnan_n').trigger('click');
	}
	
	document.getElementById('psti_nm').value = names[random];
	document.getElementById('birth').value = '19'+ random1 + random5 + '0' + random2 + '0' + random4;
	document.getElementById('psti_telno').value = '010-3941-7733';
	document.getElementById('psti_adresnum').value = addrcode[addrRandom];
	document.getElementById('psti_adres1').value = addrs[addrRandom];
	document.getElementById('psti_adres2').value = '상세주소';
	$('#psti_pyrexia_n').attr('checked', 'checked');
	$('#pyrexia_n').addClass('active');
	$('#smptm_999').prop('checked', true);
	$('#chk_person').prop('checked', true);
	
	var vacCodeData = [
		
		'J101'
		,'J102'
		,'J103'
		,'J104'
	];
	
	var vacCodeRandom = Math.floor(Math.random() * vacCodeData.length);
	
	$("select[id=inocl_code]").val(vacCodeData[vacCodeRandom]);
	$("input[id=vacCode]").val(vacCodeData[vacCodeRandom]);
	
	var jobCodeData = [
		
		'I101'
		,'I102'
		,'I103'
		,'I104'
		,'I114'
		,'I105'
		,'I106'
		,'I107'
		,'I108'
		,'I109'
		,'I110'
		,'I111'
		,'I115'
		,'I112'
		,'I113'
		
	];
	
	var jobCodeRandom = Math.floor(Math.random() * jobCodeData.length);
	
	$("select[id=job_select]").val(jobCodeData[jobCodeRandom]);
	$("input[id=jobCode]").val(jobCodeData[jobCodeRandom]);
	
	
	// dquestionRegist_go();
	
}
</script>

</body>




































