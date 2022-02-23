<%@page import="kr.or.ddit.member.vo.PagingVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<MemberVO> list = (List<MemberVO>) request.getAttribute("List");
	PagingVO pv = (PagingVO) request.getAttribute("pv");
	String enabled = "";
%>
<style>
form{
	display: inline-block;
}
</style>
<h1>회원 관리 </h1>
<hr>
<form>
<select name= "f">
<option value="name">이름</option>
<option value="id">아이디</option>
<option value="phone">전화번호</option>
<option value="email">이메일</option>
</select>
<input type="text" name = "q" id ="q">
<input type="button" id="findbutton" value="검색하기"><br>
</form>

<input id="insertmember" type="button" value="회원 등록">
<input id="deletemember" type="button" value="회원 삭제">

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
		enabled = "";
	%>
		<tr class="tr2">
		<td><input class="mem_chk" type="checkbox" name="mem_chk" value="<%=vo.getId() %>"></td>
		<td class="detail"><%=vo.getName() %></td>
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
	<%if(pv.getTotalCount() > 0){ %>
			<tr>
				<td colspan="6" align="center">
				<%if(pv.getFirstPageNo() > pv.getPageSize()){ %>
				<a class="pre" name="<%=pv.getFirstPageNo() - pv.getPageSize() %>">[이전]</a>
				
				<%} %>
				<%for(int pNo = pv.getFirstPageNo(); pNo <= pv.getLastPageNo(); pNo++){ %>
				<a class="page<%if(pNo==pv.getCurrentPageNo()){%>select<%} %>"><%=pNo%></a>
				<%} %>
				
				<%if(pv.getLastPageNo() < pv.getTotalPageCount()){ %>
				<a class="next" name="<%=pv.getFirstPageNo() + pv.getPageSize() %>">[다음]</a>
				<%} %>
				</td>
			</tr>
			
		<%} %>
	
</table>
