<%@page import="kr.or.ddit.clboard.vo.PagingVO"%>
<%@page import="kr.or.ddit.clboard.vo.ClBoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<ClBoardVO> boardList = (List<ClBoardVO>) request.getAttribute("clBoardList");
	PagingVO pv = (PagingVO) request.getAttribute("pv");
	String mem_id = (String)request.getAttribute("mem_id");
	String board_title_id = (String) request.getAttribute("board_title_id");
	String board_title_name = (String) request.getAttribute("board_title_name");
	String mem_group = (String) request.getAttribute("mem_group");
	
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
%>

<style>
table {
	margin : 30px 50px 50px 50px;
	border-collapse: collapse;
	text-align: center;
	width : 1000px
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
	border : 2px solid navy;
}
#searchBar {
	margin-top: 10px;
	position : relative;
	left : 67%;
}
</style>

<h2 id="boardH2"><%=board_title_name %></h2>
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
			<th class="thTitle">작성자</th>
			<th class="thTitle">날짜</th>
			<th class="thTitle">조회수</th>
			<th class="thTitle">댓글수</th>
		</tr>
		<%
			int boardSize = boardList.size();
			if (boardSize > 0) {
				for (int i = 0; i < boardSize; i++) {
					ClBoardVO bv = boardList.get(i);
					if(bv.getAdminboard_blind().equals("N")||bv.getAdminboard_blind()==null){
		%>
		<tr class="tr2">
			<td class="tdNum"><%=bv.getBoard_num() %></td>
			<td class="title tdTitle" id="<%=bv.getAdminboard_id() %>"><%=bv.getclBoard_title() %></td>
			<td class="tdName"><%=bv.getMem_name() %></td>
			<td class="tdDate"><%=bv.getclBoard_date() %></td>
			<td class="tdView"><%=bv.getAdminboard_view() %></td>
			<td class="tdCount"><%=bv.getReply_count() %></td>
		</tr>
		<%
					}
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
		<%
		} 
		%>
		<!-- 페이징 처리 끝 -->
		
		<%
		} else {
		%>
		<tr>
			<td colspan="6">해당하는 게시글이 없습니다.</td>
		</tr>
		
		<%
			}
		%>

		<tr align="right">
		<%	
			if(board_title_id.equals("BR06")){
		%>
			<td colspan="6"><a id="newPost" href="./ClAtInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td>
		<%	
			}else if(board_title_id.equals("BR07")){
		%>
			<td colspan="6"><a id="newPost" href="./ClAtInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td>
		
		<%  //자유게시판(첨부파일 O)	
			}else if(board_title_id.equals("BR08")){
		%>
			<td colspan="6"><a id="newPost" href="./ClAtInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td>
		
		<%  // (반)공지사항 게시판이면서 아이디가 관리자인 경우 
			}else if(board_title_id.equals("BR03")  && mem_id.equals("admin")){
		%>
			<td colspan="6"><a id="newPost" href="./ClInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td>
		<%
			//과제게시판
			}else if(board_title_id.equals("BR14") && mem_group.equals("pro")){
		%>
				<td colspan="6"><a id="newPost" href="./ClAtInsertHomeworkBoard.jsp?group=<%=board_title_id %>">[등록]</a></td>
		<%	
			}else if(board_title_id.equals("BR03") && mem_group.equals("pro")){
		%>
			<td colspan="6"><a id="newPost" href="./ClInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td>
		<% 
			}
		%>
	</tr>
	<tr>
		<!-- 메인페이지로 되돌아가기 -->
		<td colspan="6"><a href="http://localhost/ShareProject/ClassMainPage.do">[뒤로가기]</a></td>
		</tr>
		
	</table>
	