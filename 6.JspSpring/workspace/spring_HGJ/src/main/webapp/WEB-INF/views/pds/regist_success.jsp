<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	alert("자료등록이 성공했습니다.");
	window.close();
	window.opener.parent.location.href="<%=request.getContextPath()%>/index.do?mCode=M040100";
	
// 자료실 목록으로 window.opener = i frame  parent - 창
</script>