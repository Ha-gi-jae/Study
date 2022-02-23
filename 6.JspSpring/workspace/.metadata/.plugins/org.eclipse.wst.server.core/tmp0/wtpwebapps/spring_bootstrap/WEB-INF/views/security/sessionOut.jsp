<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<% response.setStatus(302); %>
<!-- 302안주면 200 나감. 그리고 해당 jsp가 들어감. 이미지가아니라. -->

<script>
	alert('${message}');
	if(window.opener){
		window.opener.parent.location.reload();
	}else{
		window.location.href="<%=request.getContextPath()%>";
	}
	window.close();
</script>