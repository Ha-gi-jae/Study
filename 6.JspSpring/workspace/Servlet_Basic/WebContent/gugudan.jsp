<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	for(int i = 2; i <= 9; i++ ){	%>
	
	<h3><%=i%>단</h3>
	
	<%
	for(int j = 1; j <= 9; j++){			
	%>
	
	<span><%=i%> * <%=j%> = <%=i*j%></span><br/>

	<%
	}
	%>
	
	<br/>
<%
   }
%>
</body>
</html>