<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

if(${result} > 0){
	alert("문진표가 정상적으로 등록되었습니다.");
	location.href = '<%=request.getContextPath()%>/guest/guest-main';
}else{
	alert("문진표가 정상적으로 등록되지 않았습니다./n 관리자에게 문의하세요.");
	history.go(-1);
}
	

</script>
