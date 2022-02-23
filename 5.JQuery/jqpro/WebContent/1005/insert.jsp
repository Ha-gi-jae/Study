<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 서블릿에서 데이터 가져오기
	String id = (String) request.getAttribute("vo");
	if(id != null){
%>
		{
			"flag" : "가입성공"
		}



<%
	}else{
%>
		{
			"flag" : "가입실패"
		}

<%
	}
%>    
    
    