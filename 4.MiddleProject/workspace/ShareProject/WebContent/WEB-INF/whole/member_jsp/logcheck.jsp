<%@page import="kr.or.ddit.member.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
MemVO mv = (MemVO) request.getAttribute("check");
int chk =(int)request.getAttribute("count");
if(chk >= 5) {
%>

	<script>
	alert("로그인 5회실패(계정잠김)");
	document.location.href='./Real_Final_Pages/Final_LoginPage.html';
    </script>
<%
}
if(mv != null){
%>	
	
	
	<script>
		document.location.href='/ShareProject/MainPage.do';
	</script>
	
	
<% 
   }else{
     
%>	   

	<script>
		alert("로그인을 <%=chk %>회 실패하셨습니다.<br>5회시 계정 장금");
		document.location.href='./Real_Final_Pages/Final_LoginPage.html';
	</script>
	
	
	
	   
	   
	   
	   
<%	   
   }
%>