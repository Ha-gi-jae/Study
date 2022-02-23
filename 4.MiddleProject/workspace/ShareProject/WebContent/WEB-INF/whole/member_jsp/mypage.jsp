<%@page import="kr.or.ddit.member.vo.ClassVO"%>
<%@page import="kr.or.ddit.member.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemVO mv = (MemVO) request.getAttribute("member");
	ClassVO cv = (ClassVO) request.getAttribute("class");
%>

{
	"mem_id" : "<%=mv.getMem_id() %>",	
	"mem_pass" : "<%=mv.getMem_pass() %>",	
	"mem_group" : "<%=mv.getMem_group() %>",	
	"class_start" : "<%=cv.getClass_start() %>",	
	"class_end" : "<%=cv.getClass_end() %>",	
	"mem_addr1" : "<%=mv.getMem_addr1() %>",	
	"mem_addr2" : "<%=mv.getMem_addr2() %>",	
	"mem_hp" : "<%=mv.getMem_hp() %>",	
	"mem_name" : "<%=mv.getMem_name() %>",	
	"mem_sub" : "<%=mv.getMem_sub() %>",
	"class_name" : "<%=cv.getClass_name() %>"	
}