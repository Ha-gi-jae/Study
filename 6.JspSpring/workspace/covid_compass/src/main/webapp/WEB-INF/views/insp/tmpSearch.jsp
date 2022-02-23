<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="card-header with-border">
	<div id="keyword" class="card-tools" style="width: 550px;">
		<div class="input-group row">
			<!-- search bar -->

			<!-- sort num -->
			<select class="form-control col-md-3" name="perPageNum"
				id="perPageNum" onchange="list_go(1);">
				<option value="10">정렬개수</option>
				<option value="2" ${pageMaker.cri.perPageNum == 2 ? 'selected':''}>2개씩</option>
				<option value="3" ${pageMaker.cri.perPageNum == 3 ? 'selected':''}>3개씩</option>
				<option value="5" ${pageMaker.cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
			</select>

			<!-- search bar -->
			<select class="form-control col-md-3" name="searchType"
				id="searchType">
				<option value="" ${pageMaker.cri.searchType eq '' ? 'selected':''}>검색구분</option>
				<option value="i" ${pageMaker.cri.searchType eq 'i' ? 'selected':''}>아이디</option>
				<option value="n" ${pageMaker.cri.searchType eq 'n' ? 'selected':''}>이	름</option>
				<option value="p" ${pageMaker.cri.searchType eq 'p' ? 'selected':''}>전화번호</option>
				<option value="e" ${pageMaker.cri.searchType eq 'e' ? 'selected':''}>이메일</option>
			</select>
			<!-- keyword -->
			<input class="form-control" type="text" name="keyword"
				placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }" /> <span
				class="input-group-append">
				<button class="btn btn-primary" type="button" id="searchBtn"
					data-card-widget="search" onclick="">
					<i class="fa fa-fw fa-search"></i>
				</button>
			</span>
			<!-- end : search bar -->
		</div>
	</div>
</div>