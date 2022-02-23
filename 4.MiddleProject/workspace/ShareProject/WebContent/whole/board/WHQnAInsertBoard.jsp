<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String group = request.getParameter("group");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/ShareProject/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#submit').on('click', function(e) {
			e.preventDefault();
		    
			var form = $('#fileForm')[0];
			
			var data = new FormData(form);
			
			$.ajax ({
				url:'/ShareProject/InsertAtBoard.do',
				type: "post",
	            data: data,
	            processData: false, //필수
	            contentType: false, // 필수
	            cache: false,
				success:function(result){
					console.log("SUCCESS : ", data);
					if(result.flag == "성공") 
						location.href="./SelectAtBoard.jsp?board_id=" + result.adminboard_id;
				},
				error:function(xhr){
					alert("에러코드 : " + xhr.status + "에러명 : " + xhr.statusText);
				}
			})	
		
		})
	})
</script>
</head>
<body>
<form id="fileForm" accept-charset="UTF-8" enctype="multipart/form-data" method="post">
		<input type="hidden" name="board_title_id" value="<%=group %>">
		<input type="text" name="board_title" placeholder="제목을 입력해 주세요"/><br>
		<textarea cols="50" rows="20" style="resize: none;" name="board_content" placeholder="내용을 입력해주세요"></textarea><br>
		<input id="bfile" type="file" name="atchFile" multiple>
		<input type="button" id="submit" value="등록">
	</form>
	
	<input type="button" id="cancel" value="취소">
	
	
<%-- <form action="InsertAtBoard.do" method="post" accept-charset="UTF-8" enctype="multipart/form-data">
		<input id="bid" type="hidden" name="board_title_id" value="<%=group %>">
		<input id="btitle" type="text" name="board_title" placeholder="제목을 입력해 주세요"/><br>
		<textarea id="bcont" cols="50" rows="20" style="resize: none;" name="board_content" placeholder="내용을 입력해주세요"></textarea>
		<input id="bfile" type="file" name="atchFile" multiple>

		<input type="submit" value="등록">
	</form>
	<input type="button" id="cancel" value="취소"> --%>
</body>
</html> 