<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int adminboard_id = Integer.parseInt(request.getParameter("adminboard_id"));
%>

{
	"adminboard_id": "<%=adminboard_id %>"
}