<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int adminbaord_id = Integer.parseInt(request.getParameter("board_id"));
	String boardtitle_id = request.getParameter("boardtitle_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="/ShareProject/js/jquery-3.6.0.min.js"></script>
<script src="/ShareProject/js/jquery.serializejson.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>
img{
 	width : 200px;
 	height: 200px;
}
</style>
<title>Insert title here</title>

<script type="text/javascript">
	$(function() {
		$.ajax({
			url:'/ShareProject/SelectClAtBoard.do',
			type:'get',
			data:{'board_id' : <%=adminbaord_id %>, "boardtitle_id" : "<%=boardtitle_id%>"},
			dataType: 'html',
			success:function(result) {
				
				$('#view').html(result);
			},
			error:function(xhr){
			}
		})
				
		
		$(document).on('click','#update', function(e) {
			e.preventDefault();

			var form = $('#updateFile')[0];
			
			var data = new FormData(form);
			
			console.log(data);
			
			$.ajax ({
				url:'/ShareProject/UpdateClAt.do',
				type:'post',
				data: data,
		        processData: false, //필수
		        contentType: false, // 필수
		        cache: false,
				dataType:'json',
				success:function(result){
						location.reload();
				},
				error:function(xhr){
				}
			})
		})
		
		
		$(document).on('click','#delete', function() {
			$.ajax ({
				url:'/ShareProject/DeleteBoard.do',
				type:'post',
				data:{'adminboard_id' : <%=adminbaord_id %>},
				dataType:'json',
				success:function(result){
					if(result.flag == "성공"){
						if("<%=boardtitle_id%>" =="BR06"){
							 location.href="/ShareProject/whole/clBoard/ClQnABoard.html";
						}else if("<%=boardtitle_id%>" == "BR07"){
							location.href="/ShareProject/whole/clBoard/ClLunchBoard.html";
						}else if("<%=boardtitle_id%>" == "BR08"){
							location.href="/ShareProject/whole/clBoard/ClFreeBoard.html";
						}
					}
				},
				error:function(xhr){
				}
			})	
		})
		
		$(document).on('click', '#end', function() {
			$('#m').remove();
		})
		
		$(document).on('click', '#back', function() {
			if("<%=boardtitle_id%>" =="BR06"){
				 location.href="ClQnABoard.html";
			}else if("<%=boardtitle_id%>" == "BR07"){
				location.href="ClLunchBoard.html";
			}else if("<%=boardtitle_id%>" == "BR08"){
				location.href="ClFreeBoard.html";
			}// 뒤로버튼 클릭 후 돌아갈 게시판 아이디랑 경로 html로 넣으시면 됩니당
		})
		
		$(document).on('click', '#reportBtn', function() {
			reportData = $('#reportForm').serializeJSON();
			console.log(reportData)
			$('#reportModal').modal('hide');
			$.ajax({
				url:'/ShareProject/Report.do',
				type:'post',
				data: reportData,
				dataType:'json',
				success:function(result){
					if(result.flag == "성공"){
						alert("신고가 완료되었습니다.")
					}		
				},
				error:function(xhr){
				}
			})
		})
		//////////////////////////////////////////////////////////////
		//답글등록 구현
		$(document).on('click', '#reinsert', function(){
			 fdata =$('#responseForm').serialize();
			 $.ajax({
				url : '/ShareProject/InsertAdminreBoard.do',
				data : fdata,
				dataType : 'json',
				type : 'get',
				success : function(res){
					if(res.flag=="답글등록완료"){
						location.reload();
					}else{
						//location.href="ClFreeBoard.html";
						location.reload();
					}
					
				},
				error : function(xhr){
				}
			 })
		})
		
		//답글 수정버튼 눌렀을때 계정확인
		$(document).on('click', '.reUpdate', function(){
		 remem_id=$(this).attr('id');
		 rename = $(this).attr('name');
		 recont = $('#'+ rename).text();
		 
		 $('#rerecontent').val(recont);
		 adminre_num=$(this).parents('#inputParent').find('.adminre_num').attr('id');
		 /* console.log(remem_id);
		 console.log(adminre_num);  */
		 $.ajax({
			url : '/ShareProject/UpdateAdminreBoard.do',
			data : {'remem_id' : remem_id},
			dataType : 'json',
			type : 'get',
			success : function(res){
				if(res.flag=="일치"){
					$('#reUpdateModal').modal('show');
				}else{
					alert("본인계정 답글이 아닙니다.");
					location.reload();
				}
			},
			error : function(xhr){
			}
		 }) 
	 })
	 
	 
	 //답글삭제버튼 눌렸을때 답글 본인계정확인
	 $(document).on('click', '.reDelete', function(){
		 remem_id=$(this).attr('id');
		 adminre_num=$(this).parents('#inputParent').find('.adminre_num').attr('id');
		 /* console.log(remem_id);
		 console.log(adminre_num);  */
		 $.ajax({
			url : '/ShareProject/UpdateAdminreBoard.do',
			data : {'remem_id' : remem_id},
			dataType : 'json',
			type : 'get',
			success : function(res){
				if(res.flag=="일치"){
					$.ajax({
						url : '/ShareProject/DeleteAdminreBoard.do',
						data : {'adminre_num' : adminre_num},
						dataType : 'json',
						type : 'get',
						success : function(res){
							location.reload();
						},
						error : function(xhr){
						}
					})
					
				}else{
					alert("본인계정 답글이 아닙니다.");
					location.reload();
				}
			},
			error : function(xhr){
			}
		 }) 
	 })
	 
	 //답글 수정
	 $(document).on('click', '#remupdate', function(){
		  recontent=$('#rerecontent').val();
		  /* console.log(recontent);
		  console.log(adminre_num); */
		  $.ajax({
			  url : '/ShareProject/UpdateAdminreContent.do',
			  data : {'recontent' : recontent,
				      'adminre_num' : adminre_num},
			  dataType : 'json',
			  type : 'get',
			  success : function(res){
				  if(res.flag="수정완료"){
				   $('#reUpdateModal').modal("hide");
				   location.reload();
				  } 
			  },
			  error : function(xhr){
			  }
		  })
	 })
	 
	  
	  
	})
	
	
</script>
</head>

<body>
	<div id="view"></div>
</body>
</html>