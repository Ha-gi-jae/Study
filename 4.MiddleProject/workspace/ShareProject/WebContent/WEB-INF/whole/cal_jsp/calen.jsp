<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.cal.vo.CalVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
	List<CalVO> list = (List<CalVO>)request.getAttribute("list");
	List<CalVO> list1 = (List<CalVO>)request.getAttribute("list1") == null ? new ArrayList<CalVO>() :(List<CalVO>)request.getAttribute("list1");
	
	String memId = (String) session.getAttribute("mem_id");
	System.out.println("회원아이디는 " + memId);
	
	String admin = (String)session.getAttribute("admin_id");
	System.out.println(admin);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!--※필수※ 아이콘, 스타일-->
    <script src="https://kit.fontawesome.com/b69eadd32e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/ShareProject/Real_Final_Pages/css/FinalStyle.css">
    <link rel="stylesheet" href="/ShareProject/Real_Final_Pages/css/FinalMainStyle.css">
    <!--↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑-->
	
	<link rel="icon" type="image/png" href="/ShareProject/Real_Final_Pages/images/logoIcon.PNG" sizes="96x93">
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/ShareProject/js/jquery-3.6.0.min.js"></script>
 <script src="/ShareProject/js/jquery.serializejson.min.js"></script>
<link href='/ShareProject/js/main.min.css' rel='stylesheet'/>
<script src='/ShareProject/js/main.min.js'></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>일정조회</title>
<style>

  body {
    margin: 0px;
    padding: 0px;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    width: 800px;
    margin: 15px;
    
  }
  
  #detail{
 	 width:250px;
  	margin-top: 20px;
  }
  
  #box{
  	display: flex;
	justify-content: center;
	margin: 50px;
  }
  
  .list{
  	border-bottom: 2px solid gray;
  	width: 100%;
  }
  
  #writeModal label, #updateModal label{
	width: 100px;
  }
  
  .id, .col{
  	display : none;
  }
  
  .calA{
  	margin-left: 10px;	
  }
  
  #detail .calInsert{
  	display: flex;
	justify-content: flex-end;
  }
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

</style>
<script  src="/ShareProject/js/cal.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
    	
			
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev',
            center: 'title',
            right: 'next today',
            initialView: 'dayGridMonth'
          },
          contentHeight: 650,
          initialDate: new Date(),
          navLinks: false, // can click day/week names to navigate views
          businessHours: true, // display business hours0
          editable: false,
          selectable: true,
          displayEventTime: false,
          events: [
        	  <%
        		for(int i = 0; i < list.size(); i++){
        			CalVO vo = list.get(i);
        			if(i > 0) out.write(",");
        	%>	
        			{
        				title : '<%= vo.getItt_title() %>',
        				start : '<%= vo.getItt_start()%>',
        				end : '<%= vo.getItt_end() %>',
        				color : '<%= vo.getItt_color() %>',
      					display : 'border',// 여기는 BORDER로 하드코딩하기 
      					allday : true
						<%
      					if(vo.getItt_overlap().equals("Y")){
						%>
      						 ,overlap : true
						<%
						}
						%>
        			}
        	<%	
        		}
        	%>
        	]
        });
        
        calendar.render();
      });
    
   
   
    $(function() {
    	today = $('#calendar').find('.fc-day-today').attr('data-date').replace(/-/g, "");
    	console.log($('#calendar').find('.fc-day-today').attr('data-date'))
    	calList(today);
    	
    	 var id = "<%=memId%>";
    	
    	// 일정 상세 조회
    	$(document).on('click', '.fc-daygrid-day > *', function() {
    		
    		day = $(this).parents('.fc-daygrid-day').attr('data-date');
    		day1 = day.replace(/-/g, "");
    		
    		calList(day1, id);
    		
    		
    		$(document).on('click', '.pin', function() {

     			sval = new Date(day);
    			
     			sval.setHours(sval.getHours()+9);
     			sval = sval.toISOString().slice(0, 16);
     			
    			$('#writeModal .start').val(sval); 
    		})
    	})
    	
		
		// 일정 등록
		$('#send').on('click', function() {
			datas = $('#writeModal form').serializeJSON();	
			console.log(datas)
			insertCal(datas);
			
			location.reload();
			
		})
    	
		// 일정 수정
		$(document).on('click', '.modi', function() {
			// 수정 모달에 기본값 출력하기
			idvalue = $(this).parent('.list').find('.id').text();
			titlevalue = $(this).parent('.list').find('.ti').html();
			startvalue = $(this).parent('.list').find('.s').text();
			endvalue = $(this).parent('.list').find('.e').text();
			colvalue = $(this).parent('.list').find('.col').text();

			startvalue = new Date(startvalue);
			startvalue.setHours(startvalue.getHours()+18);
			startvalue = startvalue.toISOString().slice(0, 16);
			  
			endvalue = new Date(endvalue);
			endvalue.setHours(endvalue.getHours()+18);
			endvalue = endvalue.toISOString().slice(0, 16);
			
			$('#updateModal .id').val(idvalue);
			$('#updateModal .title').val(titlevalue);
			$('#updateModal .start').val(startvalue); 
			$('#updateModal .end').val(endvalue);
			$('#updateModal .color').val(colvalue);
			
			$('#usend').on('click', function() {
				updatas = $('#updateModal form').serializeJSON();
				updateCal(updatas);
			})
		})
		
		// 일정 삭제 
		$(document).on('click', '.del', function() {
			idvalue = $(this).parent('.list').find('.id').text();
		
			deleteCal(idvalue);
			 
			location.reload();
		})
		// 관리자 마이페이지 => 관리자페이지
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
            <a href="/ShareProject/MainPage.do">
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
				<div id="box">
					<div id='calendar'></div>
					<div id='detail'>
					<br><br>
						<h4 class='calA'>[0000년 00월 00일]</h4><br>

						<p class='calA'>해당하는 일정이 없습니다.<%=admin %></p>
					</div>
				</div>
            </div>
        </aside>
    </div>



 <!-- Modal -->
	<div id="writeModal" class="modal fade" role="dialog">
  		<div class="modal-dialog">
  		

   		 <!-- Modal content-->
    		<div class="modal-content">
     			 <div class="modal-header">
       				 <button type="button" class="close" data-dismiss="modal">&times;</button>
       				 <h4 class="modal-title">일정등록</h4>
     			 </div>
     			 <div class="modal-body">
        			<h3></h3>
        			<form>
        				<label>제목</label><input type="text" name="itt_title" class="fin"><br>
        				<label>시작날짜</label><input type="datetime-local" name="itt_start" class="fin start"><br>
        				                   <!--   <input type="time" name="itt_start" class="fin"><br> -->
        				<label>종료날짜</label><input type="datetime-local" name="itt_end" class="fin"><br>
        				                    <!--  <input type="time" name="itt_end" class="fin"><br> -->
        				<label>색상</label><input type="color" name="itt_color" class="fin"><br>
        				<input type="hidden" name="itt_overlap" value="N" class="holi"> 
        				<button type="button" id="send">전송</button>
        			</form>
      			</div>
     			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      			</div>
   			</div>
  		</div>
	</div>
	
	<!-- Modal -->
	<div id="updateModal" class="modal fade" role="dialog">
  		<div class="modal-dialog">
  		

   		 <!-- Modal content-->
    		<div class="modal-content">
     			 <div class="modal-header">
       				 <button type="button" class="close" data-dismiss="modal">&times;</button>
       				 <h4 class="modal-title">일정수정</h4>
     			 </div>
     			 <div class="modal-body">
        			<h3></h3>
        			<form>
        			    <input type="hidden" name="itt_id" class="fin id"><br>
        				<label>제목</label><input type="text" name="itt_title" class="fin title"><br>
        				<label>시작날짜</label><input type="datetime-local" name="itt_start" class="fin start"><br>
        				                   <!--   <input type="time" name="itt_start" class="fin"><br> -->
        				<label>종료날짜</label><input type="datetime-local" name="itt_end" class="fin end"><br>
        				                    <!--  <input type="time" name="itt_end" class="fin"><br> -->
        				<label>색상</label><input type="color" name="itt_color" class="fin color"><br>
        				<input type="hidden" name="itt_overlap" value="N" class="holi"> 
        				<button type="button" id="usend">전송</button>
        			</form>
      			</div>
     			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      			</div>
   			</div>
  		</div>
	</div>


	
</body>
</html>