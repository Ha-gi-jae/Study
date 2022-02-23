<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head></head>
<title></title>

<body>

	<div class="content-wrapper" style="background: #ffffff;">
		<div class="card card-success">
		<div class="card-header" style="background-color: #5b6f90;">
			<h3 class="card-title">병상신청 완료목록</h3>
		</div>
		<div class="card-body">
			<div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="dt-buttons btn-group flex-wrap">
							<button class="btn btn-secondary buttons-copy buttons-html5"
								tabindex="0" aria-controls="example1" type="button">
								<span>Copy</span>
							</button>
							<button class="btn btn-secondary buttons-csv buttons-html5"
								tabindex="0" aria-controls="example1" type="button">
								<span>CSV</span>
							</button>
							<button class="btn btn-secondary buttons-excel buttons-html5"
								tabindex="0" aria-controls="example1" type="button">
								<span>Excel</span>
							</button>
							<button class="btn btn-secondary buttons-pdf buttons-html5"
								tabindex="0" aria-controls="example1" type="button">
								<span>PDF</span>
							</button>
							<button class="btn btn-secondary buttons-print" tabindex="0"
								aria-controls="example1" type="button">
								<span>Print</span>
							</button>
							<div class="btn-group">
								<button
									class="btn btn-secondary buttons-collection dropdown-toggle buttons-colvis"
									tabindex="0" aria-controls="example1" type="button"
									aria-haspopup="true" aria-expanded="false">
									<span>Column visibility</span>
								</button>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-6">
						<div id="example1_filter" class="dataTables_filter">
							<p align="right">검색 :&nbsp;&nbsp;<label><input type="search"
								class="form-control form-control-sm" placeholder=""
								aria-controls="example1"></label></p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table id="example1"
							class="table table-bordered table-striped dataTable dtr-inline"
							role="grid" aria-describedby="example1_info">
							<thead>
								<tr role="row">
									<th class="sorting sorting_asc" tabindex="0"
										aria-controls="example1" rowspan="1" colspan="1"
										aria-sort="ascending"
										aria-label="Rendering engine: activate to sort column descending">확진자 번호</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending"
										style="">검사결과</th>
										<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Browser: activate to sort column ascending"
										style="">확진자 이름</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Platform(s): activate to sort column ascending"
										style="">검사결과일자</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="Engine version: activate to sort column ascending"
										style="">배정 병원</th>
									<th class="sorting" tabindex="0" aria-controls="example1"
										rowspan="1" colspan="1"
										aria-label="CSS grade: activate to sort column ascending"
										style="">배정 일자</th>
								</tr>
							</thead>
							<tbody">

								<tr class="even" style="background-color: white;">
									<td class="dtr-control sorting_1" tabindex="0">A0101</td>
									<td style="">양성</td>
									<td style="">손흥민</td>
									<td style="">2022-01-05</td>
									<td style="">런던 병원</td>
									<td style="">2022-01-05</td>
								</tr>
								<tr class="even" style="background-color: white;">
									<td class="dtr-control sorting_1" tabindex="0">A0101</td>
									<td style="">양성</td>
									<td style="">손흥민</td>
									<td style="">2022-01-05</td>
									<td style="">런던 병원</td>
									<td style="">2022-01-05</td>
								</tr>
								<tr class="even" style="background-color: white;">
									<td class="dtr-control sorting_1" tabindex="0">A0101</td>
									<td style="">양성</td>
									<td style="">손흥민</td>
									<td style="">2022-01-05</td>
									<td style="">런던 병원</td>
									<td style="">2022-01-05</td>
								</tr>
								<tr class="even" style="background-color: white;">
									<td class="dtr-control sorting_1" tabindex="0">A0101</td>
									<td style="">양성</td>
									<td style="">손흥민</td>
									<td style="">2022-01-05</td>
									<td style="">런던 병원</td>
									<td style="">2022-01-05</td>
								</tr>
								<tr class="even" style="background-color: white;">
									<td class="dtr-control sorting_1" tabindex="0">A0101</td>
									<td style="">양성</td>
									<td style="">손흥민</td>
									<td style="">2022-01-05</td>
									<td style="">런던 병원</td>
									<td style="">2022-01-05</td>
								</tr>
								<tr class="even" style="background-color: white;">
									<td class="dtr-control sorting_1" tabindex="0">A0101</td>
									<td style="">양성</td>
									<td style="">손흥민</td>
									<td style="">2022-01-05</td>
									<td style="">런던 병원</td>
									<td style="">2022-01-05</td>
								</tr>
								<tr class="even" style="background-color: white;">
									<td class="dtr-control sorting_1" tabindex="0">A0101</td>
									<td style="">양성</td>
									<td style="">손흥민</td>
									<td style="">2022-01-05</td>
									<td style="">런던 병원</td>
									<td style="">2022-01-05</td>
								</tr>
								<tr class="even" style="background-color: white;">
									<td class="dtr-control sorting_1" tabindex="0">A0101</td>
									<td style="">양성</td>
									<td style="">손흥민</td>
									<td style="">2022-01-05</td>
									<td style="">런던 병원</td>
									<td style="">2022-01-05</td>
								</tr>
								<tr class="even" style="background-color: white;">
									<td class="dtr-control sorting_1" tabindex="0">A0101</td>
									<td style="">양성</td>
									<td style="">손흥민</td>
									<td style="">2022-01-05</td>
									<td style="">런던 병원</td>
									<td style="">2022-01-05</td>
								</tr>
								<tr class="even" style="background-color: white;">
									<td class="dtr-control sorting_1" tabindex="0">A0101</td>
									<td style="">양성</td>
									<td style="">손흥민</td>
									<td style="">2022-01-05</td>
									<td style="">런던 병원</td>
									<td style="">2022-01-05</td>
								</tr>
							</tbody>

						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-5">
						<div class="dataTables_info" id="example1_info" role="status"
							aria-live="polite">Showing 1 to 10 of 57 entries</div>
					</div>
					<div class="col-sm-12 col-md-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="example1_paginate">
							<ul class="pagination">
								<li class="paginate_button page-item previous disabled"
									id="example1_previous"><a href="#"
									aria-controls="example1" data-dt-idx="0" tabindex="0"
									class="page-link">Previous</a></li>
								<li class="paginate_button page-item active"><a href="#"
									aria-controls="example1" data-dt-idx="1" tabindex="0"
									class="page-link">1</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="example1" data-dt-idx="2" tabindex="0"
									class="page-link">2</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="example1" data-dt-idx="3" tabindex="0"
									class="page-link">3</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="example1" data-dt-idx="4" tabindex="0"
									class="page-link">4</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="example1" data-dt-idx="5" tabindex="0"
									class="page-link">5</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="example1" data-dt-idx="6" tabindex="0"
									class="page-link">6</a></li>
								<li class="paginate_button page-item next" id="example1_next"><a
									href="#" aria-controls="example1" data-dt-idx="7" tabindex="0"
									class="page-link">Next</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>