<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<style>
.user-list{
	height: 30px;
	margin-bottom: 2px;
}

</style>
</head>


<div id="inst-detail-tm">
<div class="delete-detail-tm">
	<div class="row" style="margin: 10px;">
		<label style="text-align: right; margin: auto;" class="col-sm-2" for="note">기관명</label>
		<div class="col-sm-6">
			<input style="width: 220px;" type="text" class="form-control" readonly value="${instNm}">
		</div>
		
		<label style="text-align: right; margin: auto;" class="col-sm-2" for="sort">구분</label>
		<div class="col-sm-4">
			<input id="division" type="text" class="form-control" readonly="readonly" value="${division}">
		</div>
	
	</div>
	
	
	<div class="row" style="margin: 10px;">
		<label style="text-align: right; margin: auto;" class="col-sm-2" for="sort">주소</label>
		<div class="col-sm-10 input-group-append">
			<input type="text" class="form-control" readonly="readonly" value="${instAdres}">
	
		</div>
	
	
	</div>
	
	<div class="row" style="margin: 10px;">
		<label style="text-align: right; margin: auto;" class="col-sm-2" for="sort">연락처</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly="readonly" value="${inst.instTelno }">
		</div>
	
		<label style="text-align: right; margin: auto;" class="col-sm-2" for="note">비고</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" readonly value="전자문진표 사용">
		</div>
	</div>
</div>
</div>
<hr style="margin: 10px;"/>
	
	
 	<div class="card-head">
		<div class="row" style="margin:0px; text-align: right;">
			<label class="col-sm-2">직원 목록</label>
		</div>
	</div>
<div style="border:1px solid #e9e9e9; width: 585px;height: 440px; overFlow : auto; ">	
	<div class="card-body pl-3" style="padding-top: 10px; padding-bottom: 10px; ">
	<div id="appendEmpListtmp">
		<div class="row">
				<div class="col-3" style="text-align: center;">
					<span><strong>이름</strong></span>
				</div>
				<div class="col-4" style="text-align: center;">
					<span><strong>아이디</strong></span>
				</div>
				<div class="col-2" style="text-align: center;">
					<span><strong>연락처</strong></span>
				</div>

				<div class="col-3" style="text-align: center;">
					<span><strong>비밀번호 초기화</strong></span>
				</div>


		</div>
		<br>
		<div class="deleteEmpListtmp">
			<div class="row">
				<div class="col-3">
					<input type="text" readonly class="form-control user-list" placeholder="홍길동1">
				</div>
				<div class="col-4">
					<input type="text" readonly class="form-control user-list" placeholder="아이디">
				</div>
				<div class="col-2" style="padding: 0px;">
					<input type="text" readonly class="form-control user-list" placeholder="010-1234-5678">
				</div>
				<div class="col-3">
					<button type="button" class="btn btn-primary user-list" style="background: #1a4f72; border-color: #1a4f72;padding-top: 3px; ">
					<span style="display: block;text-align: center; ">비밀번호</span>
					</button>
				</div>
			</div>
		</div>
	</div>
		
	</div>
</div> 
<div>
	<div class="card-footer" style="border: none; background-color:white; text-align: right; width: 50%; height: 40px; margin-left: 133px;">
		<button id="instModifyButton" onclick="modify_go()" class="btn btn-block btn-primary btn-sm s" style="background: #1a4f72; border-color: #1a4f72;padding-top: 3px;">수정</button>
	</div>

</div>


<script>
	function modify_go(){
		var instNo=document.getElementById('instModifyButton').value;
		OpenWindow("./inst-modifyForm?instNo="+instNo+"",'기관수정','668','300');
	}
	function password_reset(mberNo){
		$.ajax({
			url :'<%=request.getContextPath()%>/admin/passwordReset',
			type : 'get',
			data : {'mberNo' : mberNo},
			dataType : 'json',
			contentType: 'application/json;charset=utf-8;',
			success : function(res){
				alert(res.msg);
			},
			error : function(xhr){
				
				alert("수정 실패했습니다.");
			}
		})
		
	}
</script>



