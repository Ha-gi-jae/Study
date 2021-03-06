<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% int adminbaord_id = Integer.parseInt(request.getParameter("board_id")); 
   String boardtitle_id = request.getParameter("boardtitle_id");%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!--※필수※ 아이콘, 스타일-->
    <script src="https://kit.fontawesome.com/b69eadd32e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/ShareProject/Real_Final_Pages/css/FinalStyle.css">
    <link rel="stylesheet" href="/ShareProject/Real_Final_Pages/css/FinalClassStyle.css">
    <!--↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑-->

 	<script src="/ShareProject/js/jquery.serializejson.min.js"></script>
	<script type="text/javascript" src="/ShareProject/js/jquery-3.6.0.min.js"></script>
	
	<link rel="icon" type="image/png" href="/ShareProject/Real_Final_Pages/images/logoIcon.PNG" sizes="96x93">
	
    <title>Share Project Class</title>
<style>
#Writing {
	margin : 40px;
}
</style>

<script type="text/javascript">
	
	$(function() {
		
		$.ajax({
			url:'/ShareProject/clSelectBoard.do',
			type:'get',
			data:{'adminboard_id' : "<%=adminbaord_id %>", "boardtitle_id" : "<%=boardtitle_id%>"},
			dataType: 'html',
			success:function(result) {
				$('#boardBox').html(result);
			},
			error:function(xhr){
				alert("에러코드 : " + xhr.status + "에러명 : " + xhr.statusText );
			}
		})
				
		
		$(document).on('click','#update', function() {
			fdata = $('form').serialize();
			//console.log(fdata);
			$.ajax ({
				url:'/ShareProject/clUpdateBoard.do',
				type:'post',
				data:fdata,
				dataType:'json',
				success:function(result){
					if(result.flag == "성공")
						$('#UpdateModal').modal("hide");
						location.reload();
				},
				error:function(xhr){
					alert("에러코드 : " + xhr.status + "에러명 : " + xhr.statusText);
				}
			})
		})
		
		
		$(document).on('click','#delete', function() {
			$.ajax ({
				url:'/ShareProject/clDeleteBoard.do',
				type:'post',
				data:{'adminboard_id' : <%=adminbaord_id%>},
				dataType:'json',
				success:function(result){
						//반 질문게시판
					if("<%=boardtitle_id%>" == "BR06"){
						 location.href="/ShareProject/whole/clBoard/ClQnABoard.html";
						//반 점심게시판
					}else if("<%=boardtitle_id%>" == "BR07"){
						location.href="/ShareProject/whole/clBoard/ClLunchBoard.html";
						//반 자유게시판
					}else if("<%=boardtitle_id%>" == "BR08"){
						location.href="/ShareProject/whole/clBoard/ClFreeBoard.html";
					}else if("<%=boardtitle_id%>" == "BR03"){
						// 반 공지사항
						location.href="/ShareProject/whole/clBoard/ClNoticeBoard.html";
					}
				},
				error:function(xhr){
					alert("에러코드 : " + xhr.status + "에러명 : " + xhr.statusText);
				}
			})//ajax
		})//delete
		
		
		//관리자 마이페이지 => 관리자페이지
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
</head>

<body>
    <div id="page-wrap">
        <aside id="leftMenu">
            <div id="logoImg">
                <a href="/ShareProject/ClassMainPage.do">
                <img id="mainlogo" src="/ShareProject/Real_Final_Pages/images/menulogo.PNG" alt="mainlogo">
                </a>
            </div>

            <div id="infoBox">
                <div id="stuInfoBox">
                    <h2>공밀레</h2>
                    <div id="subjectBox">
                        <p id="subject">[기업맞춤형] 전자정부 표준 프레임워크 기반 풀-스택 개발자 양성과정(15기)</p>
                    </div>
                    
                    <div id="MMLOption">
                        <a id="mypage" class="infOption" href="/ShareProject/whole/member/myPage.htm"><i class="fas fa-house-user"></i>&nbsp;마이페이지</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="infOption" href="/ShareProject/whole/member/message.html"><i class="far fa-envelope"></i>&nbsp;쪽지</a>
                        <br>
                        <a class="infOption" href="#"><i class="far fa-comments"></i>&nbsp;채팅</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="infOption" href="/ShareProject/Real_Final_Pages/Final_LoginPage.html"><i class="fas fa-sign-out-alt"></i>&nbsp;로그아웃</a>
                    </div>
                </div>
            </div>

            <div id="classBtn">
                <a href="/ShareProject/MainPage.do"><input type="button" class="clButton" value="클래스 나가기"></a>
            </div>
            <ul id="ulBox">
                <li class="menuList"><a class="aMenuList" href="/ShareProject/TtList.do"><i class="far fa-calendar-alt"></i>&nbsp;&nbsp;시간표</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/clBoard/ClNoticeBoard.html"><i class="mIcons fas fa-exclamation-circle"></i>&nbsp;&nbsp;공지사항</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/ClTreeView.do"><i class="mIcons fas fa-paperclip"></i>&nbsp;&nbsp;자료공유</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/clBoard/HomeworkBoard.html"><i class="mIcons far fa-file-alt"></i>&nbsp;&nbsp;과제게시판</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/clBoard/ClQnABoard.html"><i class="mIcons fas fa-question-circle"></i>&nbsp;&nbsp;질문게시판</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/clBoard/ClFreeBoard.html"><i class="mIcons fas fa-users"></i>&nbsp;&nbsp;자유게시판</a></li>
                <li class="menuList"><a class="aMenuList" href="/ShareProject/whole/clBoard/ClLunchBoard.html"><i class="mIcons fas fa-utensils"></i>&nbsp;&nbsp;점심게시판</a></li>
            </ul>
            <div id="copyBox">
                <p id="copyright">Copyright 2021 Share Project<br>
                Design: 공밀레</p>
            </div>
        </aside>

        <aside id="rightMain">
            <div id="boardBox"></div>
        </aside>
    </div>
</body>
</html>