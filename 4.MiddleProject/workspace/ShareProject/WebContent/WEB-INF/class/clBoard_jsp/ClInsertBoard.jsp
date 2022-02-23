<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int adminboard_id = (int) request.getAttribute("adminboard_id");
	if(adminboard_id > 0){
%>
		{
		 "flag" : "성공",
		 "adminboard_id" : "<%=adminboard_id %>" 
		}
	
<%	
	} else {
%>
	    {
		 "flag" : "실패" 
		}
<%
	}
%>