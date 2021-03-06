	<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO vo = (MemberVO) request.getAttribute("vo");
	String enabled = "";
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
	$('#updateMember').on('click', function(){
    	  id = ${vo.id}
    	  pwd = ${vo.pwd}
    	  email = ${vo.email}
    	  picture = ${vo.picture}
    	  enabled = ${vo.enabled}
    	  phone = ${vo.phone}
    	  name = ${vo.name}
    	  register = ${vo.register}
    	  address = ${vo.address}
    	  authority = ${vo.authority}
    	  
    	  $('#updateMemberModal .id').val(id);
    	  $('#updateMemberModal .pwd').val(pwd);
    	  $('#updateMemberModal .email').val(email);
    	  $('#updateMemberModal .picture').val(picture);
    	  $('#updateMemberModal .enabled').val(enabled);
    	  $('#updateMemberModal .phone').val(phone);
    	  $('#updateMemberModal .name').val(name);
    	  $('#updateMemberModal .register').val(register);
    	  $('#updateMemberModal .address').val(address);
    	  $('#updateMemberModal .authority').val(authority);
    	  $('#updateMemberModal').modal('show');
    	  
    	  $(document).on('click', '#bupdate', function(){
    		datas = $('#updateMemberModal form').serialize();
    		$.ajax({
    			url: '/JSP_HGJ/UpdateMember.do',
    			data: datas,
    			type: 'get',
    			dataType: 'json',
    			success:function(res){
    				$('#updateMemberModal .fin').val("");
    				$('#updateMemberModal').modal('hide');
    				location.reload();
    			},
    			error: function(xhr){
    				alert("??????????????????" + xhr.status);
    			}
    		})
    	  })
	})
	
	$('#back').on('click', function(){
		location.href="/JSP_HGJ/admin/admin_html/SelectList.html"
	})
})
</script>
</head>
<body>
<h2>?????? ??????</h2>
<hr>
<table border="1">
	<tr>
		<td colspan="4"><input id="updateMember" type="button" value="???????????? ??????"></td>
	</tr>
	<%
		if(vo.getEnabled() == 0) enabled = "??????";
		else if(vo.getEnabled() == 1) enabled = "?????????";
		else if(vo.getEnabled() == 2) enabled ="?????????";
			
	%>
	
	<tr>
		<td>??????: ${vo.name}</td>
		<td>???????????? : ${vo.enabled}</td>
		<td rowspan="4">??????: ${vo.picture}</td>
	</tr>
	<tr>
		<td colspan="2">????????????: ${vo.phone}</td>
	</tr>
	<tr>
		<td colspan="2">?????????: ${vo.id}</td>
	</tr>
	<tr>
		<td colspan="2">?????????: ${vo.email}</td>
	</tr>
	
	<tr>
		<td colspan="2">??????: ${vo.address}</td>
		<td colspan="1">?????????: ${vo.register}</td>
	
	</tr>
	<tr>
		<td colspan="2">?????????: ${vo.regdate}</td>
		<td colspan="1">??????: ${vo.authority}</td>
	</tr>
		<tr><td colspan="4"><input id="back" type="button" value="????????????"></td></tr>
</table>

<!-- Modal -->
<div id="updateMemberModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">?????? ?????? ??????</h4>
      </div>
      <div class="modal-body">
   <h3>?????? ?????? ??????</h3>
           <form>
         	  <br>
         	  <input class="fin id" type="hidden" name="id"><br>
         	  <label>????????????</label>
         	  <input class="fin pwd" type="password" name="pwd"><br>
         	  <label>?????????</label>
         	  <input class="fin email" type="text" name="email"><br>
         	  <label>??????</label>
         	  <input calss ="fin picture" type="button" value="????????????" name="picture"><br>
         	  <label>????????????</label>
         	  <select name="enabled">
         	  <option value="0">??????</option>
         	  <option value="1" selected>??????</option>
         		<option value="2">??????</option>
         	  </select><br>
         	  <label>???????????????</label>
         	  <input class="fin phone" type="text" name="phone"><br>
         	  <label>??????</label>
         	  <input class="fin name" type="text" name="name"><br>
         	  <label>?????????</label>
         	  <input class="fin register" type="text" name="register"><br>
         	  <label>??????</label>
         	  <input class="fin address" type="text" name="address"><br>
         	  <label>??????</label>
         	  <input class="fin authority" type="text" name="authority"><br>
         	  <button type="button" id="bupdate" class="btn btn-success">????????????</button>
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