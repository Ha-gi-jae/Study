<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO result = (MemberVO) request.getAttribute("vo");

	if(result == null){
%>		
	{"flag" : "가능"}
	<%
	}else{
	%>
	{"flag" : "중복"}
<%
	}
%>