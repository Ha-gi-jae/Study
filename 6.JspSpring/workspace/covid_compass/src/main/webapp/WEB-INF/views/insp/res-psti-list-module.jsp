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
									style="width: 10%" colspan="1" aria-label="">성명</th>
								<th tabindex="0" aria-controls="example2" rowspan="1"
									style="width: 20%" colspan="1" aria-label="">검사일자</th>
								<th tabindex="0" aria-controls="example2" rowspan="1"
									style="width: 10%" colspan="1" aria-sort="ascending"
									aria-label="">나이</th>
								<th tabindex="0" aria-controls="example2" rowspan="1"
									colspan="1" aria-sort="ascending" aria-label="">백신접종</th>
								<th tabindex="0" aria-controls="example2" rowspan="1"
									colspan="1" aria-sort="ascending" aria-label="">재검여부</th>
								<th tabindex="0" aria-controls="example2" rowspan="1"
									style="width: 10%" colspan="1" aria-sort="ascending"
									aria-label="">검사결과</th>

							</tr>
						</thead>
						<tbody>

							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>3차 이상</td>
								<td>재검</td>
								<td><span class="badge badge-success">음성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>미접종</td>
								<td>신규</td>
								<td><span class="badge badge-info">양성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>1차 접종</td>
								<td>재검</td>
								<td><span class="badge badge-secondary">검사중</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>2차 접종</td>
								<td>신규</td>
								<td><span class="badge badge-info">양성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>3차 이상</td>
								<td>재검</td>
								<td><span class="badge badge-success">음성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>3차 이상</td>
								<td>재검</td>
								<td><span class="badge badge-success">음성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>미접종</td>
								<td>신규</td>
								<td><span class="badge badge-info">양성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>1차 접종</td>
								<td>재검</td>
								<td><span class="badge badge-secondary">검사중</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>2차 접종</td>
								<td>신규</td>
								<td><span class="badge badge-info">양성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>3차 이상</td>
								<td>재검</td>
								<td><span class="badge badge-success">음성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>3차 이상</td>
								<td>재검</td>
								<td><span class="badge badge-success">음성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>3차 이상</td>
								<td>재검</td>
								<td><span class="badge badge-success">음성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>3차 이상</td>
								<td>재검</td>
								<td><span class="badge badge-success">음성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>3차 이상</td>
								<td>재검</td>
								<td><span class="badge badge-success">음성</span></td>
							</tr>
							<tr data-psti="${pstiNo }">
								<td>홍길동</td>
								<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
										value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-06</td>
								<td>34</td>
								<td>3차 이상</td>
								<td>재검</td>
								<td><span class="badge badge-success">음성</span></td>
							</tr>

						</tbody>
					</table>
				</div>
		</div>
		<div class="card-footer clearfix" style="background-color: white;">
			<%@ include file="../template/list-footer.jsp"%>
		</div>
</section>
