<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = (int) request.getAttribute("result");
	
	if(cnt>0){
%>
	{
		"flag" : "답글삭제완료"
	
	}


<%		
	}else{
%>

	{
		"flag" : "답글삭제완료"
	}

<%		
		
	}
%>