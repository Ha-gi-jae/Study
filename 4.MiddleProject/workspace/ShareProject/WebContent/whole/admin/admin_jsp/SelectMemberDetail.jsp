<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO vo = (MemberVO) request.getAttribute("vo");
%>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="/ShareProject/js/jquery-3.6.0.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/ShareProject/js/jquery.serializejson.min.js"></script>
<script>
$(function(){
	$('#passwordReset').on('click',  function(){
		memid = "<%=vo.getMem_id()%>";
		$.ajax({
			url: '/ShareProject/PasswordReset.do',
			type: 'post',
			data: {'memid' : memid},
			dataType: 'json',
			success: function(res){
				alert("비밀번호가 초기화 되었습니다.");
				location.reload();
			},
			error: function(xhr){
			}
		})
	})
	
	$('#updateMember').on('click', function(){
		memid = '<%=vo.getMem_id()%>';
		
		name = '<%=vo.getMem_name()%>';
		
		addr1 = '<%=vo.getMem_addr1()%>';
		
		addr2 = '<%=vo.getMem_addr2()%>';
		
		memhp = '<%=vo.getMem_hp()%>';
		
		$('#updateMemberModal .updatememid').val(memid);
		$('#updateMemberModal .updatename').val(name);
		$('#updateMemberModal .updateaddr1').val(addr1);
		$('#updateMemberModal .updateaddr2').val(addr2);
		$('#updateMemberModal .updatehp').val(memhp);
		$('#updateMemberModal').modal('show');
		
		$(document).on('click', '#bupdate', function(){
			datas = $('#updateMemberModal form').serialize();
			$.ajax({
				url: '/ShareProject/UpdateMember.do',
				data: datas,
				type: 'post',
				dataType: 'json',
				success:function(res){
					$('#updateMemberModal .fin').val("");
					$('#updateMemberModal').modal('hide');
					location.reload();
				},
				error: function(xhr){
				}
			})
		})
	})
})
</script>

<style>
table {
	margin : 30px 50px 50px 50px;
	border-collapse: collapse;
	text-align: center;
	width : 1000px;
	font-size: 18px;
}
#boardH2 {
	margin-top : 25px;
	margin-left: 45px;
	margin-bottom: 10px;
}
.thTitle {
	text-align: center;
}
#boardHr {
	border : 2px solid orange;
}
#updateMemberModal label {
	width: 60px;
}
</style>
</head>
<body>
<h2 id="boardH2">회원 정보 상세 조회</h2>
<hr id="boardHr">
<table border="1">
	<tr>
		<td >
			<input id="passwordReset" type="button" value="비밀번호 초기화">
		</td>
		<td colspan="2">
			<input id="updateMember" type="button" value="회원정보 수정">
		</td>
	</tr>
	<tr>
		<td class="thTitle">
			반: <%= vo.getClass_name() %> 
		</td>
		<td class="thTitle" colspan="2">
			구분: <%= vo.getMem_group() %>
		</td>
	<tr>
		<td class="thTitle">
			이름: <%= vo.getMem_name() %>
		</td>
		<td class="thTitle" colspan="2">
	 		생년월일: <%= vo.getBirth() %>
	 	</td>
	 </tr>
	 <tr>
		<td class="thTitle" colspan="3">
			주소: <%= vo.getMem_addr1() %><%= vo.getMem_addr2() %>
		</td>
	 </tr>
	 <tr>
	 	<td class="thTitle" colspan="3">
			연락처: <%= vo.getMem_hp() %>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<input onclick="history.go(-1);" type="button" value="목록으로">
		</td>
	</tr>
</table>


<!-- Modal -->
<div id="updateMemberModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">회원 정보 수정</h4>
      </div>
      <div class="modal-body">
         <h3>회원 정보 수정</h3>
           <form action="/ShareProject/UpdateMember.do" method="post">
         	  <br>
         	  <label>이름</label>
         	  <input class="fin updatename" type="text" name="mem_name" ><br>

         	  <label>주소</label>
         	  <input class="fin updateaddr1" type="text" name="mem_addr1"><br>

         	  <label>상세 주소</label>
         	  <input class="fin updateaddr2" type="text"  name="mem_addr2"><br>

         	  <label>연락처</label>
         	  <input class="fin updatehp" type="text" name="mem_hp"><br>
         	  <input class="fin updatememid" type="hidden" name="mem_id"><br>
         	  <br><br>
         	  <button type="button" id="bupdate" class="btn btn-success">수정완료</button>
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