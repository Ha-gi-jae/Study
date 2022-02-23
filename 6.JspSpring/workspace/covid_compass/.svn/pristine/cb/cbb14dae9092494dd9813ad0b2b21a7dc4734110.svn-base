<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head></head>

<title>키트조회</title>

<body>
<c:set var="pcrKitList" value="${dataMap.pcrKitList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />

<script>
function submitbutton(){
	var inputCnt = $('#inputCnt').val();

	if(inputCnt == ""){
		alert("등록할 키트 수량을 입력해주세요.");
		return;
	}
	var parseCnt = parseInt(inputCnt); 
	
	if(parseCnt <= 0){
		alert("키트는 추가등록만 가능합니다.");
		return;
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-insp/registKit',
		data : {"inputCnt" : inputCnt},
		type: 'post',
		success : function(res){
			alert("키트가 성공적으로 등록되었습니다.");
			window.opener.parent.location.reload();
			location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
	})
}
</script>
	<div class="card card-success">
		<div class="register-card-body pb-0"> 
		<div class="card-header" style="background-color: #1a4f72; color:white;">
			<h3 class="card-title">PCR키트 등록</h3>
		</div>
				<form>
		<div class="card-body ">
			<div class="row">
			 <div class="col-md-1"></div>
          <div class="col-md-6">
            <i class="fas fa-medkit fa-3x" style="color: #1a4f72;"></i> <span class="col-md-2" style="font-size: 36px; color: #6c757d;">${kitCount }</span>
          </div>
          <div class="input-group col-md-4 pr-0 pl-0" style="margin-top: 10px;">
            <input class="form-control" type="number" name="inputCnt" id="inputCnt" placeholder="" /> <span class="input-group-append col-sm-4 pl-0">
              <button type="button" onclick="submitbutton();" class="btn btn-block btn-primary btn-sm" style="height: 31px; background: #1a4f72; color: #ffffff; border-color: #1a4f72;">등록</button>
            </span>
          </div>
          <div class="col-md-1"></div>
				
				
			</div>
		</div>
				</form>
		<div class="card-header" style="background-color: #1a4f72; color:white;">
			<h3 class="card-title">사용현황</h3>
		</div>
		<div class="card-body pl-0 pr-0">
			<div class="table-responsive">
				<table class="table m-0 table-sm" style="text-align: center;">
					<thead>
						<tr role="row">
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" class="col-md-4" aria-label="Browser: activate to sort column ascending">누적수량</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" class="col-md-4" aria-label="Browser: activate to sort column ascending">사용수량</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" class="col-md-4" aria-label="Platform(s): activate to sort column ascending">사용률</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${totalKitCount }</td>
							<td>${usekit }</td>
							<td><fmt:formatNumber value='${useper }' pattern="0.0"/>%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="card-header" style="background-color: #1a4f72; color:white;">
			<h3 class="card-title">등록내역</h3>
		</div>
		
		<div class="card-body pl-0 pr-0">
		<div class="ddoing" style="height: 155px;">
			<div class="table-responsive">
				<table class="table m-0 table-sm" style="text-align: center;">
					<thead>
						<tr role="row">
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" class="col-md-4" aria-label="Browser: activate to sort column ascending">이름</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" class="col-md-4" aria-label="Platform(s): activate to sort column ascending">수량</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1" class="col-md-4" aria-label="Browser: activate to sort column ascending">등록일</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty pcrKitList }">
						<tr>
							<td colspan="3">데이터가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty pcrKitList }">
					<c:forEach items="${pcrKitList }" var="kit">
						<tr>
							<td>${kit.mberNm}</td>
							<td>${kit.inputCnt}</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate value="${kit.inputYmd }" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /.card-body -->
		</div>
			<div class="card-footer" style="text-align: center; background: white;">
			<ul class="pagination justify-content-center m-0">
			<li class="page-item">
				<a class="page-link" href="javascript:list_go(1);">
					<i class="fas fa-angle-double-left" style="color:#1a4f72;"></i>
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="javascript:list_go(${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page});">
					<i class="fas fa-angle-left" style="color:#1a4f72;"></i>
				</a>
			</li>
			
			<c:if test="${empty pageMaker}">
				<li class="page-item active">
					<a class="page-link" href="javascript:list_go(1);" style="color: white;">1</a>
				</li>
			</c:if>
			
			<c:if test="${!empty pageMaker }">
			<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<li class="page-item ${pageMaker.cri.page == pageNum?'active':'' }">
					<a class="page-link" href="javascript:list_go(${pageNum });" style="${pageMaker.cri.page == pageNum? 'color: white' : 'color:#1a4f72'}">${pageNum }</a>
				</li>
			</c:forEach>
			</c:if>
			
			<li class="page-item">
				<a class="page-link" href="javascript:list_go(${pageMaker.next ? pageMaker.endPage + 1 : pageMaker.cri.page});">
					<i class="fas fa-angle-right" style="color:#1a4f72;"></i>
				</a>
			</li>
			
			<li class="page-item">
				<a class="page-link" href="javascript:list_go(${pageMaker.realEndPage });">
					<i class="fas fa-angle-double-right" style="color:#1a4f72;"></i>
				</a>
			</li>
		</ul>
		</div>
	</div>
	</div>
	<div class="col-md-3 float-right">
			<button class="btn btn-block btn-primary" onclick="Close();" type="button" style="background-color: #c82333; border-color: #bd2130;">닫기</button>
	</div>
<form id="jobForm">
	<input type="hidden" name="page" value=""/>
	<input type="hidden" name="perPageNum" value=""/>
</form>
<script>

function Close(){
	var check = confirm("페이지를 닫으시겠습니까?");
	if(check){
		window.close();
	}else{
		return;
	}
}
function list_go(page,url){
	if(!url) url = "pcrKitForm";
	
	var jobForm=$('#jobForm');
	
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	
	jobForm.attr({
		action:url,
		method:'get'
	}).submit();
}
</script>
</body>