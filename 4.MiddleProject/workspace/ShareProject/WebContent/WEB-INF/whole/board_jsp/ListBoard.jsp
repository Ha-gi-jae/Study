<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.ddit.board.vo.PagingVO"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%
	List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
    System.out.print(boardList.size());
    PagingVO pv = (PagingVO) request.getAttribute("pv");
	System.out.print(pv.getBoard_title());
	
	
	
	String class_end = (String) request.getAttribute("class_end");
	System.out.print(class_end);
	String mem_id = (String)request.getAttribute("mem_id");
	System.out.print(mem_id);
	String mem_group = (String) request.getAttribute("mem_group");
	System.out.print(mem_group);
	String board_title_id = (String) request.getAttribute("board_title_id");
	System.out.print(board_title_id);
	String board_title_name = (String) request.getAttribute("board_title_name");
	System.out.print(board_title_name);
	
	
	
	
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
* {
	margin: 0px;
	padding : 0px;
}
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
	left : 67%;
}
</style>

<h2 id="boardH2"><%=board_title_name %></h2>
<hr id="boardHr">
<%
	if(!board_title_name.equals("건의사항")){
			
%>
<form id="searchBar">
	<select name = "f">
	<option value="title">제목</option>
	<option value="content">내용</option>
	</select>
	<input type="text" name= "q" id ="q">
	<input type="button" id="findbutton" value="검색하기"><br>
</form>   
<%
	}
%>	
		
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
					BoardVO bv = boardList.get(i);
					if(bv.getAdminboard_blind().equals("N")||bv.getAdminboard_blind()==null){		
		%>
		<tr class="tr2">
			<td class="tdNum"><%=bv.getBoard_num() %></td>
			<td class="title tdTitle" id="<%=bv.getAdminboard_id() %>"><%=bv.getBoard_title() %></td>
			<%
				String mem_name="";
				if(!bv.getMem_name().equals("관리자")){
				    mem_name=bv.getMem_name();
				 	mem_name = mem_name.substring(0, 1)+"*"+"*";
				}else{
					mem_name = bv.getMem_name();
				}
			%>
			<td class="tdName"><%=mem_name %></td>
			
			<td class="tdDate"><%=bv.getBoard_date() %></td>
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
		<%} %>
		<!-- 페이징 처리 끝 -->
		
		<!-- 검색 -->
		
		<%
		} else {
		%>
		
		<tr>
			<td colspan="6">해당 게시글이 없습니다.</td>
		</tr>
		
		<%
			}
		%>

		<tr align="right">
		
		<%
		// 게시판이 수료후기 게시판이 이면서 수료 날짜가 한달남은 사람에게만 보이기
		if(board_title_id.equals("BR04") && today.compareTo(class_end) >= 0){
		%>
		
			<td colspan="6"><a id="newPost" href="./InsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
			
		<%
		}
		// 회사정보 게시판이면서 아이디가 관리자인 경우에만 보이기
		else if(board_title_id.equals("BR05") && mem_id.equals("admin")){
		%>
		
			<td colspan="6"><a id="newPost" href="./InsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
			
		<%
		}
		// 공지사항 게시판이면서 아이디가 관리자인 경우 
		else if(board_title_id.equals("BR01")  && mem_id.equals("admin")){
		%>
			<td colspan="6"><a id="newPost" href="./NotiInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
			
		<%
		} else if(board_title_id.equals("BR02")){
		%>
		
			<td colspan="6"><a id="newPost" href="./AtInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
			
		<%
		} else if(board_title_id.equals("BR06")) {
		%>
		
			<td colspan="6"><a id="newPost" href="./InsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
			
		<%
		} else if(board_title_id.equals("BR07")) {
		%>
		
			<td colspan="6"><a id="newPost" href="./InsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
		
		<%
		} else if(board_title_id.equals("BR08")) {
		%>
		
			<td colspan="6"><a id="newPost" href="./InsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
		
		<%
		} else if(board_title_id.equals("BR09")){
		%>
			<td colspan="6"><a id="newPost" href="./InsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td>
		
		<%	
		} else if(board_title_id.equals("BR10")){
		%>
		
			<td colspan="6"><a id="newPost" href="./AtInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td>
			
		<%	
		}else if(board_title_id.equals("BR11")){
		%>
			<td colspan="6"><a id="newPost" href="./AtInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
		
		<%	
		//보강자료 게시판
		}else if(board_title_id.equals("BR12") && mem_group.equals("pro")){
		%>
			<td colspan="6"><a id="newPost" href="./AtInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td>
		<%	
		}
		%>
		</tr>
		
		<tr>
		<!-- 메인페이지로 되돌아가기 -->
		<td colspan="6"><a href="http://localhost/ShareProject/MainPage.do">[뒤로가기]</a></td>
		</tr>
		
	</table>
	<input type='hidden' id='findtitle' value='<%=pv.getNotice_title() %>'>
	<input type='hidden' id='findcontent' value='<%=pv.getNotice_content() %>'>
	 <div id="Suggestview">
	
	</div> 