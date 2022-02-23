<%@page import="kr.or.ddit.at.vo.AtVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
   
   
    
<%
	BoardVO bv = (BoardVO) request.getAttribute("bv");
	int id_chk = (int) request.getAttribute("id_chk");
	System.out.println(bv.getBoard_title_id());
	String name ="";
	if(!bv.getMem_name().equals("관리자")){
		
	 name = bv.getMem_name().substring(0, 1) + "**";
	}else{
		name="관리자";
	}
	
	String board_title_id = (String)request.getAttribute("board_title_id");
%>
<style>
.cc {
	height: 10%;
}
.info{
	height: 10%;
}

#stuInfoBox h2 {
	margin-top : 0px;
    margin-bottom : 15px;
    color : black;
    font-weight: bold;
}
#subjectBox {
    display: flex;
    align-items: center;
    width : 230px;
    height: 60px;
    background-color: rgba(255, 255, 255, 0.6);
    font-size: 13px;
    padding: 5px;
    margin-bottom: 10px;
}

#atchTable {
	width : 55%;
	height : 55%;
	text-align: center;
}
#boardBox {
	display : flex;
	justify-content: center;
	flex-direction : column;
	align-items: center;
	overflow-x : hidden;
}
.topHr {
	width : 100%;
	border : 1px solid orange;
	margin-bottom : 7%;
}
.bottomHr {
	width : 100%;
	border : 1px solid orange;
	margin-top : 7%;
}
.tdColor {
	background-color: lightgray;
	height: 15%;
	font-size: 1.5em;
	font-weight: bold;
}
#modalBoxBox {
	width : 90%;
}
.modalInput {
	width : 100%;
}
</style>
<hr class="topHr">
<table id="atchTable" border="1">
	<tr>
		<td  class="tdColor" colspan="3"><%=bv.getBoard_title() %></td>
		</tr>
<%
		if(id_chk > 0){
%>
<tr>
<td colspan="3" class="cc">
<div id="bottonBox">
		<input type="button"  data-toggle="modal" data-target="#UpdateModal" value="수정">
		<input type="button" id="delete" value="삭제">
</div>
</td>
</tr>
<%
		} 	
%>
	<tr>
		<td colspan="3" class="info">
		작성자 <%=name %>&nbsp;&nbsp;&nbsp;&nbsp;
		작성일 <%=bv.getBoard_date() %>&nbsp;&nbsp;&nbsp;&nbsp;
		조회수 <%=bv.getAdminboard_view() %>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3"><%=bv.getBoard_content() %></td>
	</tr>
	
	<tr>
		<td colspan="3" class="cc"><div id="bottonBox"><input type="button" id="back" value="뒤로" ></div></td>
	</tr>
	
</table>
<hr class="bottomHr">	
	<!-- Modal -->
	<div class="modal fade" id="UpdateModal" role="dialog">
		<div class="modal-dialog">
		
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4	class="modal-title">글 수정</h4>
				</div>
				<div class="modal-body">
					<form>
					<div id="modalBoxBox">
						<input class="modalInput" type="hidden" name="adminboard_id" value="<%=bv.getAdminboard_id() %>">
						<input class="modalInput" type="text" name="board_title" value="<%=bv.getBoard_title() %>"/><br>
						<textarea class="modalInput" cols="50" rows="20" style="resize: none;" name="board_content"><%=bv.getBoard_content() %></textarea>
					</div>
					</form>
				</div>
				<div class="modal-footer">
					<input type="button" id="update" class="btn btn-default" value="수정" />
					<button type="button" id="cancel" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	