<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mber" value="${mber}" />
<<c:set var="chk" value="${checkCeo}"/>
<title></title>

<head></head>

<body>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="wrapper">
	<div class="card">
			<div class="card-primary">
			  <div class="card-header" style="background-color: #1a4f72;">
			    <h3 class="card-title">내 정보</h3>
			  </div>
			  <!-- /.card-header -->
			  <!-- form start -->
			  
			<form role="form" action="<%=request.getContextPath() %>/common/modify-Info" method="post" enctype="multipart/form-data" >
			  <div class="card-body">
			    <div class="row" style="margin-bottom: 20px;">
			        <label for="instNm" class="col-md-2 text-right" style="padding-top: 7px;">소속기관</label>
				      <div class="col-md-3">
				        <input type="text" class="form-control" id="instNm" name="instNm" value="${mber.instNm}" readonly>
				      </div>
			      
			        <label for="mberNo" class="col-md-2 text-right" style="padding-top: 7px;">소속번호</label>
				      <div class="col-md-4">
				        <input type="text" class="form-control" id="mberNo" name="mberNo" value="${mber.mberNo}" readonly>
				      </div>
			    </div>
			    
			    <div class="row" style="margin-bottom: 20px;">
			        <label for="mberNm" class="col-md-2 text-right" style="padding-top: 7px;">성명</label>
				      <div class="col-md-3">
				        <input type="text" class="form-control" id="mberNm" name="mberNm"  value="${mber.mberNm }" readonly>
				      </div>
			      
			        <label for="mberBir" class="col-md-2 text-right" style="padding-top: 7px;">생년월일</label>
				      <div class="col-md-4">
				        <input type="date" class="form-control" id="mberBir" name="mberBir" value='<fmt:formatDate value="${mber.mberBir }" pattern="YYYY-MM-DD"/>' readonly>
				      </div>
			    </div>
			    
			    <div class="row" style="margin-bottom: 20px;">
			        <label for="mberTelno" class="col-md-2 text-right" style="padding-top: 7px;">연락처</label>
				      <div class="col-md-3">
				        <input type="text" name="mberTelno" class="form-control" maxlength="13" oninput="autoHyphen(this)" id="mberTelno" value='${mber.mberTelno }' readonly>
				      </div>
			      
			        <label for="mberEmail" class="col-md-2 text-right" style="padding-top: 7px;">이메일</label>
				      <div class="col-md-4">
				        <input type="text" name="mberEmail" class="form-control" id="mberEmail" value='${mber.mberEmail }' readonly>
				      </div>
			    </div>

				<div class="row" style="margin-bottom: 20px;">
			        <label for="mberAdres" class="col-md-2 text-right">주소</label>
			          <div class="col-md-9" id="changeClass">
			            <input type="text" class="form-control" name="mberAdres" id="mberAdres" value='${mber.mberAdres }' readonly>
			          </div>
			          <div class="col-md-2" style="display: none" id="showAdres">
			          <button type="button" onclick="adress();" class="btn btn-block btn-secondary" style="background-color: #1a4f72; border-color: #1a4f72">주소검색</button>
			          </div>
			   </div>
			   
			   <c:if test="${chk eq 'Y' }">
				   <div class="row">
			   		 	<label class="col-md-2 text-right">직인</label>
					   	<div class="input-group float-left col-md-12" style="max-width: 600px; width:300px;">
							<span class="input-group-append">
							  	<input type="hidden" name="checkFile" id="checkFile" value="N">		 
								<input type="text" id="file_name" value="${fileName}" class="form-control" style="padding-top: 7px;" readonly="readonly"/>
								<label for="seal" class="btn btn-block btn-secondary" style="width: 45%;border-radius: 0.25rem;margin-left: -10px;">파일선택</label>
								
						   		 	<input type="file" id="seal" disabled="disabled" name="mypageFile" onchange="fillFileName()" style="display:none;" />
							</span>
						</div> 	
				   </div>
			   </c:if>
			   
			    <div class="row">
				    <div class="col-md-5"></div>
                    
                    <div class="col-md-2" id="canclebtn" style="visibility: hidden;">
                        <button type="button" onclick="cancle();" class="btn btn-block btn-secondary" style="background-color: #1a4f72; border-color: #1a4f72;">취소</button>
                    </div>
				    
				    <div class="col-md-2" id="submitbtn" style="display: none">
				   		<button type="button" onclick="submitbtn()" class="btn btn-block btn-secondary" style="background-color: #1a4f72; border-color: #1a4f72;">등록</button>
				    </div>
				    <div class="col-md-2" id="modifybtn">
				   		<button type="button" onclick="changeInfo();" class="btn btn-block btn-secondary" style="background-color: #1a4f72; border-color: #1a4f72;">내 정보 수정</button>
				    </div>
				    <div class="col-md-2">
				   		<button type="button" onclick="passwordChange();" class="btn btn-block btn-secondary" style="background-color: #1a4f72; border-color: #1a4f72;" onclick="changepwd();">비밀번호 변경</button>
				    </div>
			    </div>
			    
			 </div>
		</form>						  	   		 
			    <!-- /.card-body -->
			    
			    
			</div>
	</div>
</div>

<script>

function fillFileName(){
	var fileValue = $('#seal').val().split("\\");
	var fileName = fileValue[fileValue.length-1];
	$('#file_name').val(fileName);
	$('#checkFile').val('Y');
}

function passwordChange(){
	OpenWindow('<%=request.getContextPath()%>/common/change-password', '비밀번호 변경','450','350');
}

function cancle(){
	
	$('#mberTelno').attr('readonly', true);
	$('#mberEmail').attr('readonly', true);
	$('#mberAdres').attr('readonly', true);
	
	$('#seal').attr('disabled', true);
	
	$('#mberTelno').css('border', '');
	$('#mberEmail').css('border', '');
	$('#mberAdres').css('border', '');
	
	$('#changeClass').removeClass('col-md-7');
	$('#changeClass').addClass('col-md-9');
	$('#showAdres').css('display', 'none');
	$('#submitbtn').css('display', 'none');
	$('#modifybtn').css('display', 'inline');	
	
	$('#canclebtn').css('visibility', 'hidden');
	
	alert('내정보 수정을 취소하였습니다.');
}

function changeInfo(){
	$('#mberTelno').attr('readonly', false);
	$('#mberEmail').attr('readonly', false);
	$('#mberAdres').attr('readonly', false);
	$('#seal').attr('disabled', false);
	
	$('#mberTelno').css('border', '1px solid blue');
	$('#mberEmail').css('border', '1px solid blue');
	$('#mberAdres').css('border', '1px solid blue');
	
	$('#changeClass').removeClass('col-md-9');
	$('#changeClass').addClass('col-md-7');
	$('#showAdres').css('display', 'inline');
	$('#submitbtn').css('display', 'inline');
	$('#modifybtn').css('display', 'none');
	
	$('#canclebtn').css('visibility', 'visible');
}
function submitbtn(){
	// 수정정보 전달 ajax
	
	$('form[role="form"]').submit();
	
	
	<%-- var mberNo = $('#mberNo').val();
	var mberTelno = $('#mberTelno').val();
	var mberAdres = $('#mberAdres').val();
	var mberEmail = $('#mberEmail').val();
	var mberNm = $('#mberNm').val();
	var mypageFile = $('input[type="file"]').val();
	$.ajax({
		url : '<%=request.getContextPath()%>/common/modify-Info',
		type : 'POST',
		data : {'mypageFile': mypageFile, 'mberNo' : mberNo, 'mberTelno' : mberTelno, 'mberAdres' : mberAdres, 'mberEmail' : mberEmail},
		success : function(){
			$('#mberTelno').attr('readonly', true);
			$('#mberEmail').attr('readonly', true);
			$('#mberAdres').attr('readonly', true);
			
			$('#mberTelno').css('border', '');
			$('#mberEmail').css('border', '');
			$('#mberAdres').css('border', '');
			
			$('#changeClass').removeClass('col-md-7');
			$('#changeClass').addClass('col-md-9');
			$('#showAdres').css('display', 'none');
			$('#submitbtn').css('display', 'none');
			$('#modifybtn').css('display', 'inline');
			
			$('#canclebtn').css('visibility', 'hidden');
			
			alert(mberNm+"님의 정보가 성공적으로 수정되었습니다.");
		},
		error : function(error){
			alert('error'+error.status);
		}
		
	}) --%>
}
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
                document.getElementById("mberAdres").value = extraAddr;
            
            } else {
                document.getElementById("mberAdres").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("mberAdres").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("mberAdres").focus();
        }
    }).open();
}
const autoHyphen = (target) => {
	target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/,`$1-$2-$3`);
}
</script>

</body>