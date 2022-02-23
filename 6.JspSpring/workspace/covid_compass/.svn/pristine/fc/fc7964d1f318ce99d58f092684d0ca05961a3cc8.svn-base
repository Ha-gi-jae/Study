<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 음성 피검자 조회 -->
<!-- search bar -->
<div class="row" style="margin: 1px;">
	<div class="col-md-6 pl-0">
		<div class="card">
			<!-- search bar -->
			<div class="card-body">
				<div class="table-responsive">
					<div class="ddoing" style="height: 650px;">
						<table class="table table-hover text-nowrap" style="text-align: center;font-size: 15px;table-layout: fixed;">
							<thead>
								<tr role="row">
									<th style="width: 15%">시료고유번호</th>
									<th style="width: 15%">성명</th>
									<th style="width: 20%">요청기관</th>
									<th style="width: 10%">요청일자</th>
									<th style="width: 10%">확정일자</th>
									<th style="width: 10%">검사결과</th>
								</tr>
							</thead>
							<tbody id="smpl-Result-list-n-table-tbody">
								<tr class="each-smpl-result-element">
									<td colspan="5" class="noSmplResultList">데이터 로딩중 입니다.</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="card-footer clearfix pb-0 pt-0" style="background-color: white;">
						<ul class="pagination justify-content-center m-0" id="inptnt-n-list-pagination-ul">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.table-responsive -->
	<!-- /.card-body -->
	<div class="col-md-6 pr-0">
	<!-- /.card-body -->
	<div class="card">
		<div class="card-body pb-0">
			<table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
					<thead>
						<tr>
							<th colspan="4" style="font-size: 17px;">
								<div class="row m-0" style="justify-content: space-between;">
									<label style="font-size: 17px; margin: 0px;">확진자 정보</label>
									<button type="button" class="btn btn-sm btn-primary enableReadRrn"  onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr class="ddoing" style="height: 12px;"></tr>
						<tr>
							<th class="col-md-2">성명</th>
							<td class="col-md-4" id="n_psti_nm"></td>
							<th class="col-md-2">국적</th>
							<td class="col-md-4" id="n_nlty"></td>
						</tr> 
						<tr class="shittr">
							<th>검사경위</th>
							<td id="n_rechkd_yn"></td>
							<th>백신접종</th>
							<td id="n_vac_code"></td>
						</tr>
						<tr class="shittr">
							<th>성별</th>
							<td id="n_gender"></td>
							<th>나이</th>
							<td id="n_age"></td>
						</tr>
						<tr class="shittr">
							<th>발열여부</th>
							<td id="n_fever_yn"></td>
							<th>임신여부</th>
							<td id="n_pregn_yn"></td>
						</tr>
						<tr class="shittr">
							<th>확정일자</th>
							<td id="n_in_ymd"></td>
							<th>결과</th>
							<td id="n_pstv_yn"></td>
						</tr>
						<tr class="shittr">
							<th class="">확진자 코드</th>
							<td id="n_cnfm_no"></td>
							<th>상태</th>
							<td id="n_sttus_code"></td>
						</tr>
						<tr class="shittr">
							<th style="vertical-align: middle; padding: 0px;padding-left: 9px;font-size: 12px;" >주민/외국인<br>등록번호</th>
							<td colspan="1" id="n_rrn"></td>
							<th>연락처</th>
							<td colspan="1" id="n_psti_telno"></td>
						</tr> 
						<tr class="shittr">
							<th>주소</th>
							<td colspan="3" id="n_psti_adres"></td>
						</tr>
						<tr class="shittr">
							<th>증상</th>
							<td colspan="3" id="n_symptms"></td>
						</tr>
					</tbody>
				</table>

				<table class="table table-bordered chckd-detail-element" style="margin-top: 12px;">
					<tbody>
						<tr>
							<th class="col-md-2">최저혈압</th>
							<td class="col-md-4" id="n_min_brssr"></td>
							<th class="col-md-2">최고혈압</th>
							<td class="col-md-4" id="n_max_brssr"></td>
						</tr>
						<tr class="shittr">
							<th>신장</th>
							<td id="n_bdheight"></td>
							<th>체중</th>
							<td id="n_bdweight"></td>
						</tr>
						<tr class="shittr">
							<th>체온</th>
							<td id="n_bdheat"></td>
							<th></th>
							<td></td>
						</tr>
					</tbody>
				</table>

				<table class="table table-bordered" style="margin-top: 12px;">
					<tbody>
						<tr>
							<th class="col-md-2">
								<strong>요청기관</strong>
							</th>
							<td class="col-md-4" id="n_inst_nm"></td>
							<th class="col-md-2">
								<strong>연락처</strong>
							</th>
							<td class="col-md-4" id="n_inst_telno"></td>
						</tr>

						<tr>
							<th>
								<strong>주소</strong>
							</th>
							<td colspan="5" id="n_inst_adres"></td>
						</tr>
					</tbody>
				</table>
				<div style="margin-bottom: 52px;"></div>
		</div>
	</div>
</div>

</div>