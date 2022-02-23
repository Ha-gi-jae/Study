<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

	var choice = prompt("테스트용 로그인 회원선택\n(1:공통\n2.검사소\n3.보건소\n4.병원\n5.생활치료센터)");
	
	if(choice == "1"){
		location.href="indexPage?mcode=M010000";
	}
	if(choice == "2"){
		location.href="indexPage?mcode=M020000";
	}
	if(choice == "3"){
		location.href="indexPage?mcode=M030000";
	}
	if(choice == "4"){
		location.href="indexPage?mcode=M040000";
	}
	if(choice == "5"){
		location.href="indexPage?mcode=M050000";
	}
	
</script>