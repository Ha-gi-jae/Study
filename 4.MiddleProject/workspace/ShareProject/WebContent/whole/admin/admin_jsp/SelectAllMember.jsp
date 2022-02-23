<%@page import="kr.or.ddit.adminClass.vo.AdminClassVO"%>
<%@page import="kr.or.ddit.board.vo.PagingVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
        	List<MemberVO> memberlist = (List<MemberVO>) request.getAttribute("memberList");
        	PagingVO pv = (PagingVO) request.getAttribute("pv");
        %>
<style>

table {
	margin : 30px 50px 50px 50px;
	border-collapse: collapse;
	text-align: center;
	width : 1000px;
	font-size: 18px;
}
#newPost {
	color : orange;
	font-weight: bold;
	text-decoration: none;
}
#boardH2 {
	margin-top : 25px;
	margin-left: 45px;
	margin-bottom: 10px;
}
.thTitle {
	text-align: center;
}
.tdNum {
	width : 70px;
}
.tdTitle {
	width : 300px;
	text-align: center;
	padding-left : 10px;
}
.tdName {
	width : 100px;
}
.tdDate {
	width : 150px;
}
.tdView {
	width : 100px;
}
.tdCount {
	width : 100px;
}
#boardHr {
	border : 2px solid orange;
}
#searchBar {
	margin-top: 10px;
	position : relative;
	left : 60%;
}
</style>
<h2 id="boardH2">회원 관리</h2>
<hr id="boardHr">
<form id="searchBar">
<select name = "f">
<option value="class">반</option>
<option value="group">구분</option>
<option value="name">이름</option>
</select>
<input type="text" name= "q" id ="q">
<input type="button" id="findbutton" value="검색하기"><br>
</form>
<table border="1">
	<tr class="tr1">
		<th class="thTitle">
<input id="insertmember" type="button" value="회원 등록">
<input id="deletemember" type="button" value="회원 삭제">
		</th>
		<th class="thTitle">반</th>
		<th class="thTitle">구분</th>
		<th class="thTitle">이름</th>
		<th class="thTitle">연락처</th>
	</tr>
	<%
		for(int i = 0; i < memberlist.size(); i++){
			MemberVO vo = memberlist.get(i);
	%>
	<tr class="tr2">
		<td class="tdView"><input class="mem_chk" type="checkbox" name="mem_chk" value="<%=vo.getMem_id()%>"></td>
		<td class="tdView"><%= vo.getClass_id() %></td>
		<td class="tdDate"><%= vo.getMem_group() %></td>
		<td class="memname tdName"><%= vo.getMem_name() %></td>
		<td class="title tdTitle"><%= vo.getMem_hp() %></td>
	</tr>		
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
				
				<%if(pv.getLastPageNo() < pv.getTotalCount()){ %>
				<a class="next" name="<%=pv.getFirstPageNo() + pv.getPageSize() %>">[다음]</a>
				<%} %>
				</td>
			</tr>
			
		<%} %>
		<tr>
		<td colspan="5">
	<input onclick="history.go(-1);" type="button" value="뒤로가기">
		</td>
	</tr>
</table>