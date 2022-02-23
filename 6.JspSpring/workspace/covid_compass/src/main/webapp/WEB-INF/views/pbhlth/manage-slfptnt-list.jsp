<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="row" style="margin: 1px">
	<div class="col-md-6 pl-0">
		<div class="card">
			<div class="card-body">
				<div class="table-responsive">
					<div class="ddoing" style="height: 650px;">
						<table class="table table-hover text-nowrap" style="text-align: center;font-size: 15px;table-layout: fixed;">
							<thead>
								<tr role="row">
									<th style="width: 15%">성명</th>
									<th style="width: 25%">연락처</th>
									<th style="width: 20%">확정일자</th>
									<th style="width: 20%">격리일</th>
									<th style="width: 20%">누적음성횟수</th>
								</tr>
							</thead>
							<tbody id="cnfrm-slf-req-list-table-tbody">
								<tr class="each-smpl-result-element">
									<td colspan="5" class="cnfmCheckList">데이터 로딩중 입니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="card-footer clearfix pb-0 pt-0" style="background-color: white;">
						<ul class="pagination justify-content-center m-0" id="inptnt-req-list-pagination-ul">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.card-body -->
	<div class="col-md-6 pr-0">
		<div class="card">
			<div class="card-body pb-0">
				<table class="table table-bordered" style="border-left-color: white; border-right-color: white; margin-bottom: 10px;">
					<thead>
						<tr>
							<th colspan="4" style="font-size: 17px;">
								<div class="row m-0" style="justify-content: space-between;">
									<label style="font-size: 17px; margin: 0px;">자가격리자 정보</label>
									<button type="button" class="btn btn-sm btn-primary enableReadRrn"  onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
								</div>
							</th>
						</tr>
					</thead>
				</table>
				<div class="tab-content" id="custom-tabs-three-tabContent">
					<div class="tab-pane fade show active" id="custom-psti-detail" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
						<div id="psti-detail-module">
							<div class="psti-detail-element">
								<div class="register-card-body" style="padding: 0px;">
									<div class="card pb-0" style="padding: 10px;">
										<div class="row">
											<div class="form-group col-lg-4">
												<div class="row">
													<label for="pstiNm" class="col-sm-5 control-label text-left">성명</label>
												</div>
												<div class="row">
													<div class="col-sm-12" style="padding-left: 5px;">
														<input name="pstiNm" type="text" class="form-control" id="slf_pstiNm" value="" readonly="readonly">
													</div>
												</div>
											</div>

											<div class="form-group col-lg-4">
												<div class="row">
													<label for="nlty" class="col-sm-6 control-label text-left" style="padding-top: 0px;">국적</label>
													<div class="col-sm-12">
														<input name="nlty" type="text" class="form-control" id="slf_nlty" value="" readonly="">
													</div>
												</div>
											</div>

											<div class="form-group col-lg-4">
												<div class="row">
													<div class="col-lg-6">
														<label for="age" class="col-sm-12 control-label text-left">나이</label>
														<div class="row">
															<div class="col-sm-12">
																<input name="age" type="text" class="form-control" id="slf_age" value="" readonly="">
															</div>
														</div>
													</div>
													<div class="col-lg-6">
														<label for="gender" class="col-sm-12 control-label text-left">성별</label>
														<div class="row">
															<div class="col-sm-12">
																<input name="gender" type="text" class="form-control" id="slf_gender" value="" readonly="">
															</div>
														</div>
													</div>

												</div>

											</div>
										</div>


										<div class="row">
											<div class="form-group col-lg-4">
												<div class="row">
													<label for="rrn" class="col-sm-12 control-label text-left">주민/외국인등록번호 </label>
												</div>
												<div class="row">
													<div class="col-sm-12" style="padding-left: 5px;">
														<input name="rrn" id="slf_rrn" type="text" class="form-control" value="" readonly="">
													</div>
												</div>
											</div>

											<div class="form-group col-lg-4">
												<div class="row">
													<label for="pstiTelno" class="col-sm-4 control-label text-left">연락처</label>
													<div class="col-sm-12">
														<input name="pstiTelno" type="text" class="form-control" id="slf_pstiTelno" value="" readonly="readonly">
													</div>
												</div>
											</div>

											<div class="form-group col-lg-2">
												<div class="row">
													<label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">발열여부</label>
													<div class="col-sm-12">
														<input name="feverYn" type="text" class="form-control" id="slf_feverYn" value="" readonly="">
													</div>
												</div>
											</div>
											<div class="form-group col-lg-2">
												<div class="row">
													<label for="pregnYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">임신여부</label>
													<div class="col-sm-12">
														<input name="pregnYn" type="text" class="form-control" id="slf_pregnYn" value="" maxlength="1" readonly="readonly">
													</div>
												</div>
											</div>

										</div>

										<div class="row">
											<div class="form-group col-lg-12">
												<div class="row">
													<label for="pstiAdres" class="col-sm-12 control-label text-left">주소</label>
												</div>
												<div class="row">
													<div id="changeclass" class="col-sm-12" style="padding-left: 5px;">
														<input name="pstiAdres" type="text" class="form-control" id="slf_pstiAdres" value="" readonly="readonly">
													</div>
													<div id="showAdress" class="col-sm-3" style="display: none;">
														<button type="button" style="background-color: #1a4f72; border-color: #1a4f72;" onclick="address_go();" class="btn btn-block btn-primary">주소 검색</button>
													</div>
												</div>
											</div>
										</div>
									</div>


									<div class="card" style="padding: 10px;">
										<div class="row">
											<div class="form-group col-lg-3">
												<div class="row">
													<label for="wrtYmd" class="col-sm-12 control-label text-left">검사일자</label>
												</div>
												<div class="row">
													<div class="col-sm-12" style="padding-left: 5px;">
														<input name="wrtYmd" type="text" class="form-control" id="slf_reqYmd" value="" readonly="">
													</div>
												</div>
											</div>

											<div class="form-group col-lg-3">
												<div class="row">
													<label for="rechkdYn" class="col-sm-12 control-label text-left">검사경위</label>
													<div class="col-sm-12">
														<input name="rechkdYn" type="text" class="form-control" id="slf_rechkdYn" value="" readonly="">
													</div>
												</div>
											</div>


											<div class="form-group col-lg-2">
												<div class="row">
													<label for="vacCode" class="col-sm-12 control-label text-left" style="padding-top: 0px;">백신접종</label>
													<div class="col-sm-12">
														<input name="vacCode" type="text" class="form-control" id="slf_vacCode" value="" readonly="">
													</div>
												</div>
											</div>

											<div class="form-group col-lg-2">
												<div class="row">
													<label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">검사결과</label>
													<div class="col-sm-12">
														<input name="feverYn" type="text" class="form-control" id="slf_pstvYn" value="" readonly="">
													</div>
												</div>
											</div>
											<div class="form-group col-lg-2">
												<div class="row">
													<label for="pregnYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">누적음성횟수</label>
													<div class="col-sm-12">
														<input name="pregnYn" type="text" class="form-control" id="slf_ngtv_cnt" value="" readonly="readonly">
													</div>
												</div>
											</div>


										</div>

										<div class="row">
											<div class="form-group col-lg-12">
												<div class="row">
													<label for="symptms" class="col-sm-12 control-label text-left">증상</label>
												</div>
												<div class="row">
													<div class="col-sm-12" style="padding-left: 5px;">
														<input name="symptms" type="text" class="form-control" id="slf_symptms" value="" readonly="">
													</div>
												</div>
											</div>
										</div>
									</div>


									<div class="card pb-0" style="padding: 10px;">
										<table class="table table-bordered">
											<tbody>
												<tr class="shittr">
													<th class="col-md-2">진료병원</th>
													<td class="col-md-4" id="slf_inst_nm"></td>
													<th class="col-md-2">진료결과</th>
													<td class="col-md-4" id="slf_dgnss_result_code"></td>
												</tr>
												<tr class="shittr" style="text-align: center;">
													<th rowspan="4" style="vertical-align: middle;">진료메모</th>
													<td colspan="3" style="height: 111px; vertical-align: middle; text-align: left;" id="slf_dgnss_note"></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-md-6"></div>
									<div class="col-md-3">
										<button id="modifysubmitbutton" onclick="modifysubmit();" style="background-color: rgb(26, 79, 114); border-color: rgb(26, 79, 114); display: none;" type="button" class="btn btn-block btn-primary">등록</button>
									</div>
									<div class="col-md-3">
										<button id="modifybutton" style="background-color: rgb(26, 79, 114); border-color: rgb(26, 79, 114); display: inline;" type="button" onclick="modify();" class="btn btn-block btn-primary">수정</button>
										<button id="modifycancellbutton" onclick="modifycancell();" style="margin-top: 0px; display: none;" type="button" class="btn btn-block btn-danger">취소</button>
									</div>
								</div>
								<form id="modifyRegist" action="self-modifyRegist">
									<input type='hidden' name="pstiNo" value="" /> 
									<input type='hidden' name="pstiNm" value="" /> 
									<input type='hidden' name="pstiTelno" value="" /> 
									<input type='hidden' name="pregnYn" value="" /> 
									<input type='hidden' name="pstiAdres" value="" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function modify() {
		alert("수정후 저장 버튼을 눌러주세요");
		$('#slf_pstiNm').attr('readonly', false);
		$('#slf_pstiTelno').attr('readonly', false);
		$('#slf_pregnYn').attr('readonly', false);
		$('#slf_pstiAdres').attr('readonly', false);
		
		$('#slf_pstiNm').    css('border', '1px solid blue');
		$('#slf_pstiTelno'). css('border', '1px solid blue');
		$('#slf_pregnYn').   css('border', '1px solid blue');
		$('#slf_pstiAdres'). css('border', '1px solid blue');
		
		$('#changeclass').removeClass('col-sm-12');
		$('#changeclass').addClass('col-sm-9');
		$('#showAdress').css('display', 'inline');
		$('#modifysubmitbutton').css('display', 'inline');
		$('#modifycancellbutton').css('display', 'inline');
		$('#modifybutton').css('display', 'none');
	}
	
	function modifycancell(){
		//alert("취소!");
		var check = confirm("수정을 취소하시겠습니까?");
		
		if(check){
			$('#slf_pstiNm').attr('readonly', true);
			$('#slf_pstiTelno').attr('readonly', true);
			$('#slf_pregnYn').attr('readonly', true);
			$('#slf_pstiAdres').attr('readonly', true);
			
			$('#slf_pstiNm').    css('border', '');
			$('#slf_pstiTelno'). css('border', '');
			$('#slf_pregnYn').   css('border', '');
			$('#slf_pstiAdres'). css('border', '');
			
			$('#changeclass').removeClass('col-sm-9');
			$('#changeclass').addClass('col-sm-12');
			$('#showAdress').css('display', 'none');
			$('#modifysubmitbutton').css('display', 'none');
			$('#modifycancellbutton').css('display', 'none');
			$('#modifybutton').css('display', 'inline');
		}else{
			return;
		}
	}
	function modifyRollBack(){
		//alert("취소!");
			$('#slf_pstiNm').attr('readonly', true);
			$('#slf_pstiTelno').attr('readonly', true);
			$('#slf_pregnYn').attr('readonly', true);
			$('#slf_pstiAdres').attr('readonly', true);

			$('#slf_pstiNm').    css('border', '');
			$('#slf_pstiTelno'). css('border', '');
			$('#slf_pregnYn').   css('border', '');
			$('#slf_pstiAdres'). css('border', '');
			
			$('#changeclass').removeClass('col-sm-9');
			$('#changeclass').addClass('col-sm-12');
			$('#showAdress').css('display', 'none');
			$('#modifysubmitbutton').css('display', 'none');
			$('#modifycancellbutton').css('display', 'none');
			$('#modifybutton').css('display', 'inline');
	}
	
	function modifysubmit(){
		
		var pstiNo = $('#modifyRegist').find("[name='pstiNo']").val();
		var pstiNm = $('#slf_pstiNm').val();
		var pstiTelno = $('#slf_pstiTelno').val();
		var pregnYn = $('#slf_pregnYn').val();
		var pstiAdres = $('#slf_pstiAdres').val();
		
		if(pstiNm == "" || pstiNm == null){
			alert("성명을 입력해주세요.");
			return false;
		}
		if(pstiTelno == "" || pstiTelno == null){
			alert("연락처를 입력해주세요.");
			return false;
		}
		if(pregnYn == "" || pregnYn == null){
			alert("임신여부를 입력해주세요.");
			return false;
		}
		if(pstiAdres == "" || pstiAdres == null){
			alert("주소를 입력해주세요.");
			return false;
		}
		
		$('#modifyRegist').find("[name='pstiNm']").val(pstiNm);
		$('#modifyRegist').find("[name='pstiTelno']").val(pstiTelno);
		$('#modifyRegist').find("[name='pregnYn']").val(pregnYn);
		$('#modifyRegist').find("[name='pstiAdres']").val(pstiAdres);
		
		var check = confirm("수정 하시겠습니까?");
		
		if(check){
			$.ajax({
			    url : '<%=request.getContextPath() %>/rest-pbht/self-modifyRegist',
			    type : 'get',
			    dataType : 'json',
			    data : $('#modifyRegist').serialize(),
			    success : function(dataMap){
		 	      	if(dataMap.result > 0){
		 	      		alert("정상적으로 수정되었습니다.");
		 	      		var checkNmId = '#' + pstiNo + 'Nm';
		 	      		$(checkNmId).html(pstiNm);
		 	      		var checkTelId = '#' + pstiNo + 'Tel';
		 	      		$(checkTelId).html(pstiTelno);
		 	      	}else{
		 	      		alert("수정에 실패하였습니다. 관리자에게 문의하시기 바랍니다.");
		 	      	}
		 	      	modifyRollBack();
			    },
			    error : function(error){
			      alert('error' + error.status);
			    }
			  })
		}else{
			return;
		}
		
		
	}
	
</script>
<script>
	//주소 API
	function address_go() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("slf_pstiAdres").value = extraAddr;

				} else {
					document.getElementById("slf_pstiAdres").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("slf_pstiAdres").value = addr + " ";
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("slf_pstiAdres").focus();
			}
		}).open();
	}
</script>
