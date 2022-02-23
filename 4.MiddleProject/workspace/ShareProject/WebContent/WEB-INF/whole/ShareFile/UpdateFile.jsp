<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileName = (String) request.getAttribute("fileName");
	int chk = (int) request.getAttribute("chk");
	if(chk > 0){
%>
		{
			"flag": "ok",
			"fileName": "<%=fileName %>"
			
		}
<%
	} else {
%>
		{
			"flag": "no"
		}
<%
	}
%>