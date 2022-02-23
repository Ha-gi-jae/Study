<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<title>covid-19 compass</title>

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>

<!-- favicon 적용 -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/image/logo-16x16.png" type="image/x-icon">
<link rel="icon" href="<%=request.getContextPath()%>/resources/image/logo-16x16.png" type="image/x-icon">


</head>
<body>

<section class="login-form">
	<h1>COVID-19 COMPASS</h1>
	
		<form action="<%=request.getContextPath()%>/common/login.do" method="post" id="loginForm">
			<div class="int-area">
				<input type="text" name="mberId" id="id" autocomplete="off" required>
				<label id="idlabel" for="id">ID</label>
			</div>
			<div class="int-area">
				<input type="password" name="mberPwd" id="pw" autocomplete="off" required>
				<label id="pwlabel" class="" for="pw">PASSWORD</label>
			</div>
			<div class="btn-area">
				<button id="btn" type="submit">LOGIN</button>
			</div>
		</form>
		<div class="caption">
			<a href="#" onclick="OpenWindow('<%=request.getContextPath()%>/common/find_IdForm','아이디 찾기','400','247');"><span style="color:#fff; font-weight: bold;">아이디 찾기</span></a>
			<span style="color:#fff;">/</span>
			<a href="#" onclick="OpenWindow('<%=request.getContextPath()%>/common/find_PwdForm','비밀번호 찾기','400','523');"><span style="color:#fff; font-weight: bold;">비밀번호 찾기</span></a>
		</div>
		
	<div style="display: flex; padding-top: 20px;">
      <div style="width: 16%">
        <button type="button" style="background-color: #007bff; border-color: #007bff; color: white; font-size: 10px;" class="btn btn-block btn-primary btn-sm" onclick="goPage('A');">검사소</button>
      </div>
      <div style="width: 16%">
        <button type="button" style="background-color: #007bff; border-color: #007bff; color: white; font-size: 10px;" class="btn btn-block btn-primary btn-sm" onclick="goPage('B');">보건소</button>
      </div>
      <div style="width: 16%">
        <button type="button" style="background-color: #007bff; border-color: #007bff; color: white; font-size: 10px;" class="btn btn-block btn-primary btn-sm" onclick="goPage('C');">병원</button>
      </div>
      <div style="width: 16%">
        <button type="button" style="background-color: #007bff; border-color: #007bff; color: white; font-size: 10px; padding-left: 0.4rem; padding-right: 0.4rem;" class="btn btn-block btn-primary btn-sm" onclick="goPage('D');">치료센터</button>
      </div>
      <div style="width: 16%">
        <button type="button" style="background-color: #007bff; border-color: #007bff; color: white; font-size: 10px;" class="btn btn-block btn-primary btn-sm" onclick="goPage('E');">관리자</button>
      </div>
      <div style="width: 16%">
        <button type="button" style="background-color: #007bff; border-color: #007bff; color: white; font-size: 10px;" class="btn btn-block btn-primary btn-sm" onclick="goPage('F');">비회원</button>
      </div>
    </div>
		
</section>
<script>
window.onload = function(){
	$('#id').focus();
}
if('${message}'){
	alert('${message}');
}

let id = document.getElementById('id');
let pw = document.getElementById('pw');
let btn = document.getElementById('btn');
let idlabel = document.getElementById('idlabel');
let pwlabel = document.getElementById('pwlabel');
$(btn).on('click', function(){
	if(id.value == ""){
		idlabel.classList.add('warning');
		setTimeout(function(){
			idlabel.classList.toggle('warning', false);
		}, 1500);
	}
	else if(pw.value == ""){
		pwlabel.classList.add('warning');
		setTimeout(function(){
			pwlabel.classList.toggle('warning', false);
		}, 1500);
	}
})
		if('${message}'){
		alert('${message}');
	}
</script>
<script>
function goPage(type){
	
	if(type == 'A'){
		document.getElementById('id').value='inspe';
		document.getElementById('pw').value='inspe';
		document.getElementById('loginForm').submit();
	}
	if(type == 'B'){
		document.getElementById('id').value='pbhte';
		document.getElementById('pw').value='pbhte';
		document.getElementById('loginForm').submit();
	}
	if(type == 'C'){
		document.getElementById('id').value='hspte';
		document.getElementById('pw').value='hspte';
		document.getElementById('loginForm').submit();
	}
	if(type == 'D'){
		document.getElementById('id').value='ddltct';
		document.getElementById('pw').value='1111';
		document.getElementById('loginForm').submit();
	}
	if(type == 'E'){
		document.getElementById('id').value='admin';
		document.getElementById('pw').value='admin';
		document.getElementById('loginForm').submit();
	}
	if(type == 'F'){
		window.location.href = '<%=request.getContextPath()%>/guest/guest-main';
	}
	
}
</script>
</body>