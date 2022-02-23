<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>

<script>
// 	window.onload = function() {
// 		generateQR();
// 	}

// 	function generateQR() {
// 		var qrcode = new QRCode(document.getElementById("qrBox"));
// 		data = "PSTI04220220105000001";
// 		//"${pstiInnb }"
// 		qrcode.makeCode(data);

// 	}
// 	function decode() {
// 		//alert(data);
// 		var devalue = document.getElementById('decodetext');
// 		devalue.value = data;
// 	}
</script>

<div class="" id="psti-detail-info-module">
	<div class="register-card-body" style="padding: 0px;">
		<div class="card" style="padding: 10px;">
			<div class="row">
				<div class="form-group col-lg-4">
					<div class="row">
						<label for="pstiNm" class="col-sm-5 control-label text-left">성명</label>
					</div>
					<div class="row">
						<div class="col-sm-12" style="padding-left: 5px;">
							<input name="pstiNm" type="text" class="form-control" id="pstiNm" value="${pstiNm }" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-4">
					<div class="row">
						<label for="nlty" class="col-sm-6 control-label text-left" style="padding-top: 0px;">국적</label>
						<div class="col-sm-12">
							<input name="nlty" type="text" class="form-control" id="nlty" value="${nlty }" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-4">
					<div class="row">
						<div class="col-lg-6">
							<label for="age" class="col-sm-12 control-label text-left">나이</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="age" type="text" class="form-control" id="age" value="${age }" readonly>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<label for="gender" class="col-sm-12 control-label text-left">성별</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="gender" type="text" class="form-control" id="gender" value="${gender }" readonly>
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
							<input name="rrn" id="rrn" type="text" class="form-control" value="${rrn }" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-4">
					<div class="row">
						<label for="pstiTelno" class="col-sm-4 control-label text-left">연락처</label>
						<div class="col-sm-12">
							<input name="pstiTelno" type="text" class="form-control" id="pstiTelno" value="${pstiTelno }" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-4">
					<div class="row">
						<label for="jobCode" class="col-sm-4 control-label text-left">직업</label>
						<div class="col-sm-12">
							<input name="jobCode" type="text" class="form-control" id="jobCode" value="${jobCode }" readonly>
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
						<div class="col-sm-12" style="padding-left: 5px;">
							<input name="pstiAdres" type="text" class="form-control" id="pstiAdres" value="${pstiAdres }" readonly>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="card" style="padding: 10px;">
			<div class="row">
				<div class="form-group col-lg-3">
					<div class="row">
						<label for="wrtYmd" class="col-sm-12 control-label text-left">작성일</label>
					</div>
					<div class="row">
						<div class="col-sm-12" style="padding-left: 5px;">
							<input name="wrtYmd" type="text" class="form-control" id="wrtYmd" value="${wrtYmd }" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-3">
					<div class="row">
						<label for="rechkdYn" class="col-sm-12 control-label text-left">검사경위</label>
						<div class="col-sm-12">
							<input name="rechkdYn" type="text" class="form-control" id="rechkdYn" value="${rechkdYn }" readonly>
						</div>
					</div>
				</div>


				<div class="form-group col-lg-2">
					<div class="row">
						<label for="vacCode" class="col-sm-12 control-label text-left" style="padding-top: 0px;">백신접종</label>
						<div class="col-sm-12">
							<input name="vacCode" type="text" class="form-control" id="vacCode" value="${vacCode }" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-2">
					<div class="row">
						<label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">발열여부</label>
						<div class="col-sm-12">
							<input name="feverYn" type="text" class="form-control" id="feverYn" value="${feverYn}" readonly>
						</div>
					</div>
				</div>
				<div class="form-group col-lg-2">
					<div class="row">
						<label for="pregnYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">임신여부</label>
						<div class="col-sm-12">
							<input name="pregnYn" type="text" class="form-control" id="pregnYn" value="${pregnYn }" readonly>
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
							<input name="symptms" type="text" class="form-control" id="symptms" value="${symptms }" readonly>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="card pt-0 pb-0" style="padding: 10px;">
			<div class="row">
				<div class="form-group col-lg-5">
					<div class="row">
						<form name="psti-regist-form" action="${pageContext.request.contextPath }/insp/psti-regist" method="post" style="text-align: center;">
							<input type="hidden" name="pstiNo" value="${pstiNo }" />

							<div class="col-md-12">
								<div id="qrBox" class="brand-link mt-2 pb-3 mb-3 d-flex" style="height: 155px; margin-left: 25px; background-size: cover; background-position: center; background-repeat: no-repeat;"></div>
							</div>
						</form>

					</div>
					<div class="row">
						<div class="col-sm-10" style="padding-left: 5px;">
							<input type="text" class="form-control" name="pstiNo" value="PSTI04220220105000001" readonly style="text-align: center;">
						</div>
					</div>
				</div>

				<div class="form-group col-lg-7 pt-4">
					<div class="row">
						<div class="col-lg-6">
							<label for="inputEmail3" class="col-sm-12 control-label text-left" style="padding-top: 0px;"><i class="fas fa-heart"></i>&nbsp;&nbsp;최저혈압</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="pstiPregnanYn" type="text" class="form-control" id="inputPassword3" value="80">
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<label for="inputEmail3" class="col-sm-12 control-label text-left" style="padding-top: 0px;"><i class="fas fa-heart"></i>&nbsp;&nbsp;최고혈압</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="pstiPregnanYn" type="text" class="form-control" id="inputPassword3" value="또잉">
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<label for="inputEmail3" class="col-sm-12 control-label text-left" style="padding-top: 4px;"><i class="fas fa-ruler-vertical"></i>&nbsp;&nbsp;신장</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="pstiPregnanYn" type="text" class="form-control" id="inputPassword3" value="또잉">
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<label for="inputEmail3" class="col-sm-12 control-label text-left" style="padding-top: 4px;"><i class="fas fa-weight"></i>&nbsp;&nbsp;체중</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="pstiPregnanYn" type="text" class="form-control" id="inputPassword3" value="또잉">
								</div>
							</div>
						</div>

					</div>

					<div class="row">
						<div class="col-lg-12">
							<label for="inputEmail3" class="col-sm-12 control-label text-left" style="padding-top: 4px;"><i class="fas fa-thermometer-half"></i>&nbsp;&nbsp;체온</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="pstiPregnanYn" type="text" class="form-control" id="inputPassword3" value="또잉">
								</div>
							</div>
						</div>
					</div>


				</div>


			</div>
		</div>


	</div>

	<div class="form-group row">
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-9">
					<button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" class="btn btn-block btn-primary">QR코드 출력</button>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" class="btn btn-block btn-primary">등록</button>
		</div>
		<div class="col-md-3">
			<button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" class="btn btn-block btn-primary">수정</button>
		</div>
	</div>
</div>
