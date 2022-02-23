<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>

</style>
</head>

<title>비밀번호 변경</title>

<body>
<div class="card card-info">
  <div class="card-header" style="background: #1a4f72">
    <h3 class="card-title" >비밀번호 변경</h3>
  </div>
  <!-- /.card-header -->
  <!-- form start -->
  <form class="form-horizontal" method="post" role="form" action="<%=request.getContextPath()%>/common/changepass" style="margin-top:15px;">
    <div class="card-body pb-0 pt-0">
      <div class="form-group row ">
        <label for="mberPwd" class="col-sm-3 col-form-label">새로운 비밀번호 입력</label>
        <div class="col-sm-9">
          <input type="password" class="form-control" name="mberPwd" id="password1" placeholder="New password">
        </div>
      </div>
      <div class="form-group row">
        <div class="col-sm-9" style="display: none;" id="regex">
	      <span style="color: red;">*비밀번호는 8~13자리이여야하며,<br/>하나 이상의 영어,숫자,특수문자가 사용되어야합니다.</span>
	    </div>
	  </div>
      <div class="form-group row">
        <label for="password2" class="col-sm-3 col-form-label pt-0">새로운 비밀번호 확인</label>
        <div class="col-sm-9">
          <input type="password" class="form-control" id="password2" placeholder="New password">
        </div>
      </div>
      <div class="form-group row">
      	<div class="col-sm-9" style="display: none;" id="passwordEqual">
	      <span style="color: red;">*비밀번호가 일치하지 않습니다.</span>
	    </div>
      </div>
    </div>
    <!-- /.card-body -->
    <div class="card-footer">
	  <button type="button" id="submitbutton" class="btn btn-info" style="background-color: #1a4f72; border-color: #1a4f72;">비밀번호 변경</button>
      <button type="button" id="close" class="btn btn-default float-right" style="background-color: #1a4f72; border-color: #1a4f72; color:white;">닫기</button>
    </div>
    <!-- /.card-footer -->
			<input type="hidden" id="mberNo" name="mberNo" value="${mberNo }">
			<input type="hidden" id="mberNo" name="SessionMberNo" value="${loginUser.mberNo }">
  </form>
</div>

<script>
window.onload = function(){
	$('#close').on('click', function(){
		window.close();
	});
	
$('#password1').on('change', function(){
	
	var regex = new RegExp("^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,13}$");
	
	var password = document.getElementById('password1').value;
	
	if(regex.test(password)){
		$('#regex').css('display', 'none');
	}else{
		$('#regex').css('display', 'block');
	}
});
		
$('#password2').on('change', function(){
	var pass1 = document.getElementById('password1').value;
	
	var pass2 = document.getElementById('password2').value;
	if(pass1 != pass2){
		$('#passwordEqual').css('display', 'block');
	}else{
		$('#passwordEqual').css('display', 'none');
	}
})

$('#submitbutton').on('click', function(){
	var regex = new RegExp("^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,13}$");

	var password = document.getElementById('password1').value;
	var pass2 = document.getElementById('password2').value;
	
	if(regex.test(password)){
		if(password == pass2){
			var form = $('form[role="form"]');
			form.submit();
		}
	}
})
}


</script>
</body>