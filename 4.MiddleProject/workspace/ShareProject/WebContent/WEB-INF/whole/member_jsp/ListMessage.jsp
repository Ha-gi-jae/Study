<%@page import="kr.or.ddit.board.vo.PagingVO"%>
<%@page import="kr.or.ddit.member.vo.MsgVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MsgVO> msgList = (List<MsgVO>) request.getAttribute("msgList");
	PagingVO pv = (PagingVO) request.getAttribute("pv");
	
%>
<style>
* {
	margin : 0px;
	padding : 0px;
}
#msgTable {
	text-align: center;
	margin-top : 3%;
	margin-left: 18%;
	width : 60%;
}
td.td0 {
	width : 30px;
}
td.td1 {
	width : 80px;
}
td.td2 {
	width : 350px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis; 
}
td.td3 {
	width : 230px;
}
#contBox {
	display : inline-block;
	margin-right : 0px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis; 
	width : 270px;
}
.colorTr {
	background-color: lightgray;
}
#buttonBox {
	margin-left: 70%;
}

</style>
		<%
			if(msgList.size()==0){
		%>		
		
			<div id="buttonBox">
				<input id="msgsend" type="button" value="전송">
				<input id="msgdelete" type="button" value="삭제">
			</div>
			
		<table id="msgTable" border="1">
			<tr class="colorTr">
				<td class="td1">보낸사람</td>
				<td class="td2">내용</td>
				<td class="td3">날짜</td>
			</tr>
			
			<tr>
				<td colspan="3">
					받은 쪽지가 없습니다.
				</td>
			</tr>
			
			<%if(pv.getTotalCount() >0){ %>
			<tr>
				<td colspan="6" align="center">
				<%if(pv.getFirstPageNo() > pv.getPageSize()){ %>
				<a class="pre" name="<%=pv.getFirstPageNo() - pv.getPageSize()%>">[이전]</a>
				
				<%} %>
				<%for(int pNo =pv.getFirstPageNo(); pNo <= pv.getLastPageNo(); pNo++){ %>
				<a class="page<%if(pNo==pv.getCurrentPageNo()){%>select<%} %>"><%=pNo %></a>
				<%} %>
				
				
				</td>
			</tr>
		<%
			}
		%>
			
			
			
			<tr>
				<!-- 메인페이지로 되돌아가기 -->
				<td colspan="6"><a href="http://localhost/ShareProject/MainPage.do">[뒤로가기]</td>
			</tr>
		</table>

		<%		
			}else{
		%>
		
		
	<div id="buttonBox">	
		<input id="msgsend" type="button" value="전송">
		<input id="msgdelete" type="button" value="삭제">
	</div>
			
	<table id="msgTable" border="1">
		<tr class="colorTr">
			<td class="td0"></td>
			<td class="td1">보낸사람</td>
			<td class="td2">내용</td>
			<td class="td3">날짜</td>
		</tr>
		
		<%
			for(int i=0; i<msgList.size(); i++){
				MsgVO mv = msgList.get(i);
		%>
		
		<tr class="tr1">
			<td class="td0"><input class="msg_chk" type="checkbox" name="msg_chk" value="<%=mv.getMsg_num()%>"></td>
			<td class="td1"><%=mv.getMsg_to() %></td>
			<td class="content td2">
				<div id="contBox">
					<%=mv.getMsg_content().replaceAll("\n", "").replaceAll("<br>", "")%>
				</div>
			</td>
			<td class="td3"><%=mv.getMsg_date()%></td>
		</tr>
		
		<%
			}
		%>
				
		<!-- 페이징 처리 시작 -->
		
		<%if(pv.getTotalCount() >0){ %>
			<tr>
				<td colspan="6" align="center">
				<%if(pv.getFirstPageNo() > pv.getPageSize()){ %>
				<a class="pre" name="<%=pv.getFirstPageNo() - pv.getPageSize()%>">[이전]</a>
				
				<%} %>
				<%for(int pNo =pv.getFirstPageNo(); pNo <= pv.getLastPageNo(); pNo++){ %>
				<a class="page<%if(pNo==pv.getCurrentPageNo()){%>select<%} %>"><%=pNo %></a>
				<%} %>
				
				<!-- 마지막페이지번호가 전체페이지 수보다 작은 경우(다음페이지 존재함) -->
				<%if(pv.getLastPageNo() <pv.getTotalCount()){ %>
				<a class="next" name="<%=pv.getFirstPageNo() + pv.getPageSize()%>">[다음]</a>
				<%} %>
				</td>
			</tr>
		<%
			}
		%>
		
		<tr>
		<!-- 메인페이지로 되돌아가기 -->
		<td colspan="6"><a href="http://localhost/ShareProject/MainPage.do">[뒤로가기]</td>
		</tr>
		
</table>
		<%		
			}
		%>


