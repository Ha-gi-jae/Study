<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
table{
	border: 2px solid blue;
	border-collapse: collapse;
}

td{
	width: 200px;
	height: 40px;
	text-align: center;
}

</style>
</head>
<body>
<h1>JSP: Java Server Page</h1>
<%

	String userId = request.getParameter("id");
    String userName = request.getParameter("name");
    String userTel = request.getParameter("tel");
    String userAddr = request.getParameter("addr");

%>

<table border="1">
	<tr>
	  <td>아이디</td>
	  <td><%= userId %></td>
	</tr>
	
	<tr>
	  <td>이름</td>
	  <td><%= userName %></td>
	</tr>
	
	<tr>
	  <td>전화번호</td>
	  <td><%= userTel %></td>
	</tr>
	
	<tr>
	  <td>주소</td>
	  <td><%= userAddr %></td>
	</tr>  
</table>

</body>
</html>