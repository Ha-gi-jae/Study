<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = (String) request.getAttribute("mem_id");
%>

{
	"mem_id" : "<%=mem_id %>"

}