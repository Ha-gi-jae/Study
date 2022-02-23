<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 서블릿에서 수행결과 가져오기.
	String selectId = (String) request.getAttribute("id");
	if(selectId == null){ // 널이면 중복아니니까 사용가능
%>
			
				{
					"sw" : "사용가능한 id 입니다."
				}
			
<%
	}else{
%>	
				{
					"sw" : "사용 불가능한 id 입니다."
				}
<%
	}
%>