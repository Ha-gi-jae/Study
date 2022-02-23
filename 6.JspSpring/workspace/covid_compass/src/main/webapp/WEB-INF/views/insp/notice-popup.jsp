<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head></head>

<title></title>

<body class="hold-transition sidebar-mini">
			<div class="col-md-12">
					<div class="col-md-12" style="text-align: center; margin-top: 0px;">
						<div class="card-body">
							<div class="form-group">
								<h1 style="color: red; font-weight: bold;">${notice.title }</h1>
							</div>
							<div class="form-group">
								<div style="font-weight:bold; background-color:white; height: 320px;">
									<strong>${notice.content}</strong>
								</div>
							</div>
							<c:if test="${fileName ne null  }">
								<div class="form-group" style="border: none; text-align: left;">
			                  		<input type="hidden" name="attachNo" value="${attachNo}">
			                     	<label for="inputClientCompany">첨부된 파일</label><br>
			                     	<a href="getFile?fileName=${fileName}"><span style="font-weight: bold;">${originalFileName}</span></a> 
			                   </div>
						   </c:if>
						</div>
						<div class="close">
							<form method="post" action="" name="pop_form">
								<span id="check" onclick="selectCheck()" style="font-weight: bold;"><input type="checkbox" onclick="closeWin()" value="checkbox" name="chkbox" id="chkbox"/><label for="chkday">오늘 하루동안 보지 않기</label></span>
							</form>
						</div>
					</div>
			  </div>

	<script>
		window.onload = function() {
			// Summernote
			$('#summernote').summernote({
				height : 200
			})
		}
		
		
		function reset(){
			$('#inputName').val("");
			$('#inputWriter').val("");
			$('input[type="checkbox"]').attr('checked',false);
			$('#startDate').val("");
			$('#endDate').val("");
			$('#summernote').val("");
			$('input[type="file"]').val("");
			
		}
		
		function selectCheck(){
			if(document.getElementById('chkbox').checked==false){
				document.getElementById('chkbox').checked==true;
				window.close();
			}
			if(document.getElementById('chkbox').checked==true){
				document.getElementById('chkbox').checked==false;
				window.close();
			}
		}
		
	</script>

</body>


