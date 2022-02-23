<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberVO vo = (MemberVO) request.getAttribute("vo");
%>
{
	"classid" : "<%= vo.getClass_id() %>",
	"memgroup" : "<%= vo.getMem_group() %>",
	"memname" : "<%= vo.getMem_name() %>",
	"memaddr1" : "<%= vo.getMem_addr1() %>",
	"memaddr2" : "<%= vo.getMem_addr2() %>",
	"memhp" : "<%= vo.getMem_hp() %>",
	"memstart" : "<%= vo.getMem_start() %>",
	"memend" : "<%= vo.getMem_end() %>",
	"memsub" : "<%= vo.getMem_sub() %>",
	"memid" : "<%= vo.getMem_id() %>",
	"mempass" : "<%= vo.getMem_pass() %>"
}