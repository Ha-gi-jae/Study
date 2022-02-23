<%@page import="kr.or.ddit.board.vo.NoticeVO"%>
<%@page import="kr.or.ddit.board.vo.PagingVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	List<NoticeVO> boardList = (List<NoticeVO>) request.getAttribute("boardList");
	PagingVO pv = (PagingVO) request.getAttribute("pv");
	String mem_id = (String)request.getAttribute("mem_id");
	
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
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
	font-weight: bold;
}
#boardHr {
	border : 2px solid orange;
}
.thTitle {
	text-align: center;
}
.tdNum {
	width : 70px;
}
.tdTitle {
	width : 500px;
	text-align: left;
	padding-left : 10px;
}
.tdDate {
	width : 110px;
}
.tdView {
	width : 70px;
}
#searchBar {
	position : relative;
	left :69%;
}
</style>

<h2 id="boardH2">공지사항</h2>
<hr id="boardHr">

<form id="searchBar">
	<select name = "f">
	<option value="title">제목</option>
	<option value="content">내용</option>
	</select>
	<input type="text" name= "q" id ="q">
	<input type="button" id="findbutton" value="검색하기"><br>
</form> 

<table border="1">
		<tr class="tr1">
			<th class="thTitle">번호</th>
			<th class="thTitle">제목</th>
			<th class="thTitle">날짜</th>
			<th class="thTitle">조회수</th>
		</tr>
		<%
			int boardSize = boardList.size();
			if (boardSize > 0) {
				for (int i = 0; i < boardSize; i++) {
					NoticeVO nv = boardList.get(i);
		%>
		<tr>
			<td class="tdNum"><%=nv.getNotice_num() %></td>
			<td class="title tdTitle" id="<%=nv.getAdminboard_id() %>"><%=nv.getNotice_title() %></td>
			<td class="tdDate"><%=nv.getNotice_date() %></td>
			<td class="tdView"><%=nv.getAdminboard_view() %></td>
		</tr>
		<%
			}
		%>
		<!-- 페이징 처리 시작 -->
		
		<%if(pv.getTotalCount() > 0) {%>
			<tr>
				<td colspan="6" align="center">
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
		
		<%
				
		} else {
		%>
		<tr>
			<td colspan="6">회원정보가 없습니다.</td>
		</tr>
		<%
			}
		%>

		<tr align="right">
		<%
		// 공지사항 게시판이면서 아이디가 관리자인 경우 
		if(mem_id.equals("admin")){
		%>
			<td colspan="6"><a id="newPost" href="./NotiInsertBoard.html" >[등록]</a></td> 
		<%
		}
		%>
		</tr>
		
		<tr>
		<!-- 메인페이지로 되돌아가기 -->
		<td colspan="6"><a href="http://localhost/ShareProject/MainPage.do">[뒤로가기]</td>
		</tr>
		
		
	</table>
	<input type='hidden' id='findtitle' value='<%=pv.getNotice_title()%>'>
	<input type='hidden' id='findcontent' value='<%=pv.getNotice_content()%>'>