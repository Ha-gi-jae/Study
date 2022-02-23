<%@page import="kr.or.ddit.admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	AdminVO av = (AdminVO) request.getAttribute("admin");
	
	if(av!=null){
%>
	
	<script>
	document.location.href='/ShareProject/MainPage.do';
	</script>
		
		
<%
	}else{
		
%>		
	
	<script>
	alert("로그인 실패");
	document.location.href='/ShareProject/Real_Final_Pages/Final_LoginPage.html';
	</script>
	
	
		
<%		
	}
%>