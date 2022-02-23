<%@page import="kr.or.ddit.cal.vo.CalVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CalVO> list = (List<CalVO>)request.getAttribute("list1");
%>
[	

<%
		for(int i = 0; i < list.size(); i++){
			CalVO vo = list.get(i);
			if(i > 0) out.print(",");
%>
			{
				"id" : "<%= vo.getItt_id() %>",
				"title" : "<%= vo.getItt_title() %>",
				"start" : "<%= vo.getItt_start() %>",
				"end" : "<%= vo.getItt_end() %>",
				"color" : "<%= vo.getItt_color() %>"
			}

<%
		}
%>	


]


