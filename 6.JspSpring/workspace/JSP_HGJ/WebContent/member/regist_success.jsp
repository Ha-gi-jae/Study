<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	alert("회원등록에 성공했습니다. \n회원리스트 페이지로 이동합니다.");
	
	window.opener.location.href="<%=request.getContextPath()%>/member/list";
	window.close();
</script>