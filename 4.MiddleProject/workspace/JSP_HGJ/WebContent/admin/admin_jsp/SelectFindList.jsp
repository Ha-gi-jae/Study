<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<MemberVO> list = (List<MemberVO>) request.getAttribute("List");
	String field = (String) request.getAttribute("field");
	String enabled = "";
%>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="/ShareProject/js/jquery-3.6.0.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/ShareProject/js/jquery.serializejson.min.js"></script>

<script>
$(function(){
	$('#back').on('click', function(){
		location.href="/JSP_HGJ/admin/admin_html/SelectList.html"
	})
})
</script>
<form>
<select name="f">
<option value="name">이름</option>
<option value="id">아이디</option>
<option value="phone">전화번호</option>
<option value="email">이메일</option>
</select>
<input type="text" name = "q" id ="q">
<input type="button" id="findbutton" value="검색하기"><br>
</form>

<table border="1">
	<tr class="tr1">
		<th>
<input id="insertmember" type="button" value="회원 등록">
<input id="deletemember" type="button" value="회원 삭제">
		</th>
		<th>이름</th>
		<th>아이디</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>재직여부</th>
	</tr>
	<%
		for(int i = 0; i < list.size(); i++){
		MemberVO vo = list.get(i);
		enabled = "";
	%>
		<tr class="tr2">
		<td><input class="mem_chk" type="checkbox" name="mem_chk" value="<%=vo.getId() %>"></td>
		<td><%=vo.getName() %></td>
		<td><%=vo.getId() %></td>
		<td><%=vo.getPhone() %></td>
		<td><%=vo.getEmail() %></td>
		<%
			if(vo.getEnabled() == 0) enabled = "퇴사";
			else if(vo.getEnabled() == 1) enabled = "재직";
			else if(vo.getEnabled() == 2) enabled = "휴직";
		%>
		
		<td><%= enabled %></td>
			
	<%
	}
	%>
	
	<tr><td colspan="7"><input id="back" type="button" value="뒤로가기"></td></tr>
</table>
	