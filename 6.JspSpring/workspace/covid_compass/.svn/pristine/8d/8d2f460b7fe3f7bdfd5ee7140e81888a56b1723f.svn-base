<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="row">
					<div class="col-md-6">
					<ul class="nav nav-pills ml-auto pt-0 pl-2 pr-2 pb-2" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="custom-res-smple-pstv-all-list-tab" data-toggle="pill" href="#custom-res-smple-pstv-all-list" role="tab" aria-controls="custom-tabs-three-all" aria-selected="true">검사 결과 목록</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="custom-res-smple-pstv-y-list-tab" data-toggle="pill" href="#custom-res-smple-pstv-y-list" role="tab" aria-controls="custom-tabs-three-y" aria-selected="false">양성 판정 목록</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="custom-res-smple-pstv-n-list-tab" data-toggle="pill" href="#custom-res-smple-pstv-n-list" role="tab" aria-controls="custom-tabs-three-n" aria-selected="false">음성 판정 목록</a>
						</li>
					</ul>
					</div>
							<!-- search bar -->
							<div class="col-md-6 float-right">
							<div class="input-group float-right" style="max-width: 600px; width: 300px;">
								<!-- search bar -->
								<select class="form-control " name="searchType" id="searchType">
									<option value="" ${pageMaker.cri.searchType eq '' ? 'selected':''}>검색구분</option>
									<option value="smpl" ${pageMaker.cri.searchType eq 'smpl' ? 'selected':''}>시료번호</option>
									<option value="inst" ${pageMaker.cri.searchType eq 'inst' ? 'selected':''}>요청기관</option>
									<option value="name" ${pageMaker.cri.searchType eq 'name' ? 'selected':''}>성 명</option>
									<option value="tel" ${pageMaker.cri.searchType eq 'tel' ? 'selected':''}>전화번호</option>
								</select>
				

								<!-- keyword -->
								<input id="keywordId"class="form-control" type="text" name="keyword" value="${pageMaker.cri.keyword }" style="width: 18%; display: inline-block;" /> <span class="input-group-append">
									<button class="btn btn-primary" type="button" id="searchBtn" style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px;" 
									data-card-widget="search" onclick="list_go_check();">
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
					<div class="tab-pane fade show active" id="custom-res-smple-pstv-all-list" role="tabpanel" aria-labelledby="custom-tabs-three-all-tab">
						<%@ include file="./res-smple-pstv-all-list.jsp"%>
					</div>

					<div class="tab-pane fade" id="custom-res-smple-pstv-y-list" role="tabpanel" aria-labelledby="custom-tabs-three-y-tab">
						<%@ include file="./res-smple-pstv-y-list.jsp"%>
					</div>

					<div class="tab-pane fade" id="custom-res-smple-pstv-n-list" role="tabpanel" aria-labelledby="custom-tabs-three-n-tab">
						<%@ include file="./res-smple-pstv-n-list.jsp"%>
					</div>
				</div>
			</div>
			<!-- /.card -->
		</div>
		</div>
	</section>
</body>
