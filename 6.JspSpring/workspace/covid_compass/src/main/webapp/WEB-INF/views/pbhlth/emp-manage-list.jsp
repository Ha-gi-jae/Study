<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head></head>
<title></title>

<body>
	<section class="content">
		<div class="row" style="margin: 1px; margin-top: 17px;">
			<div class="col-md-12 pl-0 pr-0">
				<div class="card-header p-0 t-1">
					<div class="row mb-2">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary" style="background: #1a4f72; border: 0px; width: 90px;" onclick="OpenWindow('emp-manage-registform', '', 800,395)">등록</button>
						</div>
						<!-- search bar -->
						<div class="col-md-6 float-right">
							<div class="input-group float-right" style="max-width: 600px; width: 300px;">
								<!-- search bar -->
								<select class="form-control " name="searchType" id="searchType">
									<option value="" ${pageMaker.cri.searchType eq '' ? 'selected':''}>검색구분</option>
									<option value="i" ${pageMaker.cri.searchType eq 'i' ? 'selected':''}>아이디</option>
									<option value="n" ${pageMaker.cri.searchType eq 'n' ? 'selected':''}>성 명</option>
									<option value="p" ${pageMaker.cri.searchType eq 'p' ? 'selected':''}>전화번호</option>
									<option value="e" ${pageMaker.cri.searchType eq 'e' ? 'selected':''}>이메일</option>
								</select>
								<!-- keyword -->
								<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }" style="width: 18%; display: inline-block;" /> <span class="input-group-append">
									<button class="btn btn-primary" type="button" id="searchBtn" style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px;" data-card-widget="search" onclick="">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
							<!-- end : search bar -->
						</div>
						<!-- end : search bar -->
					</div>
				</div>
				<div class="card-body pl-0 pr-0">
					<div class="tab-content" id="custom-tabs-three-tabContent">
							<%@ include file="./emp-manage-module.jsp"%>
					</div>
				</div>

			</div>
		</div>
	</section>
</body>
