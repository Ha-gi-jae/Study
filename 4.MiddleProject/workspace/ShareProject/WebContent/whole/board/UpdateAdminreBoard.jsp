<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int id_chk = (int) request.getAttribute("id_chk");
	
	if(id_chk>0){
%>
	{
		"flag" : "일치"
	
	}
	
	
<%
	}else{
%>
	{
		"flag" : "불일치"
	}


<%
	}
%>