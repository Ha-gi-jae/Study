<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 서블릿에서 데이터 가져오기.
	List<ZipVO> list = (List<ZipVO>) request.getAttribute("zipCodeList");
%>

[

<%
	for(int i = 0; i < list.size(); i++){
		ZipVO vo = list.get(i);
		
		String bunji = vo.getBunji();
		// 번지가 null이면 그냥 공백을 넣겠다.
		if(bunji == null) bunji ="";
		
		if(i > 0 ){
			out.println(",");
		}
%>
		{
			"zip" : "<%= vo.getZipcode() %>",
			"addr" : "<%= vo.getSido() %> <%= vo.getGugun() %> <%= vo.getDong() %>",
			"bunji" : "<%= bunji %>"
		}

<%
	}
%>

]

