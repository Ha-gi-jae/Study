<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head></head>

<title>아이디 찾기</title>

<body>
<div class="card card-info">
    <div class="card-header" style="background: #1a4f72">
      <h3 class="card-title" >아이디 찾기</h3>
    </div>
    <!-- /.card-header -->
    <!-- form start -->
    <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/common/findId">
      <div class="card-body pb-0 pt-0">
        <div class="form-group row ">
          <label for="mberNm" class="col-sm-3 col-form-label">성명</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" id="mberNm" name="mberNm" placeholder="Enter name">
          </div>
        </div>
        <div class="form-group row">
          <label for="mberTelno" class="col-sm-3 col-form-label pt-0">연락처</label>
          <div class="col-sm-9">
            <input type="text" class="form-control" id="mberTelno" name="mberTelno" maxlength="13" oninput="autoHyphen(this)" placeholder="010-0000-0000">
          </div>
        </div>
      </div>
      <!-- /.card-body -->
      <div class="card-footer">
		<button type="submit" class="btn btn-info" style="background-color: #1a4f72; border-color: #1a4f72;">확인</button>
		<button type="button" id="close" class="btn btn-default float-right" style="background-color: #1a4f72; border-color: #1a4f72; color: white;">닫기</button>
      </div>
      <!-- /.card-footer -->
    </form>
 </div>
<script>
window.onload = function(){	

	// 창 닫기
	$('#close').on('click', function(){
		window.close();
	})
} // window.onload 
// 연락처 하이픈
const autoHyphen = (target) => {
	target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/,`$1-$2-$3`);
}
</script>
</body>