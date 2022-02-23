<%@page import="kr.or.ddit.board.vo.PagingVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
    	List<MemberVO> memberlist = (List<MemberVO>) request.getAttribute("memberList");
    	PagingVO pv = (PagingVO) request.getAttribute("pv");
    	String field = (String) request.getAttribute("field");
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
	text-align: left;
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

<input id="insertmember" type="button" value="회원 등록">
<input id="deletemember" type="button" value="회원 삭제">
<table border="1">
	<tr class="tr1">
		<td></td>
		<td>반</td>
		<td>구분</td>
		<td>이름</td>
		<td>연락처</td>
	</tr>
	<%
		for(int i = 0; i < memberlist.size(); i++){
		MemberVO vo = memberlist.get(i);
	%>
	<tr class="tr2">
		<td><input class="mem_chk" type="checkbox" name="mem_chk" value="<%=vo.getMem_id()%>"></td>
		<td><%= vo.getClass_id() %></td>
		<td><%= vo.getMem_group() %></td>
		<td class="memname"><%= vo.getMem_name() %></td>
		<td><%= vo.getMem_hp() %></td>
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
			<td colspan="6" align="center">
				<input onclick="history.go(-1);" type="button" value="목록으로">
			</td>
		</tr>
</table>
<%if (field.equals("class")){
	%>
	<input type="hidden" id="findclass" value=<%= pv.getClass_id()%>>
	<%

}
%>
<%
if(field.equals("group")){
	%>
	<input type="hidden" id="findgroup" value=<%= pv.getMem_group() %>>
	
	<%
}
%>
<%
if(field.equals("name")){
	
%>
	<input type="hidden" id="findname" value=<%= pv.getMem_name() %>>
<%
}
%>