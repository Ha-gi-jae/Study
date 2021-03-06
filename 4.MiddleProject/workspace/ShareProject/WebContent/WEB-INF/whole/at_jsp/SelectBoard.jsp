<%@page import="kr.or.ddit.member.vo.MemVO"%>
<%@page import="kr.or.ddit.board.vo.AdminreVO"%>
<%@page import="kr.or.ddit.at.vo.AtVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	BoardVO bv = (BoardVO) request.getAttribute("bv");
	int id_chk = (int) request.getAttribute("id_chk");
	
	String name="";
	if(!bv.getMem_name().equals("관리자")){
	 name = bv.getMem_name().substring(0, 1) + "**";
	}else{
		name="관리자";
	}
	
	String board_title_id = (String)request.getAttribute("board_title_id");

	List<AtVO> list = (List<AtVO>)request.getAttribute("fileList");
	
	//답글 리스트
	List<AdminreVO> reList =(List<AdminreVO>) request.getAttribute("reList");
	
	
	
	MemVO mv = (MemVO) request.getAttribute("mv");
	
	//ResponseMemId.java
// 	String mem_id = (String) request.getAttribute("mem_id");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!--※필수※ 아이콘, 스타일-->
    <script src="https://kit.fontawesome.com/b69eadd32e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/ShareProject/Real_Final_Pages/css/FinalStyle.css">
    <link rel="stylesheet" href="/ShareProject/Real_Final_Pages/css/FinalMainStyle.css">
    <!--↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="/ShareProject/js/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){	
		$('#mypage').on('click', function(){
			$.ajax({
				url: '/ShareProject/Admin.do',
				type: 'get',
				dataType: 'json',
				success: function(res){
					if(res.flag=="admin"){
						location.href="/ShareProject/whole/admin/admin_html/AdminPage.html";
					}
				},
				error: function(xhr){
				}
			})
		})
	})
	</script>
	<link rel="icon" type="image/png" href="/ShareProject/Real_Final_Pages/images/logoIcon.PNG" sizes="96x93">
	
    <title>Share Project</title>

<style>
.clButton {
	color : black;
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
p#subject {
	font-size: 13px;
	width : 100%;
	height: 100%;
}

#atchTable {
	width : 70%;
	height : 70%;
	text-align: center;
}
#boardBox {
	display : flex;
	justify-content: center;
	flex-direction : column;
	align-items: center;
	overflow-x : hidden;
}
.replyBox {
	width : 90%;
	margin-left : 5%;
	margin-bottom : 1%;
	padding : 2%;
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
.replyContainer {
	width : 70%;
	height: 30%;
	overflow : scroll;
	overflow-x : hidden;
	border-bottom : 1px solid darkgray;
	border-right : 1px solid darkgray;
	border-left : 1px solid darkgray;
	margin-top : 1px;
}
.replyTable {
	width : 100%;
	text-align: center;
}
.replyTable td {
	height: 30px;
}
.replyTable .td1 {
	height: 30px;
	width : 15%;
}
.replyTable .td2 {
	height: 30px;
	width : 40%;
}
.replyTable .td3 {
	height: 30px;
	width : 12%;
}
.reportInputBox {
	width : 90%;
	margin-left : 5%;
	padding : 2%;
}
.tdColor {
	background-color: lightgray;
}
</style>
</head>

<body>
    <div id="page-wrap">
        <aside id="leftMenu">
            <div id="logoImg">
                <img id="mainlogo" src="/ShareProject/Real_Final_Pages/images/menulogo.PNG" alt="mainlogo">
            </div>

            <div id="infoBox">
                <div id="stuInfoBox">
                    <h2>공밀레</h2>
                    <div id="subjectBox">
                        <p id="subject">[기업맞춤형] 전자정부 표준 프레임워크 기반 풀-스택 개발자 양성과정(15기)</p>
                    </div>
                    
                    <div id="MMLOption">
                        <a id="mypage" class="infOption" href="/ShareProject/whole/member/myPage.html"><i class="fas fa-house-user"></i>&nbsp;마이페이지</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="infOption" href="/ShareProject/whole/member/message.html"><i class="far fa-envelope"></i>&nbsp;쪽지</a>
                        <br>
                        <a class="infOption" href="/ShareProject/Real_Final_Pages/Final_LoginPage.html"><i class="fas fa-sign-out-alt"></i>&nbsp;로그아웃</a>
                    </div>
                </div>
            </div>

            <div id="classBtn">
                <a href="/ShareProject/ClassMainPage.do"><input type="button" class="clButton" value="클래스 입장하기"></a>
            </div>
           <ul id="ulBox">
                <li class="menuList"><a class="aMenuList" href="/ShareProject/Cal.do"><i class="far fa-calendar-alt"></i>&nbsp;&nbsp;기관일정</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/board/NoticBoard.html"><i class="mIcons fas fa-exclamation-circle"></i>&nbsp;&nbsp;공지사항</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/TreeView.do"><i class="mIcons fas fa-paperclip"></i>&nbsp;&nbsp;자료공유</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/board/MakeUPBoard.html"><i class="mIcons far fa-file-alt"></i>&nbsp;&nbsp;보강자료</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/board/WHQnABoard.html"><i class="mIcons fas fa-question-circle"></i>&nbsp;&nbsp;질문게시판</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/board/FreeBoard.html"><i class="mIcons fas fa-users"></i>&nbsp;&nbsp;자유게시판</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/board/MarketBoard.html"><i class="mIcons fas fa-shopping-basket"></i>&nbsp;&nbsp;장터게시판</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/board/ReviewBoard.html"><i class="mIcons fas fa-user-graduate"></i>&nbsp;&nbsp;수료후기</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/comp/ComBoard.html"><i class="mIcons far fa-building"></i>&nbsp;&nbsp;회사정보</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/board/SuggestBoard.html"><i class="mIcons fas fa-wrench"></i>&nbsp;&nbsp;건의사항</a></li>
            </ul>
            <div id="copyBox">
                <p id="copyright">Copyright 2021 Share Project<br>
                Design: 공밀레</p>
            </div>
        </aside>

		<aside id="rightMain">
			<div id="boardBox">
			<hr class="topHr">
				<table id="atchTable" border="1">
					<tr>
						<td class="tdColor" colspan="5">작성자 : <%=name%>&#09;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							작성일 : <%=bv.getBoard_date()%>&#09;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							조회수 : <%=bv.getAdminboard_view()%>&#09;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							댓글수 : <%=bv.getReply_count()%>
						</td>
					</tr>

					<tr>
						<td colspan="4">제목</td>
						<td><%=bv.getBoard_title()%></td>
					</tr>

					<tr>
						<td colspan="4">내용</td>
						<td style="overflow-y:scroll;"><%=bv.getBoard_content()%></td>
					</tr>

					<%
						if (list.size() > 0) {
					%>
					<tr>
					<td colspan="5">
						<%
							for (AtVO fileVO : list) {
									System.out.println(fileVO.getFile_extsn());
									if (fileVO.getFile_extsn().equals("png") || fileVO.getFile_extsn().equals("jpg")
											|| fileVO.getFile_extsn().equals("PNG") || fileVO.getFile_extsn().equals("jpeg")) {
						%>
						
							<img src="<%=request.getContextPath()%>/filedownload.do?fileId=<%=fileVO.getAtch_file_id()%>&fileSn=<%=fileVO.getFile_sn()%>">
						
						<%
							} else {
						%>
						<a href="<%=request.getContextPath()%>/filedownload.do?fileId=<%=fileVO.getAtch_file_id()%>&fileSn=<%=fileVO.getFile_sn()%>"><%=fileVO.getOrignl_file_nm()%></a>
						
						<%
							}
								}
							}else{
								
						%>
						<td colspan="5">첨부파일 없음</td>
						<%
							}
						%> 
					</tr>

					<tr>
						<td class="tdColor" colspan="5"><strong>답글</strong></td>
					</tr>
				</table>


				<div class="replyContainer">
					<table class="replyTable" border="1">
						<%
							if (reList.size() > 0) {
						%>
						
						<%
							for (int i = 0; i < reList.size(); i++) {
								AdminreVO arv = reList.get(i);
								String rename = arv.getMem_name().substring(0, 1)+"**";
						%>

					<tr >
						<td class="td1">작성자 : <%=rename%></td>
						<td id="recont<%=i %>" class="td2"><%=arv.getAdminre_content()%></td>
						<td class="td3" id="inputParent">
							<input id="<%=arv.getMem_id()%>" type="button" name="recont<%=i %>" class="reUpdate" value="수정"> 
							<input id="<%=arv.getMem_id()%>" type="button" class="reDelete" value="삭제"> 
							<input type="hidden" id="<%=arv.getAdminre_num()%>" class="adminre_num">
						</td>
					</tr>

						<%
							}
							}
						%>
					
					</table>
					</div>
					
					<br>
					<div id="bottonBox">
							<input type="button" id="back" value="뒤로">
							<%
								if (id_chk > 0) {
							%> 
							<input type="button" data-toggle="modal" data-target="#UpdateModal"
							value="수정"> <input type="button" id="delete" value="삭제">
							<%
								}
								if (board_title_id.equals("BR11") || board_title_id.equals("BR02") || board_title_id.equals("BR07")
									|| board_title_id.equals("BR08")) {
							%> 
								<input type="button" id="report" data-toggle="modal" data-target="#reportModal" value="신고하기"> 
							<%
 								}

 								if (board_title_id.equals("BR10") || board_title_id.equals("BR11") || board_title_id.equals("BR12")
 									||board_title_id.equals("BR02")	) {
 							%> 
 								<input type="button" id="response" data-toggle="modal"	data-target="#ResponseModal" value="답글"> 
 							<%
 								}
 							%>
 					</div>
			<hr class="bottomHr">		
				

				<!-- Modal=================================================================================== -->
				<div class="modal fade" id="UpdateModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">글 수정</h4>
							</div>
							<div class="modal-body">
								<form id="updateFile" action="insert.do" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="board_title_id" value="<%=bv.getBoard_title_id()%>"> 
									<input type="hidden" name="adminboard_id" value="<%=bv.getAdminboard_id()%>"> 
									<input type="text" name="board_title" value="<%=bv.getBoard_title()%>" />
									<br>
									<textarea cols="50" rows="20" style="resize: none;"	name="board_content"><%=bv.getBoard_content()%></textarea>
									<input type="file" name="atchFile"> 
									<input type="submit" id="update" class="btn btn-default" data-dismiss="modal" value="수정" />
								</form>
							</div>
							<div class="modal-footer">

								<button type="button" class="btn btn-default"
									data-dismiss="modal" id="cancel">취소</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="reportModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">신고하기</h4>
							</div>
							<div class="modal-body">
								<form id="reportForm">
									<input type="hidden" name="adminboard_id"
										value="<%=bv.getAdminboard_id()%>"> <input
										type="hidden" name="mem_id" value="<%=mv.getMem_id()%>">
									<br>
									<textarea class="reportInputBox" cols="30" rows="20" style="resize: none;" name="report_reason" placeholder="신고 이유를 작성해주세요."></textarea>
									
								</form>
							</div>
							<div class="modal-footer">
								<input type="submit" id="reportBtn" class="btn btn-default"	data-dismiss="modal" value="신고" />
								<button type="button" class="btn btn-default" data-dismiss="modal" id="cancel">취소</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal 답글-->
				<div class="modal fade" id="ResponseModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">답글</h4>
							</div>
							<div class="modal-body">
								<form name="resForm" id="responseForm">
									<input type="hidden" name="adminboard_id" value="<%=bv.getAdminboard_id()%>">
									<textarea class="replyBox" cols="50" rows="20" style="resize: none;" name="adminre_content"></textarea>
								</form>
							</div>
							<div class="modal-footer">
								<input type="button" id="reinsert" class="btn btn-default" value="등록"/>
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal 답글수정 -->
				<div class="modal fade" id="reUpdateModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">답글 수정</h4>
							</div>
							<div class="modal-body">
								<form>
									<input type="hidden" name="adminboard_id" value="<%=bv.getAdminboard_id() %>">
									<textarea class="replyBox" id="rerecontent" cols="50" rows="20" style="resize: none;" name="adminre_content"></textarea>
								</form>
							</div>
							<div class="modal-footer">
								<input type="button" id="remupdate" class="btn btn-default"	value="수정" />
								<!-- <input type="button" id="redelete" class="btn btn-default" value="삭제">  -->
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</aside>
	</div>
</body>
</html>