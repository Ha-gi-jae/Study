<%@page import="kr.or.ddit.member.vo.PagingVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MemberVO> list = (List<MemberVO>) request.getAttribute("list");
%>
<h1>회원 관리</h1>
<hr>
<form>
<select name="title">
<option value="name">이름</option>
<option value="id">아이디</option>
<option value="phone">전화번호</option>
<option value="email">이메일</option>
</select>
<input type="text" name="query" id="query">
<input type="button" id="findbutton" value="검색하기"><br>
</form>
<input id="insertmember" type="button" value="회원등록">
<input id="deletemember" type="button" value="회원삭제">

<table border="1">
	<tr class="tr1">
	
		<th><input type="checkbox" name="allchk"></th>
		<th>이름</th>
		<th>아이디</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>재직여부</th>
	</tr>
	
	<%
			for(int i = 0; i < list.size(); i++){
				MemberVO vo = list.get(i);
				pageContext.setAttribute("member", vo);
		%>
		
		<tr class="tr2">
			<td><input class="mem_chk" type="checkbox" name="mem_chk" value="${member.id }"></td>
			<td class="detail"> ${member.name }</td>
			<td>${member.id }</td>
			<td>${member.phone }</td>
			<td>${member.email }</td>
			<td>${member.enabled }</td>
		</tr>
	<% } %>
</table>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/JSP_GJ/js/jquery.serializejson.min.js"></script>