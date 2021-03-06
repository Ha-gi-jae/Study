<%@page import="kr.or.ddit.comp.vo.CompPagingVO"%>
<%@page import="kr.or.ddit.comp.vo.CompVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CompVO> list = (List<CompVO>)request.getAttribute("boardList");
	CompPagingVO pv = (CompPagingVO)request.getAttribute("pv");
	
	String mem_id = (String)request.getAttribute("mem_id");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#box {
	display: flex;
	justify-content: center;
}

table {
	margin : 50px 50px 50px 50px;
	border-collapse: collapse;
	text-align: center;
	width : 700px;
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
	left : 680px;
}
</style>
</head>
<body>
	<h2 id="boardH2">회사정보</h2>
	<hr id="boardHr" color="orange">
	
	<form id="searchBar">
	<select name = "f">
	<option value="title">회사이름</option>
	</select>
	<input type="text" name= "q" id ="q">
	<input type="button" id="findbutton" value="검색하기"><br>
	</form> 
	
	<div id="box">
	<table border="1">
		
		<tr class="tr1">
			<th class="thTitle">번호</th>
			<th class="thTitle">회사이름</th>
		</tr>
	
		
		
		<%
			int boardSize = list.size();
			if (boardSize > 0) {
				for (int i = 0; i < boardSize; i++) {
					CompVO cv = list.get(i);
		%>
		<tr class="tr2">
			<td class="num"><%=cv.getComp_num()%></td>
			<td class="name" id="<%=cv.getAdminboard_id() %>"><%=cv.getComp_name() %></td>
		<%-- 	<td class="info"><%=cv.getComp_info() %></td>
			<td class="req"><%=cv.getComp_req() %></td>
			<td class="view"><%=cv.getAdminboard_view() %></td> --%>
		</tr>
		<%
			}
		%>	
		<!-- 페이징 처리 시작 -->
		
		<%if(pv.getTotalCount() > 0) {%>
			<tr>
				<td colspan="5" align="center">
					<!-- 첫번째페이지 번호가 페이지 수보다 큰 경우(이젠페이지 존재함.) -->
					<%if(pv.getFirstPageNo() > pv.getPageSize()) { %>
					<a class="pre" name="<%=pv.getFirstPageNo() - pv.getPageSize() %>">[이전]</a>

					<%} %>
					<%for(int pNo = pv.getFirstPageNo(); pNo <= pv.getLastPageNo(); pNo++) { %>
						<a class='page<%if(pNo == pv.getCurrentPageNo()){ %> select<%} %>'><%=pNo %></a>
					<%} %>

					<!-- 마지막페이지번호가 전체페이지 수보다 작은 경우(다음페이지 존재함.) -->
					<%if(pv.getLastPageNo() < pv.getTotalPageCount()) { %>
					<a  class="next" name="<%=pv.getFirstPageNo() + pv.getPageSize() %>">[다음]</a>
					<%} %>
				</td>
			</tr>
		<%} %>
		<!-- 페이징 처리 끝 -->
		
		<!-- 검색 -->
		
		<%
		} else {
		%>
		
		<tr>
			<td colspan="6">등록된 회사 정보가 없습니다.</td>
		</tr>
		
		<%
			}
		%>

		<tr align="right">
		<%
		if(mem_id.equals("admin")){
		%>
			<td colspan="5"><a id="newPost" href="./InsertComp.jsp">[등록]</a></td> 
		<% 
		}
		%>
		</tr>
		
		<tr>
		<!-- 메인페이지로 되돌아가기 -->
		<td colspan="6"><a href="http://localhost/ShareProject/MainPage.do">[뒤로가기]</td>
		</tr>
		
		</table>
		</div>
		<input type='hidden' id='findname' value='<%=pv.getComp_name()%>'>
		
			
</body>
</html>