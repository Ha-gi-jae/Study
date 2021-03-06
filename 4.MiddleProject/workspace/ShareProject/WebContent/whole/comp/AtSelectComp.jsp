<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int adminbaord_id = Integer.parseInt(request.getParameter("board_id"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="/ShareProject/js/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/ShareProject/js/jquery.serializejson.min.js"></script>
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
			url:'/ShareProject/SelectCompBoard.do',
			type:'get',
			data:{'board_id' : <%=adminbaord_id %>},
			dataType: 'html',
			success:function(result) {
				
				$('#view').html(result);
			},
			error:function(xhr){
				alert("에러코드 : " + xhr.status + "에러명 : " + xhr.statusText );
			}
		})
				
		
		$(document).on('click','#update', function(e) {
			e.preventDefault();

			var form = $('#updateFile')[0];
			
			var data = new FormData(form);
			
			$.ajax ({
				url:'/ShareProject/UpdateComp.do',
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
					alert("에러코드 : " + xhr.status + "에러명 : " + xhr.statusText);
				}
			})
		})
		
		
		$(document).on('click','#delete', function() {
			$.ajax ({
				url:'/ShareProject/DeleteComp.do',
				type:'post',
				data:{'adminboard_id' : <%=adminbaord_id %>},
				dataType:'json',
				success:function(result){
					if(result.flag == "성공"){
						location.href="/ShareProject/whole/comp/ComBoard.html";
					}
						
				},
				error:function(xhr){
					alert("에러코드 : " + xhr.status + "에러명 : " + xhr.statusText);
				}
			})	
		})
		
		$(document).on('click', '#end', function() {
			$('#m').remove();
		})
		
		$(document).on('click', '#back', function() {
			location.href="/ShareProject/whole/comp/ComBoard.html";
		})
		
		
	})
</script>
</head>

<body>
	<div id="view"></div>
</body>
</html>