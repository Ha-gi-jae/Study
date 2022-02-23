<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }"/>
<c:set var="cri" value="${datMap.pageMaker.cri }"/>
<c:set var="noticeList" value="${dataMap.noticeList }"/>

<head></head>

<title></title>

<body>

	<section class="content">
		<div class="row" style="margin: 1px; margin-top: 17px;">
			<div class="col-md-12 pl-0 pr-0">
				<div class="card-header p-0 t-1">
					<div class="row mb-2">
						<div class="col-md-6">
							<!-- 탭 or 버튼 or 타이틀 -->
						</div>
						<!-- search bar -->
						<div class="col-md-6 float-right">
							<div class="input-group float-right" style="max-width: 600px; width: 300px;">
								<select class="form-control " name="searchType" id="searchType">
									<option value="" ${cri.searchType eq '' ? 'selected':''}>검색구분</option>
									<option value="whole" ${cri.searchType eq 'whole' ? 'selected':''}>전체</option>
									<option value="title" ${cri.searchType eq 'title' ? 'selected':''}>제목</option>
									<option value="content" ${cri.searchType eq 'content' ? 'selected':''}>내용</option>
								</select>

								<!-- keyword -->
								<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }" style="width: 18%; display: inline-block;" /> <span class="input-group-append">
									<button class="btn btn-primary" type="button" id="searchBtn" style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px;" data-card-widget="search" onclick="list_go(1,true)">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
								<!-- end : search bar -->
							</div>
						</div>
					</div>
				</div>
				<!-- /.card-header -->
				<div class="card-body pl-0 pr-0">
					<div class="tab-content" id="custom-tabs-three-tabContent">
						<div class="row" style="margin: 1px;">
							<div class="col-md-12 pl-0 pr-0">
								<div class="card">
									<div class="card-body">
										<div class="table-responsive">
											<div class="confirm" style="height: 650px;">
												<table class="table table-hover text-nowrap" style="text-align: center; font-size: 15px; table-layout: fixed;">
													<thead>
														<tr>
															<th>게시판 번호</th>
															<th style="width: 45%;">제목</th>
															<th>작성자</th>
															<th>작성일</th>
															<th>첨부</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${empty noticeList }">
															<td colspan="5">
																<strong>해당 내용이 없습니다.</strong>
															</td>
														</c:if>
														<c:forEach items="${noticeList}" var="notice">
															<tr style="cursor: pointer;" onclick="show_detail('${notice.noticeNo}');">
																<td>${notice.noticeNo }</td>
																<td style="text-align: left;">${notice.title}</td>
																<td>${notice.writer }</td>
																<td>
																	<fmt:formatDate value="${notice.wrtYmd}" pattern="yyyy-MM-dd" />
																</td>
																<c:if test="${notice.popUp eq 'N'}">
																	<td>
																		<span class="badge badge-danger">${notice.popUp}</span>
																	</td>
																</c:if>
																<c:if test="${notice.popUp eq 'Y'}">
																	<td>
																		<span class="badge badge-primary">${notice.popUp}</span>
																	</td>
																</c:if>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
											<div class="card-footer clearfix pb-0 pt-0" style="background-color: white;">
												<div>
													<%@ include file="/resources/js/pagination.jsp"%>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					
					
					</div>
				</div>
			</div>
		</div>
	</section>

<script>
	window.onload = function() {
		// Summernote
		$('#summernote').summernote({
			height : 120
		})
		$('#summernote').summernote('disable');
	}
	function noneHover(){
		document.getElementById('hover').style.background="white";
	}

	function show_detail(noticeNo){
		
		parent.goPage('<%=request.getContextPath()%>/insp/notice-detail?noticeNo='+noticeNo,'M020700&noticeNo='+noticeNo);
		
	}
</script>

</body>