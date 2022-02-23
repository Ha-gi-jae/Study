<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title></title>

<head></head>

<body>
<div class="wrapper">
			<div class="card-primary">
			  <div class="card-header" style="background-color: #5b6f90;">
			    <h3 class="card-title">내 정보</h3>
			  </div>
			  <!-- /.card-header -->
			  <!-- form start -->
			  <form>
			  
			  <div class="card-body">
			    
			    <div class="row" style="margin-bottom: 20px;">
			        <label for="mber_id" class="col-md-2 text-right" style="padding-top: 7px;">소속기관</label>
				      <div class="col-md-3">
				        <input type="text" class="form-control" id="mber_id" value="대덕검사소" readonly>
				      </div>
			      
			        <label for="mber_id" class="col-md-2 text-right" style="padding-top: 7px;">소속번호</label>
				      <div class="col-md-4">
				        <input type="text" class="form-control" id="mber_id" value="A12345" readonly>
				      </div>
			    </div>
			    
			    <div class="row" style="margin-bottom: 20px;">
			        <label for="mber_nm" class="col-md-2 text-right" style="padding-top: 7px;">성명</label>
				      <div class="col-md-3">
				        <input type="text" class="form-control" id="mber_id" value="홍길동" readonly>
				      </div>
			      
			        <label for="mber_birth" class="col-md-2 text-right" style="padding-top: 7px;">생년월일</label>
				      <div class="col-md-4">
				        <input type="date" class="form-control" id="mber_birth" value="2022-01-06" readonly>
				      </div>
			    </div>
			    
			    <div class="row" style="margin-bottom: 20px;">
			        <label for="mber_telno" class="col-md-2 text-right" style="padding-top: 7px;">연락처</label>
				      <div class="col-md-3">
				        <input type="text" class="form-control" id="mber_id" value="010-1234-5678" readonly>
				      </div>
			      
			        <label for="mber_email" class="col-md-2 text-right" style="padding-top: 7px;">이메일</label>
				      <div class="col-md-4">
				        <input type="text" class="form-control" id="mber_birth" value="ddit@ddit.or.kr" readonly>
				      </div>
			    </div>

				<div class="row" style="margin-bottom: 20px;">
			        <label for="mber_adres" class="col-md-2 text-right">주소</label>
			          <div class="col-md-9">
			            <input type="text" class="form-control" id="mber_adres" value="대전 중구 계룡로 846" readonly>
			          </div>
			   </div>
			   
			    <div class="row">
				    <div class="col-md-7"></div>
				    
				    <div class="col-md-2">
				   		<button type="button" class="btn btn-block btn-secondary" style="background-color: #5b6f90;" onclick="go_mypageModifyform();">내 정보 수정</button>
				    </div>
				    <div class="col-md-2">
				   		<button type="button" class="btn btn-block btn-secondary" style="background-color: #5b6f90;" onclick="changepwd();">비밀번호 변경</button>
				    </div>
			    </div>
			    
			 </div>
			    <!-- /.card-body -->
			    
			    
					<input type="hidden" value="아이디">
			  </form>
			</div>
</div>
<script>
function changepwd(){
	alert("안녕");
}

function go_mypageModifyform(){
	
	location.href = "<%=request.getContextPath()%>/insp/mypage-modifyform";
}
</script>

</body>