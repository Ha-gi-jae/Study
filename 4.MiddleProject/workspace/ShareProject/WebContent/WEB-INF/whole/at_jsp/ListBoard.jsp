<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.ddit.board.vo.PagingVO"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
	PagingVO pv = (PagingVO) request.getAttribute("pv");
	String class_end = (String) request.getAttribute("class_end");
	String mem_id = (String)request.getAttribute("mem_id");
	String board_title_id = (String) request.getAttribute("board_title_id");
	String board_title_name = (String) request.getAttribute("board_title_name");
	
	
	if(mem_id.equals("admin")){
		class_end="30001010";
	}
	
	class_end = class_end.replaceAll("-", "").substring(0,8);
	System.out.println(class_end);
	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
	
	Date date = new Date();
	int year = date.getYear() + 1900;
	int month =  date.getMonth() + 2;
	int day = date.getDate();
	String today = String.valueOf(year) + String.valueOf(month) + String.valueOf(day);
	
%>
<h2><%=board_title_name %></h2>
<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>댓글수</th>
		</tr>
		<%
			int boardSize = boardList.size();
			if (boardSize > 0) {
				for (int i = 0; i < boardSize; i++) {
					BoardVO bv = boardList.get(i);
					if(bv.getAdminboard_blind().equals("N")){		
		%>
		<tr>
			<td><%=bv.getBoard_num() %></td>
			<td class="title" id="<%=bv.getAdminboard_id() %>"><%=bv.getBoard_title() %></td>
			<td><%=bv.getMem_name() %></td>
			<td><%=bv.getBoard_date() %></td>
			<td><%=bv.getAdminboard_view() %></td>
			<td><%=bv.getReply_count() %></td>
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
		
			<td colspan="6"><a href="./InsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
			
		<%
		}
		// 회사정보 게시판이면서 아이디가 관리자인 경우에만 보이기
		else if(board_title_id.equals("BR05") && mem_id.equals("admin")){
		%>
		
			<td colspan="6"><a href="./InsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
			
		<%
		}
		// 공지사항 게시판이면서 아이디가 관리자인 경우 
		else if(board_title_id.equals("BR01")  && mem_id.equals("admin")){
		%>
			<td colspan="6"><a href="./NotiInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
			
		<%
		} else if(board_title_id.equals("BR02")){
		%>
		
			<td colspan="6"><a href="./AtInsertBoard.jsp?group=<%=board_title_id %>">[등록]</a></td> 
			
		<%
		}
		%>
		</tr>
		
	</table>