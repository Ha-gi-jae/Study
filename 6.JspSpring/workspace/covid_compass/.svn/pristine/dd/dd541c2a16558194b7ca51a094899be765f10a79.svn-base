<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<title>직원등록</title>
<style>
.row {
	margin-bottom: 10px;
}
</style>
<body>
	<div class="card card-success">
		<div class="register-card-body">
			<div class="card-header"
				style="background-color: #1a4f72; color: white;">
				<h3 class="card-title">직원등록</h3>
			</div>
		</div>
		<div class="card-body">
		 
			<div class="row" style="margin-bottom: 7px;">

				<label for="inputEmail3" class="col-md-2 control-label text-right "
					style="padding-top: 7px;">아이디</label>
				<div class="col-md-3">
					<input name="mberId" type="text" class="form-control" id="mber_id" value="" onkeyup="idcheck();">
				<span id="idcheck"></span>		
				</div>

				<label for="inputEmail3" class="col-md-2 control-label text-right "
					style="padding-top: 7px;">패스워드</label>
				<div class="col-md-4">
					<input name="mberPwd" type="password" class="form-control" id="mber_pwd" value="" autocomplete="off" onkeyup="pwdCheck();">
					<span id="pwdcheck"></span>
				</div>
			</div>


         <div class="row" style="margin-bottom: 7px;">
			<label for="inputEmail3" class="col-md-2 control-label text-right "
				style="padding-top: 7px;">성명</label>
			<div class="col-md-3">
				<input name="mberNm" type="text" class="form-control" id="mber_nm" value="" onkeyup="nameCheck();" >
				<span id="namecheck"></span>
			</div>
			<div class="col-md2"></div>
			<label for="inputEmail3" class="col-md-2 control-label text-right " style="padding-top: 7px;">생년월일</label>
			<div class="col-sm-4">
				<input name="mberBir" type="date" class="form-control"
					id="mber_bir" value="">
			</div>
		</div>
		
		<div class="row" style="margin-bottom: 7px;">
			<label for="inputEmail3" class="col-md-2 control-label text-right "
				style="padding-top: 7px;">연락처</label>
			<div class="col-sm-3">
				<input name="mberTelno" type="text" class="form-control"
					id="mber_telno" value="" onkeyup="telCheck();" oninput="autoHyphen(this);" maxlength="13">
				<span id="telcheck"></span>	
			</div>
			
			<label for="inputEmail3" class="col-md-2 control-label text-right "
				style="padding-top: 7px;">이메일</label>
			<div class="col-sm-4">
				<input name="mberEmail" type="email" class="form-control"
					id="mber_email" value="" onkeyup="emailCheck();">
				<span id="emailcheck"></span>	
			</div>
		</div>
		
		
		<div class="row" style="margin-bottom: 7px;">
			<label for="inputEmail3" class="col-md-2 control-label text-right "
				style="padding-top: 7px;">주소</label>
			<div class="col-md-7">
				<input name="mberAdres" type="text" class="form-control"
					id="mber_adres" value="">
					
			</div>
			<div class="col-md-2" >
				  <button type="button" onclick="address_go();" class="btn btn-secondary" style="float: right; width:100%; background-color: #1a4f72;">검색</button>
			</div>
			
		</div>
		
		
		<div class="row" style="margin-bottom: 7px;">
			<label for="mberInstNm" class="col-md-2 control-label text-right "
				style="padding-top: 7px;">소속기관</label>
			<div class="col-sm-3">
				<input name="pstiNm" type="text" class="form-control"
					id="mber_instNm" value="${hspt.instNm }" readonly>
			</div>
			<label for="mberInstNo" class="col-md-2 control-label text-right "
				style="padding-top: 7px;">소속번호</label>
			<div class="col-sm-4">
				<input name="pstiNm" type="text" class="form-control"
					id="mber_instNo" value="${hspt.instNo }" readonly>
			</div>
		</div>
		<div class="row" style="margin-bottom: 7px;">
			<div class="col-md-7"></div>
			<div class="col-md-2">
			<button style="background-color: #1a4f72;border-color: #1a4f72;" type="submit" class="btn btn-block btn-primary btn-sm" onclick="mberRegist();">등록</button>
			</div>
			<div class="col-md-2">
			<button style="background-color: #c82333;border-color: #bd2130;" type="button" class="btn btn-block btn-primary btn-sm" onclick="window.close();">닫기</button>
			</div>
		</div>
	  
	</div>
</div>
	<form id="mberRegist" action="mberRegist" method="POST">
		<input type="hidden" id="mberId" name="mberId" value="" /> 
		<input type="hidden" id="mberPwd" name="mberPwd" value="" /> 
		<input type="hidden" id="mberNm" name="mberNm" value="" /> 
	    <input type="hidden" id="mberBir" name="mberBir" value="" /> 
	    <input type="hidden" id="mberTelno" name="mberTelno" value="" /> 
	    <input type="hidden" id="mberEmail" name="mberEmail" value="" /> 
	    <input type="hidden" id="mberAdres" name="mberAdres" value="" /> 
	    <input type="hidden" id="instNo" name="instNo" value="${hspt.instNo }" />
	    <input type="hidden" id="mberCode" name="mberCode" value="${mberCode}" />
	</form>	

	<script>
	
	var checkId   = false; 
	var checkPwd   = false;
	var checkNm    = false;
	var checkTelno = false;
	var checkEmail = false;
			
		function mberRegist() {
			var result = confirm("등록하시겠습니까");
			
			if (result) {
                
				var mberId    = document.getElementById("mber_id").value
				var mberPwd   = document.getElementById("mber_pwd").value
				var mberNm    = document.getElementById("mber_nm").value
				var mberBir   = document.getElementById("mber_bir").value
				var mberTelno = document.getElementById("mber_telno").value
				var mberEmail = document.getElementById("mber_email").value
				var mberAdres = document.getElementById("mber_adres").value				
				var instNo = document.getElementById("mber_instNo").value				
				var mberCode = document.getElementById("mberCode").value				
				
				if(checkId==false){
				 alert("ID를 확인하세요");
				 document.getElementById("mber_id").focus();
				 return;
				}
				if(checkPwd==false){
					 alert("비밀번호를 확인하세요");
					 document.getElementById("mber_pwd").focus();
					 return;
					}
				if(checkNm==false){
					 alert("이름을 확인하세요");
					 document.getElementById("mber_nm").focus();
					 return;
					}
				if(checkTelno==false){
					 alert("연락처를 확인하세요");
					 document.getElementById("mber_telno").focus();
					 return;
					}
				if(mberBir==""){
					 alert("생일을 확인하세요");
					 document.getElementById("mber_bir").focus();
					 return;
					}	
				if(checkEmail==false){
					 alert("이메일을 확인하세요");
					 document.getElementById("mber_email").focus();
					 return;
					}
							
					
				$.ajax({
					url : '<%=request.getContextPath()%>/hspt/mberRegist',
					type : 'post',
					data : { 'mberId' : mberId
						,'mberPwd' : mberPwd
						,'mberNm' : mberNm
						,'mberBir' : mberBir
						,'mberTelno' : mberTelno
						,'mberEmail' : mberEmail
						,'mberAdres' : mberAdres
						,'instNo' : instNo
						,'mberCode' : mberCode},
					success : function(resp){
						alert(mberNm+"님이 등록되었습니다.")
						window.opener.parent.location.reload();
						window.close();
					   },
					error : function(error){
						alert('erfror' + error.status);
						
					}
					
				})
				 
								
				$('#mberRegist').submit();
			} else {
				
				return false;
			}

		}

		function address_go() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
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
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("mber_adres").value = extraAddr;

							} else {
								document.getElementById("mber_adres").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById("mber_adres").value = addr

						}
					}).open();
		}
		
		function idcheck(){
			var mberId = $("#mber_id").val();
						
			$.ajax({
				type : 'POST',
				url : '<%=request.getContextPath()%>/rest-hspt/idcheck',
				data : {'mberId':mberId},
				
				success : function(resp){
					var reg_id = /^[A-Za-z]{1}[A-Za-z0-9_-]{3,19}$/
								
						if(resp=='fail'){
						
							$('#idcheck').css('color','red')
							$('#idcheck').html("중복된 아이디 입니다.")
							checkId = false;
						}else{
							if(!reg_id.test($("#mber_id").val())){
								$('#idcheck').css('color','red')
								$('#idcheck').html("아이디는 반드시 영문으로 시작, 4~20자 내외로 설정하세요.")		
								checkId = false;
								}else{
									$('#idcheck').css('color','blue')
									$('#idcheck').html("사용 가능합니다.")
									checkId = true;
								} 
							}
						},
				error : function(error){
					alert('error' + error.status);
				}
				
			})
		}
		
		function pwdCheck(){
			var reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d~!@#$%^&*()+|=]{8,20}$/	
						
			if(!reg_pwd.test($("#mber_pwd").val())){
				$('#pwdcheck').css('color','red')
				$('#pwdcheck').html("비밀번호는 최소 8자, 문자와 숫자를 1개씩 포함하세요.")		
				checkPwd = false;
			}else{
						$('#pwdcheck').css('color','blue')
						$('#pwdcheck').html("사용 가능합니다.")
						checkPwd = true;
				}
			}
		
		function emailCheck(){
			var reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if(!reg_email.test($("#mber_email").val())){
				$('#emailcheck').css('color','red')
				$('#emailcheck').html("올바른 이메일 양식이 아닙니다.")		
				checkEmail = false; 
			}else{
						$('#emailcheck').css('color','blue')
						$('#emailcheck').html("사용 가능합니다.")
				checkEmail = true;		
				}
			}
		function telCheck(){
			var reg_telno = /^\d{3}-\d{3,4}-\d{4}$/;
			
			
			if(!reg_telno.test($("#mber_telno").val())){
				$('#telcheck').css('color','red')
				$('#telcheck').html("하이픈 '-'을 제외하고 입력하세요.")		
				checkTelno = false;
			}else{
						$('#telcheck').css('color','blue')
						$('#telcheck').html("사용 가능합니다.")
				checkTelno = true;		
				}
			}
		
		function nameCheck(){
			var reg_name = /^[가-힣]+$/;
						
			if(!reg_name.test($("#mber_nm").val())){
				$('#namecheck').css('color','red')
				$('#namecheck').html("올바른 이름 양식이 아닙니다.")		
				checkNm = false;
			}else{
						$('#namecheck').css('color','blue')
						$('#namecheck').html("사용 가능합니다.")
				checkNm = true;		
				}
			}
		// 연락처 하이픈 자동 입력
		const autoHyphen = (target) => {
			target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/,`$1-$2-$3`);
		}
		//생년월일 오늘 이전 선택
		mber_bir.max = new Date().toISOString().split("T")[0];
		

				
	</script>

</body>

