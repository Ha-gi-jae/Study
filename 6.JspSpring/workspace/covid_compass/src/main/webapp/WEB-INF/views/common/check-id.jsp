<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head></head>

<title></title>

<body>
	<div class="card card-info">
           <div class="card-header" style="background: #1a4f72">
             <h3 class="card-title" >아이디 확인</h3>
           </div>
           <!-- /.card-header -->
           <!-- form start -->
           <form class="form-horizontal" name="testResultCheck" >
             <div class="card-body pb-0 pt-0">
               <div class="form-group row ">
			   		<i class="fas fa-user-circle fa-2x" style="margin-top: 5px;"></i>
			   		<p style="margin-top: 10px; margin-left: 5px;">입력한 정보와 일치하는 계정을 확인해 주세요.</p>
               </div>
			   		<hr>
               <div class="form-group row ">
			   		<span style="margin-top: 5px; float: left; margin-left: 20px;"><h2>${mberId }</h2></span>
			   </div>
			   		<hr>
			   	<div class="form-group row ">
      				<button type="button" id="findId" class="btn btn-info" style="background-color: #1a4f72; border-color: #1a4f72; margin-left: 20px;">비밀번호 찾기</button>
      				<button type="button" id="close" class="btn btn-default" style="float: right; background-color: #1a4f72; border-color: #1a4f72; color:white; margin-left: 20px;">닫기</button>
	      		</div>
             <!-- /.card-footer -->
             </div>
             <!-- /.card-body -->
           </form>
         </div>
<script>
window.onload = function(){	

	// 창 닫기
	$('#close').on('click', function(){
		window.close();
	})
	
	// 비밀번호찾기
	$('#findId').on('click', function(){
		OpenWindow('<%=request.getContextPath()%>/common/find_PwdForm','비밀번호 찾기','400','523');
		window.close();
	})
} // window.onload
</script>
</body>