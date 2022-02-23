<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 서블릿 실행 후 결과 값 가져오기
	List<BuyerVO> list = (List<BuyerVO>) request.getAttribute("list"); // 캐스팅 ^_^!!
	
%>

[
 <%
 	// 자바문장에서 출력안 <% out.println().  자바문장 밖에서 출력은 <%=
 	for(int i = 0; i < list.size(); i++){
 		BuyerVO vo = list.get(i);
 		if(i > 0) out.print(",");
 		
 %>
		{	
			"id" : "<%= vo.getBuyer_id() %>",
			"name" : "<%= vo.getBuyer_name() %>"
		}
<%
 	}
%>

]