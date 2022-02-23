<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- 진료 신청 목록 -->
<div class="row" style="margin: 1px;">
	<div class="col-md-6 pl-0">
		<div class="card">
			<div class="card-body">
				<div class="table-responsive">
					<div class="ddoing" style="height: 650px;">
						<table class="table table-hover text-nowrap" style="text-align: center;">
							<thead>
								<tr role="row">
									<th style="width: 15%">확진자 코드</th>
									<th style="width: 15%">성명</th>
									<th style="width: 20%">진료 기관</th>
									<th style="width: 15%">요청일자</th>
								</tr>
							</thead>
							<tbody id="cnfrm-dgnss-req-list-table-tbody">
								<tr class="each-smpl-result-element">
									<td colspan="5" class="dgnssList">데이터 로딩중 입니다.</td>
								</tr>
							</tbody>
						</table>

					</div>
					<!-- /.table-responsive -->
					<div class="card-footer clearfix pb-0 pt-0" style="background-color: white;">
						<ul class="pagination justify-content-center m-0" id="inptnt-req-list-pagination-ul">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 pr-0">
		<!-- /.card-body -->
		<div class="card">
			<div class="card-body">
				<table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
					<thead>
						<tr>
							<th colspan="4" style="font-size: 17px;">
								<div class="row m-0" style="justify-content: space-between;">
									<label style="font-size: 17px; margin: 0px;">확진자 진료신청 정보</label>
									<button type="button" class="btn btn-sm btn-primary enableReadRrn"  onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr class="ddoing" style="height: 12px;"></tr>
						<tr>
							<th class="col-md-3">성명</th>
							<td class="col-md-4" id="r_psti_nm"></td>
							<th class="col-md-2">국적</th>
							<td class="col-md-5" id="r_nlty"></td>
						</tr>
						<tr class="shittr">
							<th>검사경위</th>
							<td id="r_rechkd_yn"></td>
							<th>백신접종</th>
							<td id="r_vac_code"></td>
						</tr>
						<tr class="shittr">
							<th>성별</th>
							<td id="r_gender"></td>
							<th>나이</th>
							<td id="r_age"></td>
						</tr>
						<tr class="shittr">
							<th>발열여부</th>
							<td id="r_fever_yn"></td>
							<th>임신여부</th>
							<td id="r_pregn_yn"></td>
						</tr>
						<tr class="shittr">
							<th>확정일자</th>
							<td id="r_in_ymd"></td>
							<th>결과</th>
							<td id="r_pstv_yn"></td>
						</tr>
						<tr class="shittr">
							<th>확진자 코드</th>
							<td id="r_cnfm_no"></td>
							<th>상태</th>
							<td id="r_sttus_code"></td>
						</tr>
						<tr class="shittr">
							<th>주민/외국인등록번호</th>
							<td id="r_rrn" colspan="3"></td>
						</tr>
						<tr class="shittr">
							<th>주소</th>
							<td id="r_psti_adres" colspan="3"></td>
						</tr>
						<tr class="shittr">
							<th>연락처</th>
							<td id="r_psti_telno" colspan="3"></td>
						</tr>
						<tr class="shittr">
							<th>증상</th>
							<td id="r_symptms" colspan="3"></td>
						</tr>
						<tr class="shittr">
							<th>진료기관</th>
							<td id="r_inst_nm" colspan=></td>
							<th>요청 상태</th>
							<td id="r_dgnss_code" colspan=></td>
						</tr>
						<tr class="shittr">
							<th>진료기관 주소</th>
							<td id="r_inst_adres" colspan="3"></td>
						</tr>
						<tr class="shittr">
							<th>연락처</th>
							<td id="r_inst_telno"></td>
							<th>요청 일자</th>
							<td id="r_req_ymd"></td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: center; margin-bottom: 24px; margin-top: 10px;">
					<button id="cancleButton" onclick="cancleGo(this);" data-dgnss-no="" data-manage-no="" data-hspt-no="" class="btn btn-success btn-sm" style="width: 50%; height: 35px; background: #1a4f72; border: #1a4f72;">진료신청 취소</button>
				</div>
				<div style="margin-bottom: 56px;"></div>
			</div>
		<script>
			function cancleGo(button){
				
				var check = confirm("진료신청을 취소하시겠습니까?");
				
				var dgnssNo = $(button).attr('data-dgnss-no');
				var manageNo = $(button).attr('data-manage-no');
				var hsptNo = $(button).attr('data-hspt-no');
				
				if(check){
					$.ajax({
					    url : '<%=request.getContextPath()%>/rest-pbht/req-cancle-regist',
					    type : 'get',
					    dataType : 'json',
					    data : {'dgnssNo':dgnssNo, 'manageNo':manageNo, 'hsptNo':hsptNo},
					    success : function(dataMap){
					 		
				 	      	alert("정상적으로 진료신청을 취소하였습니다.");
				 	      	
							$('#custom-cnfrm-dgnss-regist-list-tab').click();
					    },
					    error : function(error){
					      alert('error' + error.status);
					    }
					  })
				};
				
				
// 				console.log('before');
// 				console.log($('#custom-cnfrm-dgnss-regist-list-tab')[0]);
// 				console.log('after');
				
// 				$('#jobForm').find("[name='typeCode']").val("A104");
				
// 				templateId = '#cnfrm-dgnss-req-list-template'
// 				targetId = "#cnfrm-dgnss-req-list-table-tbody";
// 				pagenationId = "#inptnt-req-list-pagination-ul";
// 				page = 1;
// 				list_go(url, page, targetId, pagenationId, templateId);


				
			}		
		
		</script>	
		</div>

	</div>
</div>






