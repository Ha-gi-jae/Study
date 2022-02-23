<!-- css 적용 X -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int adminboard_id = Integer.parseInt(request.getParameter("board_id"));
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/ShareProject/js/jquery.serializejson.min.js"></script>
<title>Insert title here</title>
<script>
$(function(){
	
	$.ajax({
		url : '/ShareProject/NotiSelectBoard.do',
		type : 'get',
		data : {"adminboard_id" : <%=adminboard_id%>},
		dataType : 'html',
		success : function(res){
			$('#view2').html(res);
		},
		error : function(xhr){
			alert("에러코드: "+xhr.status +"에러명: "+xhr.statusText);
		}
		
	})
	
	$(document).on('click', '#back', function() {
		location.href="./NoticBoard.html";
	})
	
})
</script>

</head>
<body>
	<div id="view2"></div>
		
</body>
</html>