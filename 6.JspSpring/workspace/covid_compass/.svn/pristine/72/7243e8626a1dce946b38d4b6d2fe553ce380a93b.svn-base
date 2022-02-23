<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head></head>

<title></title>
<style>
.row {
	margin-bottom: 10px;
}
</style>
<body>
	<div class="card card-success">
		<div class="register-card-body pb-0">
			<div class="card-header"
				style="background-color: #1a4f72; color: white;">
				<h3 class="card-title">직원관리</h3>
			</div>
		</div>
		<div class="card-body">
			<div class="row" style="margin-bottom: 7px;">

				<label for="inputEmail3" class="col-md-2 control-label text-right "
					style="padding-top: 7px;">아이디</label>
				<div class="col-md-3">
					<input name="pstiNm" type="text" class="form-control"
						id="inputEmail3" value="TEST">
				</div>

				<label for="inputEmail3" class="col-md-2 control-label text-right "
					style="padding-top: 7px;">패스워드</label>
				<div class="col-md-4">
					<input name="pstiNm" type="password" class="form-control"
						id="myInput" value="abcdefg" onclick="showPassword()"
						onblur="showPassword()">
				</div>
			</div>

			<div class="row" style="margin-bottom: 7px;">
				<label for="inputEmail3" class="col-md-2 control-label text-right "
					style="padding-top: 7px;">성명</label>
				<div class="col-md-3">
					<input name="pstiNm" type="text" class="form-control"
						id="inputEmail3" value="${pstiNm }홍길동">
				</div>
				<div class="col-md2"></div>
				<label for="inputEmail3" class="col-md-2 control-label text-right "
					style="padding-top: 7px;">생년월일</label>
				<div class="col-sm-4">
					<input name="pstiNm" type="date" class="form-control"
						id="inputEmail3" value="${pstiNm }홍길동">
				</div>
			</div>

			<div class="row" style="margin-bottom: 7px;">
				<label for="inputEmail3" class="col-md-2 control-label text-right "
					style="padding-top: 7px;">소속기관</label>
				<div class="col-sm-3">
					<input name="pstiNm" type="text" class="form-control"
						id="inputEmail3" value="대덕검사소" readonly>
				</div>
				<label for="inputEmail3" class="col-md-2 control-label text-right "
					style="padding-top: 7px;">소속번호</label>
				<div class="col-sm-4">
					<input name="pstiNm" type="text" class="form-control"
						id="inputEmail3" value="A123456" readonly>
				</div>
			</div>
			<div class="row" style="margin-bottom: 7px;">
				<div class="col-md-7"></div>
				<div class="col-md-2">
					<button style="background-color: #1a4f72; border-color: #1a4f72;"
						type="button" class="btn btn-block btn-primary btn-sm" onclick="resetPassword()">패스워드
						초기화</button>
				</div>
				<div class="col-md-1">
					<button style="background-color: #1a4f72; border-color: #1a4f72;"
						type="button" class="btn btn-block btn-primary btn-sm">수정</button>
				</div>
				<div class="col-md-1">
					<button
						style="background-color: #1a4f72; border-color: #1a4f72; margin-right: 20%;"
						type="button" class="btn btn-block btn-primary btn-sm" onclick="window.close()">취소</button>
				</div>
			</div>
		</div>
	</div>
	<script>
function showPassword() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
<script>
function resetPassword(){
 var pwdInput = document.getElementById("myInput");
 var originPwd = pwdInput.value;
 pwdInput.value = "0000";
}
</script>
</body>

