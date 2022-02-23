<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		table{
			border : 1px solid pink;
			margin : 50px;
			
		}
		
		td{
			width : 200px;
			height: 50px;
			text-align: center;
		}
	
	</style>

</head>
<body>
	<h1>JSP : Java Server Page </h1>
	server내에서 실행되는 자바 프로그램을 포함한 스크립트 언어
	클라이언트 요청시 데이터를 받는다 : request.getParameter("name")<br>
	<%
		String inputmail = request.getParameter("email");
		String inputurl = request.getParameter("url");
		String incolor = request.getParameter("color");
		String indate = request.getParameter("date");
		String intel = request.getParameter("tel");
		
		
		String inpass = request.getParameter("pass");
		String infile = request.getParameter("file");
		
		int num = Integer.parseInt(request.getParameter("number"));
		
		

	%>
	<table border="1">
		<tr>
			<td>항목</td>
			<td>값</td>
		</tr>
		
		<tr>
			<td>이메일</td>
			<td><%= inputmail %></td>
		</tr>
		
		<tr>
			<td>URL</td>
			<td><%= inputurl %></td>
		</tr>
		
		<tr>
			<td>COLOR</td>
			<td><%= incolor %></td>
		</tr>
		
		<tr>
			<td>날짜</td>
			<td><%= indate %></td>
		</tr>
		
		<tr>
			<td>전화번호</td>
			<td><%= intel %></td>
		</tr>
		
		<tr>
			<td>NUMBER</td>
			<td><%= num %></td>
		</tr>
		
		<tr>
			<td>PASS</td>
			<td><%= inpass %></td>
		</tr>
		
		<tr>
			<td>파일</td>
			<td><%= infile %></td>
		</tr>
		
	</table>
	
	
</body>
</html>