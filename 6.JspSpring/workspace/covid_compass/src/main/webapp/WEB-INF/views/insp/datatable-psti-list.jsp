<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<style>
	/* 필터링 (검색) */
	div.dataTables_filter {
		text-align : left !important;
	}

	/* 표시 건수수 설정 */
	div.dataTables_length {
		text-align : right !important;
	}
</style>

</head>
<title></title>

<body>


	<div class="#">
		<div class="card-header border-transparent"
			style="background-color: #5b6f90;">
			<div class="row">
				<div class="col-sm-12 col-md-10">
				<p class="card-title" style="color: white; font-size: 30px;">문진표 목록</p>
				</div>
				<div class="col-sm-12 col-md-1">
				</div>
				<div class="col-sm-12 col-md-1">
				</div>
			</div>
			<!-- <h3 class="card-title" style="color: white;">문진표 목록</h3>
			<div class="card-tools ">
				<button type="button" class="btn btn-tool" data-card-widget="">
					<i class="fas fa-plus" style="color: white;"> PCR키트 수량 500</i>
				</button>

			</div> -->
		</div>
		<!-- /.card-header -->
		<div class="#">
			<%@ include file="./tmpSearch.jsp" %>
			
			<div id="button-place"></div>
			
			<div class="table-responsive">
				<table id="psti-list-table" class="table m-0 hover cell-border" style="text-align: center;">
					<thead>
						<tr role="row">
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
								aria-label="Browser: activate to sort column ascending">구분</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
								aria-label="Browser: activate to sort column ascending">이름</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
								aria-sort="ascending"
								aria-label="Rendering engine: activate to sort column descending">피검자 등록일</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
								aria-label="Platform(s): activate to sort column ascending">나이</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
								aria-label="Engine version: activate to sort column ascending">생년월일</th>
							<th tabindex="0" aria-controls="example2" rowspan="1" colspan="1"
								aria-label="CSS grade: activate to sort column ascending">전화번호</th>
						</tr>
					</thead>
					<tbody>
						<%-- <c:forEach items="${pstiReadyVOList }" var="pstiReadoVO"> --%>
						<%-- <c:set var="pstiReadyVO" value="" /> --%>
						<tr onclick="OpenWindow('psti-registform?pstiInnb=${pstiReadyListVO.pstiInnb}','','800','900');" 
		            		  	   style="cursor:pointer;">
							<td>
							<span class="badge badge-${pstiReadyListVO.sttusCode eq 'A101' ? 'info':'primary' }">${pstiReadyListVO.insttNm }검사소</span></td>
							<td>${pstiReadyListVO.pstiNm }pstiNm</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
									value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
							<td>${pstiReadyListVO.age }age</td>
							<td><fmt:formatDate value="${pstiReadyListVO.birthDate }"
									pattern="yyyy-MM-dd" />1990-01-01</td>
							<td>${pstiReadyListVO.telNo }010-1234-4321</td>
						</tr>
						<%-- </c:forEach> --%>
						<tr>

							<%-- <c:forEach items="${pstiReadyVOList }" var="pstiReadoVO"> --%>
							<%-- <c:set var="pstiReadyVO" value="" /> --%>
							<td>
							<span class="badge badge-${pstiReadyListVO.sttusCode eq 'A101' ? 'info':'primary' }">${pstiReadyListVO.insttNm }검사소</span></td>
							<td>${pstiReadyListVO.pstiNm }pstiNm</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
									value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
							<td>${pstiReadyListVO.age }age</td>
							<td><fmt:formatDate value="${pstiReadyListVO.birthDate }"
									pattern="yyyy-MM-dd" />1990-01-01</td>
							<td>${pstiReadyListVO.telNo }010-1234-4321</td>
							<%-- </c:forEach> --%>
						</tr>
						<tr>

							<%-- <c:forEach items="${pstiReadyVOList }" var="pstiReadoVO"> --%>
							<%-- <c:set var="pstiReadyVO" value="" /> --%>
							<td>
							<span class="badge badge-${pstiReadyListVO.sttusCode eq 'A101' ? 'info':'primary' }">${pstiReadyListVO.insttNm }검사소</span></td>
							<td>${pstiReadyListVO.pstiNm }pstiNm</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
									value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
							<td>${pstiReadyListVO.age }age</td>
							<td><fmt:formatDate value="${pstiReadyListVO.birthDate }"
									pattern="yyyy-MM-dd" />1990-01-01</td>
							<td>${pstiReadyListVO.telNo }010-1234-4321</td>
							<%-- </c:forEach> --%>
						</tr>
						<tr>

							<%-- <c:forEach items="${pstiReadyVOList }" var="pstiReadoVO"> --%>
							<%-- <c:set var="pstiReadyVO" value="" /> --%>
							<td>
							<span class="badge badge-${pstiReadyListVO.sttusCode eq 'A101' ? 'info':'primary' }">${pstiReadyListVO.insttNm }검사소</span></td>
							<td>${pstiReadyListVO.pstiNm }pstiNm</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
									value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
							<td>${pstiReadyListVO.age }age</td>
							<td><fmt:formatDate value="${pstiReadyListVO.birthDate }"
									pattern="yyyy-MM-dd" />1990-01-01</td>
							<td>${pstiReadyListVO.telNo }010-1234-4321</td>
							<%-- </c:forEach> --%>
						</tr>
						<tr>

							<%-- <c:forEach items="${pstiReadyVOList }" var="pstiReadoVO"> --%>
							<%-- <c:set var="pstiReadyVO" value="" /> --%>
							<td>
							<span class="badge badge-${pstiReadyListVO.sttusCode eq 'A101' ? 'info':'primary' }">${pstiReadyListVO.insttNm }검사소</span></td>
							<td>${pstiReadyListVO.pstiNm }pstiNm</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
									value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
							<td>${pstiReadyListVO.age }age</td>
							<td><fmt:formatDate value="${pstiReadyListVO.birthDate }"
									pattern="yyyy-MM-dd" />1990-01-01</td>
							<td>${pstiReadyListVO.telNo }010-1234-4321</td>
							<%-- </c:forEach> --%>
						</tr>
						<tr>

							<%-- <c:forEach items="${pstiReadyVOList }" var="pstiReadoVO"> --%>
							<%-- <c:set var="pstiReadyVO" value="" /> --%>
							<td>
							<span class="badge badge-${pstiReadyListVO.sttusCode eq 'A101' ? 'info':'primary' }">${pstiReadyListVO.insttNm }검사소</span></td>
							<td>${pstiReadyListVO.pstiNm }pstiNm</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
									value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
							<td>${pstiReadyListVO.age }age</td>
							<td><fmt:formatDate value="${pstiReadyListVO.birthDate }"
									pattern="yyyy-MM-dd" />1990-01-01</td>
							<td>${pstiReadyListVO.telNo }010-1234-4321</td>
							<%-- </c:forEach> --%>
						</tr>
						<tr>

							<%-- <c:forEach items="${pstiReadyVOList }" var="pstiReadoVO"> --%>
							<%-- <c:set var="pstiReadyVO" value="" /> --%>
							<td>
							<span class="badge badge-${pstiReadyListVO.sttusCode eq 'A101' ? 'info':'primary' }">${pstiReadyListVO.insttNm }검사소</span></td>
							<td>${pstiReadyListVO.pstiNm }pstiNm</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
									value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
							<td>${pstiReadyListVO.age }age</td>
							<td><fmt:formatDate value="${pstiReadyListVO.birthDate }"
									pattern="yyyy-MM-dd" />1990-01-01</td>
							<td>${pstiReadyListVO.telNo }010-1234-4321</td>
							<%-- </c:forEach> --%>
						</tr>
						<tr>

							<%-- <c:forEach items="${pstiReadyVOList }" var="pstiReadoVO"> --%>
							<%-- <c:set var="pstiReadyVO" value="" /> --%>
							<td>
							<span class="badge badge-${pstiReadyListVO.sttusCode eq 'A101' ? 'info':'primary' }">${pstiReadyListVO.insttNm }검사소</span></td>
							<td>${pstiReadyListVO.pstiNm }pstiNm</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
									value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
							<td>${pstiReadyListVO.age }age</td>
							<td><fmt:formatDate value="${pstiReadyListVO.birthDate }"
									pattern="yyyy-MM-dd" />1990-01-01</td>
							<td>${pstiReadyListVO.telNo }010-1234-4321</td>
							<%-- </c:forEach> --%>
						</tr>
						<tr>

							<%-- <c:forEach items="${pstiReadyVOList }" var="pstiReadoVO"> --%>
							<%-- <c:set var="pstiReadyVO" value="" /> --%>
							<td>
							<span class="badge badge-${pstiReadyListVO.sttusCode eq 'A101' ? 'info':'primary' }">${pstiReadyListVO.insttNm }검사소</span></td>
							<td>${pstiReadyListVO.pstiNm }pstiNm</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
									value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
							<td>${pstiReadyListVO.age }age</td>
							<td><fmt:formatDate value="${pstiReadyListVO.birthDate }"
									pattern="yyyy-MM-dd" />1990-01-01</td>
							<td>${pstiReadyListVO.telNo }010-1234-4321</td>
							<%-- </c:forEach> --%>
						</tr>
						<tr>

							<%-- <c:forEach items="${pstiReadyVOList }" var="pstiReadoVO"> --%>
							<%-- <c:set var="pstiReadyVO" value="" /> --%>
							<td>
							<span class="badge badge-${pstiReadyListVO.sttusCode eq 'A101' ? 'info':'primary' }">${pstiReadyListVO.insttNm }검사소</span></td>
							<td>${pstiReadyListVO.pstiNm }pstiNm</td>
							<td class="dtr-control sorting_1" tabindex="0"><fmt:formatDate
									value="${pstiReadyListVO.wrtYmd }" pattern="yyyy-MM-dd" />2022-01-01</td>
							<td>${pstiReadyListVO.age }age</td>
							<td><fmt:formatDate value="${pstiReadyListVO.birthDate }"
									pattern="yyyy-MM-dd" />1990-01-01</td>
							<td>${pstiReadyListVO.telNo }010-1234-4321</td>
							<%-- </c:forEach> --%>
						</tr>
					</tbody>
				</table>

			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.card-body -->
	</div>




<script>
// 컬럼명 입력받는 곳
var col_title = [
  { title: "구분" },
  { title: "이름" },
  { title: "피검자 등록일" },
  { title: "나이" },
  { title: "생년월일" },
  { title: "전화번호" }
];

// 소트용 데이터
var sort_data = [
  { title: '검사소'},
  { title: '보건소' }
];
// Korean
var lang_kor = {
  decimal: "",
  emptyTable: "데이터가 없습니다.",
  info: "_START_ - _END_ (총 _TOTAL_ 개)",
  infoEmpty: "0개",
  infoFiltered: "(전체 _MAX_ 개 중 검색결과)",
  infoPostFix: "",
  thousands: ",",
  lengthMenu: "_MENU_ 개씩 보기",
  loadingRecords: "로딩중...",
  processing: "처리중...",
  search: "검색:",
  zeroRecords: "검색된 데이터가 없습니다.",
  paginate: {
    first: "첫 페이지",
    last: "마지막 페이지",
    next: "다음",
    previous: "이전",
  },
  aria: {
    sortAscending: " :  오름차순 정렬",
    sortDescending: " :  내림차순 정렬",
  },
};


window.onload = function(){
	var table = $("#psti-list-table").DataTable({
        columns: col_title,
        language: lang_kor,
        buttons: [
        "pdf",
        "copy",
        "excel"
        ],
        dom: 'Bti',
      });
//       $('#example_length').appendTo($('#test'));
//       $('#example_filter').appendTo($('#test'));
//       /* Column별 검색기능 추가 */ 
//       $('.dataTables_wrapper .row div').removeClass('col-sm-6').addClass('filter-bar-probada')
//       $("#example_filter").prepend(
//       '<select id="select" name="status" class="form-control input-lg dataTables_filter"></select>'
//       );
//       $.each(sort_data, function (index, item) {
//         $("#select").append("<option name='option_status'>" + item.title + "</option>");
//       });

//        $('#select').on('change', function () {
//         var colName = $('#select option:selected').val();
//         table.column(3).search(colName).draw();
//         if(colName=="진행상황") table.column().search().draw();
//       }); 
	
}
</script>

</body>
