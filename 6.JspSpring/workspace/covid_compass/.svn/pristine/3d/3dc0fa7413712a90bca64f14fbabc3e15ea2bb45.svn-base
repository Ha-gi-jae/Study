<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="content">
		<div style="height: 640px;">

				<div class="table-responsive">
					<table class="table table-hover text-nowrap"
						style="text-align: center;">
						<thead>
							<tr role="row">
								<th tabindex="0" aria-controls="example2" rowspan="1"
									colspan="1" aria-label="">구분</th>
								<th tabindex="0" aria-controls="example2" rowspan="1"
									colspan="1" aria-label="">성명</th>
								<th tabindex="0" aria-controls="example2" rowspan="1"
									colspan="1" aria-sort="ascending" aria-label="">문진표 작성일</th>
								<th tabindex="0" aria-controls="example2" rowspan="1"
									colspan="1" aria-label="">나이</th>
								<th tabindex="0" aria-controls="example2" rowspan="1"
									colspan="1" aria-label="">생년월일</th>
								<th tabindex="0" aria-controls="example2" rowspan="1"
									colspan="1" aria-label="">전화번호</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${empty pstiList }">
							<tr>
								<td colspan="6">
									<strong>해당 내용이 없습니다.</strong>
								</td>
							</tr>
						</c:if>
							<c:forEach items="${pstiList }" var="psti">
							<tr data-psti-no="${psti.pstiNo }" style="cursor: pointer;">
								<td><span class="badge badge-info"><c:if test="${psti.rechkdYn eq 'Y'}">재검</c:if><c:if test="${psti.rechkdYn eq 'N}">신규</c:if></span></td>
								<td>${psti.pstiNm }</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${psti.wrtYmd }" pattern="yyyy-MM-dd" /></td>
								<td>${psti.age }</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${psti.bir }" pattern="yyyy-MM-dd" /></td>
								<td>${psti.pstiTelno }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
		</div>
		<div class="card-footer clearfix" style="background-color: white;">
			<%@ include file="../template/list-footer.jsp"%>
		</div>
</section>
