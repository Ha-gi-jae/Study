<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
form{
	display: inline-block;
}
table{
	text-align: center;
	font-size: 1.5em;
}
th{
	text-align: center;
}
label{
	width: 100px;
}
</style>
<h2>상세 조회</h2>
<hr>
<table border="1">
	<tr>
		<td colspan="4"><input id="updateMember" type="button" value="회원정보 수정"></td>
	</tr>
	<tr>
		<td>이름: ${vo.name}</td>
		<td>재직상태 : ${vo.enabled}</td>
		<td rowspan="4">사진: ${vo.picture}</td>
	</tr>
	<tr>
		<td colspan="2">전화번호: ${vo.phone}</td>
	</tr>
	<tr>
		<td colspan="2">아이디: ${vo.id}</td>
	</tr>
	<tr>
		<td colspan="2">이메일: ${vo.email}</td>
	</tr>
	
	<tr>
		<td colspan="2">주소: ${vo.address}</td>
		<td colspan="1">등록자: ${vo.register}</td>
	
	</tr>
	<tr>
		<td colspan="2">입사일: ${vo.regdate}</td>
		<td colspan="1">권한: ${vo.authority}</td>
	</tr>
		<tr><td colspan="4"><input id="back" type="button" value="뒤로가기"></td></tr>
</table>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/JSP_GJ/js/jquery.serializejson.min.js"></script>
<script>
$(function(){
	$('#updateMember').on('click', function(){
    	  id = '${vo.id}';
    	  pwd = '${vo.pwd}';
    	  email = '${vo.email}';
    	  picture = '${vo.picture}';
    	  enabled = '${vo.enabled}';
    	  phone = '${vo.phone}';
    	  name = '${vo.name}';
    	  register = '${vo.register}';
    	  address = '${vo.address}';
    	  authority = '${vo.authority}';
    	  
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
    			url: '/JSP_GJ/updatemember',
    			data: datas,
    			type: 'post',
    			dataType: 'json',
    			success:function(res){
    				$('#updateMemberModal .fin').val("");
    				$('#updateMemberModal').modal('hide');
    				location.href="/JSP_GJ/detailmember?id="+id;
    			},
    			error: function(xhr){
    				alert("수정등록부분" + xhr.status);
    			}
    		})
    	  })
	})
	
	$('#back').on('click', function(){
		location.href="/JSP_GJ/listmember?searchType=&keyWord=&pageNo=1"
	})
})
</script>

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
           <form>
         	  <br>
         	  <input class="fin id" type="hidden" name="id"><br>
         	  <label>비밀번호</label>
         	  <input class="fin pwd" type="password" name="pwd"><br>
         	  <label>이메일</label>
         	  <input class="fin email" type="text" name="email"><br>
         	  <label>사진</label>
         	  <input calss ="fin picture" type="button" value="사진등록" name="picture"><br>
         	  <label>재직여부</label>
         	  <select name="enabled">
         	  <option value="0">퇴사</option>
         	  <option value="1" selected>재직</option>
         		<option value="2">휴직</option>
         	  </select><br>
         	  <label>휴대폰번호</label>
         	  <input class="fin phone" type="text" name="phone"><br>
         	  <label>이름</label>
         	  <input class="fin name" type="text" name="name"><br>
         	  <label>등록자</label>
         	  <input class="fin register" type="text" name="register"><br>
         	  <label>주소</label>
         	  <input class="fin address" type="text" name="address"><br>
         	  <label>권한</label>
         	  <input class="fin authority" type="text" name="authority"><br>
         	  <button type="button" id="bupdate" class="btn btn-success">수정완료</button>
           </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>