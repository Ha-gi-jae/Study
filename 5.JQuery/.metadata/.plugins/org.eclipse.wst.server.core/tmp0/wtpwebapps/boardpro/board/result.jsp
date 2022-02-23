<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 서블릿에서 저장된 값 가져오기
	int res = (Integer) request.getAttribute("result");
	
	if(res > 0){
%>
		{
			"flag" : "성공"
		}

<%
}else{
%>
		{
			"flag" : "실패"
		}


<%
}
%>