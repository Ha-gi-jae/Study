<%@page import="kr.or.ddit.board.vo.PagingVO"%>
<%@page import="kr.or.ddit.adminReport.vo.AdminReportVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<AdminReportVO> allreportlist = (List<AdminReportVO>) request.getAttribute("allreportlist");
	PagingVO pv = (PagingVO) request.getAttribute("pv");
	List<AdminReportVO> contentlist = (List<AdminReportVO>) request.getAttribute("reportcontent");
	List<AdminReportVO> board = (List<AdminReportVO>) request.getAttribute("board");
	List<AdminReportVO> classboard = (List<AdminReportVO>) request.getAttribute("classboard");
%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  
<%
	for(int i = 0; i < allreportlist.size(); i++){
		AdminReportVO vo = allreportlist.get(i);
		if(vo.getAdminboard_blind().equals("N")){
%>
<div class="w3-container">
<button onclick="myFunction(<%=vo.getAdminboard_id()%>)" class="w3-button w3-block w3-orange w3-left-align">아이디 : <%= vo.getAdminboard_id() %>  신고횟수: <%=vo.getReportcount() %>  블라인드처리여부: <%=vo.getAdminboard_blind() %></button>
<div id="<%=vo.getAdminboard_id()%>" class="w3-hide w3-container">

<%
			for(int k = 0; k < board.size(); k++){
				AdminReportVO bo = board.get(k);
				if(vo.getAdminboard_id().equals(bo.getAdminboard_id())){
				%>
<pre>
<input type="button" class="boardblind" id=<%=bo.getAdminboard_id() %> value="블라인드 처리">
게시글 제목 : <%=bo.getBoard_title() %>   &nbsp;&nbsp;&nbsp;&nbsp;        작성자 : <%=bo.getMem_id() %>&nbsp;&nbsp;&nbsp;&nbsp; 

내용 : <%=bo.getBoard_content() %>
</pre>
				 <%
				}
			}
			for(int l = 0; l < classboard.size(); l++){
				AdminReportVO cb = classboard.get(l);
			if(vo.getAdminboard_id().equals(cb.getAdminboard_id())){
			%>
<pre>
<input type="button" class="clboardblind" id=<%=cb.getAdminboard_id()%> value="블라인드 처리">
게시글 제목 : <%=cb.getClboard_title() %>  &nbsp;&nbsp;&nbsp;&nbsp;        작성자: <%=cb.getMem_id() %>&nbsp;&nbsp;&nbsp;&nbsp; 

내용 : <%=cb.getClboard_content() %>
</pre>
			<%
				}
			}
		for(int j = 0; j < contentlist.size(); j++){
			AdminReportVO co = contentlist.get(j);
			
				if(vo.getAdminboard_id().equals(co.getAdminboard_id())){
				%>
	<p>신고자 아이디 : <%=co.getMem_id() %> &nbsp;&nbsp;&nbsp;&nbsp;  사유 : <%=co.getReport_reason() %> &nbsp;&nbsp;&nbsp;&nbsp; 신고 날짜 : <%=co.getReport_date() %></p>
	<%
				}
		}
	%>
</div>

</div>
<%
		}// 경계선
	}
		for(int m = 0; m < allreportlist.size(); m++){
			AdminReportVO voa = allreportlist.get(m);
			if(voa.getAdminboard_blind().equals("Y")){
			%>
			<div class="w3-container">
<button onclick="myFunction(<%=voa.getAdminboard_id()%>)" class="w3-button w3-block w3-orange w3-left-align">아이디 : <%= voa.getAdminboard_id() %>  신고횟수: <%=voa.getReportcount() %>  블라인드처리여부: <%=voa.getAdminboard_blind() %></button>
<div id="<%=voa.getAdminboard_id()%>" class="w3-hide w3-container">

<%
			for(int k = 0; k < board.size(); k++){
				AdminReportVO bo = board.get(k);
				if(voa.getAdminboard_id().equals(bo.getAdminboard_id())){
				%>
<pre>
게시글 제목 : <%=bo.getBoard_title() %>  &nbsp;&nbsp;&nbsp;&nbsp;         작성자 : <%=bo.getMem_id() %>&nbsp;&nbsp;&nbsp;&nbsp; 

내용 : <%=bo.getBoard_content() %>
</pre>
				 <%
				}
			}
			for(int l = 0; l < classboard.size(); l++){
				AdminReportVO cb = classboard.get(l);
			if(voa.getAdminboard_id().equals(cb.getAdminboard_id())){
			%>
<pre>
게시글 제목 : <%=cb.getClboard_title() %>    &nbsp;&nbsp;&nbsp;&nbsp;       작성자: <%=cb.getMem_id() %>&nbsp;&nbsp;&nbsp;&nbsp; 

내용 : <%=cb.getClboard_content() %>
</pre>
			<%
				}
			}
		for(int j = 0; j < contentlist.size(); j++){
			AdminReportVO co = contentlist.get(j);
			
				if(voa.getAdminboard_id().equals(co.getAdminboard_id())){
				%>
	<p>신고자 아이디 : <%=co.getMem_id() %> &nbsp;&nbsp;&nbsp;&nbsp;  사유 : <%=co.getReport_reason() %>&nbsp;&nbsp;&nbsp;&nbsp;  신고 날짜 : <%=co.getReport_date() %></p>
	<%
				}
		}
	%>
</div>

</div>
			
			<%
			}
		}
	
%>
		<table>
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
			<tr>
				<td colspan="6">
				<input id="backbutton" onclick="history.go(-1);" type="button" value="목록으로">
				</td>
			</tr>
		</table>
		<%} %>
<script src="/ShareProject/js/jquery-3.6.0.js"></script>
<script>
$(function(){
	$(document).on('click', '.boardblind', function(){
		adminboard_id = $(this).attr('id');
		$.ajax({
			url: '/ShareProject/BoardBlind.do',
			type: 'post',
			data: {'adminboard_id' : adminboard_id},
			dataType: 'json',
			success: function(res){
				location.reload();
				alert("블라인드 처리가 완료되었습니다.")
			},
			error: function(xhr){
				location.reload();
				alert("블라인드 처리가 완료되었습니다.")
			}
		})
	})	
	
	$(document).on('click', '.clboardblind', function(){
		adminboard_id = $(this).attr('id');
		$.ajax({
			url: '/ShareProject/ClBoardBlind.do',
			type: 'post',
			data: {'adminboard_id' : adminboard_id},
			dataType: 'json',
			success: function(res){
				location.reload();
				alert("블라인드 처리가 완료되었습니다.")
			},
			error: function(xhr){
				alert("블라인드 처리가 완료되었습니다.")
				location.reload();
			}
		})
	})
	
})
</script>
