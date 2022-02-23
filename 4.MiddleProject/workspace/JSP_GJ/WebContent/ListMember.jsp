<%@page import="kr.or.ddit.member.vo.PagingVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title></title>
<head></head>
<body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">

<h1>회원 관리</h1>
<hr>
<form>
<select name="searchType">
<option value="name">이름</option>
<option value="id">아이디</option>
<option value="phone">전화번호</option>
<option value="email">이메일</option>
</select>
<input type="text" name="keyWord" id="keyWord">
<input type="button" id="findbutton" value="검색하기"><br>
</form>
<input id="insertmember" type="button" value="회원등록">
<input id="deletemember" type="button" value="회원삭제">

<table border="1">
	<tr class="tr1">
	
		<th><input type="checkbox" name="allchk"></th>
		<th>이름</th>
		<th>아이디</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>재직여부</th>
	</tr>
	
	<c:forEach items="${list }" var="member">
		<tr class="tr2">
			<td><input class="mem_chk" type="checkbox" name="mem_chk" value="${member.id }"></td>
			<td class="detail">${member.name }</td>
			<td>${member.id }</td>
			<td>${member.phone }</td>
			<td>${member.email }</td>
			<td>${member.enabled }</td>
		</tr>
	</c:forEach>
	
		<c:if test="${requestScope.pv.totalCount gt 0 }">
			<tr>
				<td colspan="6" align="center">
				<c:if test="${requestScope.pv.firstPageNo gt requestScope.pv.pageSize }">
				<a class="pre" name="${requestScope.pv.firstPageNo - requestScope.pv.pageSize }">[이전]</a>
				</c:if>
				
				<c:forEach var="pNo" begin="${requestScope.pv.firstPageNo }" end="${requestScope.pv.lastPageNo }" step="1" >
					<a class="page"
					<c:if test="${pNo eq requestScope.pv.currentPageNo }">
						select
					</c:if>">
					${pNo}
					</a>
				</c:forEach>
				<c:if test="${requestScope.pv.lastPageNo lt requestScope.pv.totalPageCount }">
				<a class="next" name="${requestScope.pv.firstPageNo + requestScope.pv.pageSize }">[다음]</a>
				</c:if>
				</td>
			</tr>
		</c:if>
		
</table>


 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/JSP_GJ/js/jquery.serializejson.min.js"></script>
<script>
pageNo = 1;
$(function(){
	SelectList();
	
	$(document).on('click', '.page', function(){
		pageNo = $(this).html();
		searchType = ${requestScope.pv.searchType}
		alert(searchType);
		location.href="/JSP_GJ/listmember?searchType="+${requestScope.pv.searchType} + "&keyWord=" + ${requestScope.pv.keyWord} +"pageNo=" + pageNo;
	})
	
	$(document).on('click', '.pre', function(){
		pageNo = $(this).attr('name');
		searchType = ${requestScope.pv.searchType}
		alert(searchType);
		location.href="/JSP_GJ/listmember?searchType="+${requestScope.pv.searchType} + "&keyWord=" + ${requestScope.pv.keyWord} +"pageNo=" + pageNo;
	})
	
	$(document).on('click', '.next', function(){
		pageNo = $(this).attr('name');
		searchType = ${requestScope.pv.searchType}
		alert(searchType);
		location.href="/JSP_GJ/listmember?searchType="+${requestScope.pv.searchType} + "&keyWord=" + ${requestScope.pv.keyWord} +"pageNo=" + pageNo;
	})
	
	find="";
	
	$(document).on('click', '#findbutton', function(){
		searchType = $('form option:selected').val();
		keyWord = $('#keyWord').val();
		location.href="/JSP_GJ/listmember?searchType="+searchType+"&keyWord="+keyWord +"&pageNo="+pageNo;
	})
	
	$(document).on('click', 'input[name=allchk]', function(){
		if($("input[name=allchk]").prop("checked")){
			$("input[name=mem_chk]").prop("checked", true);
		}else{
			$("input[name=mem_chk]").prop("checked", false);
		}
		
	})
	
	chk= '';
	chkList = function(){
		$("input[name=mem_chk]:checked").each(function(){
			chk += $(this).val() + ",";
		})
	}
	
	$(document).on('click', '.detail', function(){
		id = $(this). parents('.tr2').find('.mem_chk').val();
		location.href="/JSP_GJ/detailmember?id="+id;
	})
	
	$(document).on('click', '#deletemember', function(){
		chkList();
		$.ajax({
			url: '/JSP_GJ/deletemember',
			type:'post',
			data : {"chk" : chk},
			dataType: 'json',
			success : function(res){
				location.href="/JSP_GJ/listmember?searchType="+searchType+"&keyWord="+keyWord +"&pageNo="+pageNo;
			},
			error:function(xhr){
				alert("회원삭제"+xhr.status);
			}
		})
	})
	
	$(document).on('click', '#insertmember', function(){
		$('#insertMemberModal').modal('show');
	})
	
	id= '';
	$(document).on('click', '#binsert', function(){
		id = $('.id').val();
		mem_info = $('#insertMemberModal form').serialize();
		$.ajax({
			url: '/JSP_GJ/insertmember',
			type: 'post',
			data: mem_info,
			dataType: 'json',
			success:function(res){
				$('#insertMemberModal .fin').val("");
				$('#insertMemberModal').modal('hide');
				location.href="/JSP_GJ/detailmember?id="+id;
			},
			error:function(xhr){
				alert("모달 등록"+xhr.status);
			}
		})
	})
	
	$(document).on('click', '#Check', function(){
		id = $('.id').val();
		$.ajax({
			url: '/JSP_GJ/idcheck',
			type: 'post',
			data: {'id' : id},
			dataType: 'json',
			success: function(res){
				if(res.flag == "가능"){
					alert("가입 가능한 아이디입니다.");
					$('#binsert').prop('disabled', false);
				}else{
					alert("이미 존재하는 아이디 입니다.");
					$('#binsert').prop('disabled', true);
				}
			},
			error: function(xhr){
				alert("아이디중복체크"+xhr.status);
			}
		})
	})

})

SelectList = function(){
	$.ajax({
		url: '/JSP_GJ/listmember',
		type: 'get',
		data: {'pageNo' : pageNo},
		dataType: 'html',
		success:function(res){
			$('#box').html(res);
		},
		error: function(xhr){
			alert("리스트 출력"+xhr.status);
		}
	})
}

</script>

<div id="Box">

</div>

<!-- Modal -->
<div id="insertMemberModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">회원 등록</h4>
      </div>
      <div class="modal-body">
   <h3>회원 등록</h3>
           <form>
         	  <br>
         	  <label>아이디</label>
         	  <input class="fin id" type="text" name="id"><input type="button" id="Check" value="중복검사"><br>
         	  <label>비밀번호</label>
         	  <input class="fin pwd" type="password" name="pwd"><div id="pwdcheck"></div><br>
         	  <label>이메일</label>
         	  <input class="fin email" type="text" name="email"><div id="emailcheck"></div><br>
         	  <label>사진</label>
         	  <input type="button" value="사진등록" name="picture" value="noImage.jpg"><br>
         	  <input type="hidden" value="1" name="enabled">
         	  <label>입사일</label>
         	  <input class="fin regdate" type="date" name="regdate"><br>
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
         	  <button type="button" id="binsert" class="btn btn-success" disabled>등록</button>
           </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
  
  
     </div>
  </div>
</div>
</div>
</body>
