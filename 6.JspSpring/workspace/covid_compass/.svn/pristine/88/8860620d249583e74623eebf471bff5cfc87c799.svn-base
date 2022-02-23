<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
<script>
	var data = "";
	window.onload = function() {
		generateQR();
	}

	function generateQR() {
		var qrcode = new QRCode(document.getElementById("qrBox"));
		data = "PSTI04220220105000001";
		//"${pstiInnb }"
		qrcode.makeCode(data);

	}
	function decode() {
		//alert(data);
		var devalue = document.getElementById('decodetext');
		devalue.value = data;
	}
</script>

<div class="row" style="justify-content: space-around">
	<div class="">
		<form name="psti-regist-form"
			action="${pageContext.request.contextPath }/insp/psti-regist"
			method="post" style="text-align: center;">
			
			
			<input type="hidden" name="pstiInnb" value="${pstiInnb }">
			<div class="row" style="justify-content: center;">
				<div id="qrBox" class="brand-link mt-2 pb-3 mb-3 d-flex"
					style="background-size: cover; background-position: center; background-repeat: no-repeat; height: 216px;"></div>
			</div>
			<div class="input-group mb-3" style="justify-content: center;">
				<div class="login-box-msg"
					style="display: inline-block; width: 50px;">
					<i class="fas fa-qrcode fa-2x"></i>
				</div>
				<div class="col-md-6">
					<input type="text" class="form-control" name="pstiInnb"
						value="PSTI04220220105000001" readonly style="text-align: center;">
				</div>
			</div>
			<div class="row">
				<div class="input-group mb-3 col-md-1"></div>
				<div class="input-group mb-3 col-md-5">
					<div class="login-box-msg"
						style="display: inline-block; width: 50px;">
					</div>
						<i class="fas fa-heart"></i>
					<input type="number" class="form-control" name="minBrssr"
						placeholder="최저혈압 ">
				</div>
				<div class="input-group mb-3 col-md-5">
					<div class="login-box-msg"
						style="display: inline-block; width: 50px;">
						<i class="fas fa-heart"></i>
					</div>
					<input type="number" class="form-control" name="maxBrssr"
						placeholder="최고혈압 ">
				</div>
					<div class="input-group mb-3 col-md-1"></div>
			</div>
			<div class="row">
				<div class="input-group mb-3 col-md-1"></div>
				<div class="input-group mb-3 col-md-10">
					<div class="login-box-msg"
						style="display: inline-block; width: 50px;">
						<i class="fas fa-ruler-vertical"></i>
					</div>
					<input type="number" class="form-control" name="bdheight"
						placeholder="키">
				</div>
					<div class="input-group mb-3 col-md-1"></div>
			</div>

			<div class="row">
				<div class="input-group mb-3 col-md-1"></div>
				<div class="input-group mb-3 col-md-10">
					<div class="login-box-msg"
						style="display: inline-block; width: 50px;">
						<i class="fas fa-weight"></i>
					</div>
					<input type="number" class="form-control" name="bdweight"
						placeholder="몸무게">
				</div>
				<div class="input-group mb-3 col-md-1"></div>
			</div>
			<div class="row">
				<div class="input-group mb-3 col-md-1"></div>
				<div class="input-group mb-3 col-md-10">
					<div class="login-box-msg"
						style="display: inline-block; width: 50px;">
						<i class="fas fa-thermometer-half"></i>
					</div>
					<input type="number" class="form-control" name="bdheat"
						placeholder="체온">
				</div>
				<div class="input-group mb-3 col-md-1"></div>
			</div>

		</form>
		<div class="row" style="margin-bottom: 7px;">
			<div class="col-md-7"></div>
			<div class="col-md-2">
				<button style="background-color: #1a4f72; border-color: #1a4f72;"
					type="button" class="btn btn-block btn-primary btn-sm"
					onclick="psti_regist('${pstiInnb }');">등록</button>
			</div>
			<div class="col-md-2">
				<button style="background-color: #1a4f72; border-color: #1a4f72;"
					type="button" class="btn btn-block btn-primary btn-sm"
					onclick="CloseWindow();">취소</button>
			</div>
		</div>

	</div>
</div>

<script>
	function psti_regist(pstiInnb) {
		const minBrssr = $('input[name="minBrssr"]');
		const maxBrssr = $('input[name="maxBrssr"]');
		const bdheight = $('input[name="bdheight"]');
		const bdweight = $('input[name="bdweight"]');
		const bdheat = $('input[name="bdheat"]');
		if (!minBrssr.val()) {
			alert('최저혈압은 필수입니다.');
			minBrssr.focus();
			return;
		}
		if (minBrssr.val() < 0) {
			alert('최저혈압은 음수가 될 수 없습니다.');
			minBrssr.val('');
			minBrssr.focus();
			return;
		}
		if (!maxBrssr.val()) {
			alert('최고혈압은 필수입니다.');
			maxBrssr.focus();
			return;
		}
		if (maxBrssr.val() < 0) {
			alert('최고혈압은 음수가 될 수 없습니다.');
			maxBrssr.val('');
			maxBrssr.focus();
			return;
		}
		if (maxBrssr.val() < minBrssr.val()) {
			alert('최고혈압은 최저혈압보다 커야합니다.');
			return;
		}
		if (!bdheight.val()) {
			alert('키는 필수입니다.');
			bdheight.focus();
			return;
		}
		if (bdheight.val() < 0) {
			alert('키는 음수가 될 수 없습니다.');
			bdheight.val('');
			bdheight.focus();
			return;
		}
		if (!bdweight.val()) {
			alert('체중은 필수입니다.');
			bdweight.focus();
			return;
		}
		if (bdweight.val() < 0) {
			alert('체중은 음수가 될 수 없습니다.');
			bdweight.val('');
			bdweight.focus();
			return;
		}

		if (confirm('정말 등록하시겠습니까?')) {
			var form = $('form[name="psti-regist-form"]')[0];
			console.log(form);
			form.sumbit();
		}

	}
</script>