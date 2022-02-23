<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	List<MemberVO> list = (List<MemberVO>) request.getAttribute("list");
%>
[
<%
	for(int i = 0; i < list.size(); i++){
		MemberVO vo = list.get(i);
		if(i > 0) out.print(",");
%>
	{
		"classname": "<%= vo.getClass_name() %>",
		"memgroup": "<%= vo.getMem_group() %>",
		"memname": "<%= vo.getMem_name() %>",
		"memhp": "<%= vo.getMem_hp() %>",
		"memid": "<%= vo.getMem_id() %>"
	}
<%
	}
%>
]