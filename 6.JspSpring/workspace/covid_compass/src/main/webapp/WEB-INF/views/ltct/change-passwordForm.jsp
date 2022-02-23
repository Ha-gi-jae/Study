<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
<style>

</style>
</head>

<title></title>

<body>
	<div class="card">
	  <!-- /.card-header -->
	  <!-- form start -->
	  <form>
	      <div class="row" style="margin-top: 15px;">
	        <label for="password1" class="col-md-2 text-right" style="padding-top: 7px;">새로운 비밀번호 입력</label>
	        <div class="col-md-7">
	          <input type="text" style="margin-bottom: 5px;" class="form-control" name="password" id="password1" placeholder="New password">
	        </div>
	      </div>
	      
		  <div class="row">
		  	<div class="col-md-2"></div>
	        <div class="col-md-9" style="margin-bottom: 5px;">
	          <span>*비밀번호는 8~13자리이여야하며, 하나 이상의 영어,숫자,특수문자가 사용되어야합니다.</span>
	        </div>
	      </div>
	      <div class="row">
	        <label for="password1" class="col-md-2 text-right" style="padding-top: 7px;">새로운 비밀번호 확인</label>
	        <div class="col-md-7">
	          <input type="text" style="margin-bottom: 5px;" class="form-control" name="password" id="password1" placeholder="New password">
	        </div>
	      </div>
	      
		  <div class="row">
		  	<div class="col-md-2"></div>
	        <div class="col-md-9" style="margin-bottom: 5px;">
	          <span class="">*비밀번호가 일치하지 않습니다.</span>
	        </div>
	      </div>
	      
	    <!-- /.card-body -->
		<div class="row" style="width: 400px;">
	      		<button type="submit" class="btn btn-primary col-md-4"style=" margin-left:650px; margin-bottom:15px; background-color: #5bbc71; border-color: #5bbc71">비밀번호 변경</button>
		</div>
	  </form>
	</div>
<script>

</script>
</body>