<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = (int) request.getAttribute("deleteMsg");
	
	if(cnt >0){
%>
	{
		"flag" : "삭제성공"
	
	}
			
		
		
<%		
	}else{
%>
	{
		"flag" : "삭제실패"
	
	
	}



<%		
	}
%>