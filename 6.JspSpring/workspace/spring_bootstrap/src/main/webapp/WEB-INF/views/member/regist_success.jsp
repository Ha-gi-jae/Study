<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
alert("회원등록에 성공했습니다. \n회원리스트 페이지로 이동합니다.");

window.opener.location.href="<%=request.getContextPath()%>/member/list.do"; // 이렇게 쓰는것을 추천한다. 왜? 이게 더 명확하니까^^.
// window.opener.list_go(1); // 부모의 function을 call 하겠다.
window.close();
</script>