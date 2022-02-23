<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.ddit.board.vo.PagingVO"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%
	List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
	PagingVO pv = (PagingVO) request.getAttribute("pv");
	String class_end = (String) request.getAttribute("class_end");
	String mem_id = (String)request.getAttribute("mem_id");
	String board_title_id = (String) request.getAttribute("board_title_id");
	String board_title_name = (String) request.getAttribute("board_title_name");
	
	Map<Integer, Integer> atchIdMap = (Map<Integer, Integer>)request.getAttribute("atchIdMap");
	
	if(mem_id.equals("admin")){
		class_end="30001010";
	}
	
	class_end = class_end.replaceAll("-", "").substring(0,8);
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
	
	Date date = new Date();
	int year = date.getYear() + 1900;
	int month =  date.getMonth() + 2;
	int day = date.getDate();
	String today = String.valueOf(year) + String.valueOf(month) + String.valueOf(day);
	
		
%>
<style>
table {
	margin : 30px 50px 50px 50px;
	border-collapse: collapse;
	text-align: center;
	width : 1000px;
	font-size: 18px;
}

#boardH2 {
	margin-top : 25px;
	margin-left: 45px;
	margin-bottom: 10px;
}

#searchBar {
	margin-top: 10px;
	position : relative;
	left : 60%;
}
.bu{
	text-align: right;
}
.cont{
	width: 300px;
	height: 300px;
}
#newPost {
	color : orange;
	font-weight: bold;
	text-decoration: none;
}
</style>
<h2 id="boardH2"><%=board_title_name %></h2>
<hr id="boardHr" color="orange">
	<table id="box">
 		 <tr>
 		<%
			int boardSize = boardList.size();
			if (boardSize > 0) {
				for (int i = 0; i < boardSize; i++) {
					BoardVO bv = boardList.get(i);
					if(bv.getAdminboard_blind().equals("N")){		
					int adminBoardId = bv.getAdminboard_id();
					
					int atchFileId = atchIdMap.get(adminBoardId);
					if(atchFileId > 0){
						%>
						<td class="cont">
						<img class="productimg" id="<%=bv.getAdminboard_id() %>" src="<%=request.getContextPath()%>/filedownload.do?fileId=<%=atchFileId%>&fileSn=1">
						<p class="title" id="<%=bv.getAdminboard_id() %>"><%=bv.getBoard_title() %></p>
						</td>
								
						<%
					}else{
						%>
						<td class="cont">
						<img class="productimg" src="/ShareProject/Real_Final_Pages/images/이미지없음.png">
						<p class="title" id="<%=bv.getAdminboard_id() %>"><%=bv.getBoard_title() %></p>
						</td>
						<%
					}
		
					} else {
						%>
						<td class="cont">
						<img class="productimg" src="/ShareProject/Real_Final_Pages/images/이미지없음.png">
						<p>블라인드처리</p>
						<p>접근 불가한 게시글입니다.</p>
						</td>
						<%
					}
					
					if(i == 3) {
						%>
						</tr><tr>
						<%
					}
				
					if(i == boardSize){
						%>
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
		<%} %>
		
		
		<%
		} else {
		%>
			<tr>
			<td>
			<p>해당하는 게시글이 없습니다.</p>
			</td>
			</tr>
		<%
			}
		if(board_title_id.equals("BR11")){
		%>
			<td colspan="6" class="bu"><a id="newPost" href="./AtInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
		
		<%	
		}
		
		
		%>
			<tr>
				<td colspan="6" class="bu"><a href="http://localhost/ShareProject/MainPage.do">[뒤로가기]</td>
			</tr>
		</table>
		<!-- 페이징 처리 끝 -->


		