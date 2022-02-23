<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>

<style>

.headlineTitle{
	font-size: 3.0rem;
	color: #008ddb;
	text-align: center;
}
.label-span{
	font-size: 3.0rem;
	color: #002d94;
}
.description{
	font-size: 2.0rem;
	color: white;
	text-align: center;	
}
.qrfooter{
	background-color: #008ddb;
	justify-content: center;
	margin-left: 20%;
	margin-right: 20%;
}
</style>
</head>

<title></title>

<body>
	<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<div class="row">
							<h3 class="card-title col-sm-10">QR문진표</h3>
						      <div class="col-sm-2" style="float: right; text-align: right;">
						        <button type="button" class="btn btn-md btn-primary" onclick="openQR();">
										출력
								</button>
						      </div>							
							</div>
						</div>
						<div id="pdfDiv">
						<div class="card-body" style="padding-bottom: 5%; padding-top: 2%;">
							<div class="row" style="justify-content: center; padding-bottom: 2%;">
								<label class="headlineTitle">${insp.instNm } 선별진료<br><span class="label-span">전자문진표 작성</span> 안내</label>
							</div>
							<div class="row" style="justify-content: center;">
								<div id="qrcode" style="border: 6px solid #002d94; padding: 10px;"></div>
							</div>
						</div>
						<div class="card-footer qrfooter" style="background-color: #008ddb; justify-content: center;">
							<div class="row" style="justify-content: center;">
								<label class="description">QR 코드 스캔 또는 URL 링크 클릭하여<br>모바일로 문진표 작성하시고 빠르게 검사 받으세요.</label>
							</div>
							<div class="row" style="justify-content: center;">
								<button type="button" class="btn btn-md btn-success description">전자문진표작성 바로가기</button>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
	</section>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
	<script>
		window.onload = function() {

			generateQR();

		}

		function generateQR() {
			
			var qrcode = new QRCode(document.getElementById("qrcode"));
			
			var url = 'http://192.168.143.14<%=request.getContextPath()%>/guest/question?inspNo=' + '${insp.inspNo}';
			
			qrcode.makeCode(url);

		}

		function savePDF() {
			//저장 영역 div id
			html2canvas($('#pdfDiv')[0], {
				//logging : true,		// 디버그 목적 로그
				//proxy: "html2canvasproxy.php",
				allowTaint : true, // cross-origin allow 
				useCORS : true, // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
				scale : 2
			// 기본 96dpi에서 해상도를 두 배로 증가

			})
					.then(
							function(canvas) {
								// 캔버스를 이미지로 변환
								var imgData = canvas.toDataURL('image/png');

								var imgWidth = 210; // 이미지 가로 길이(mm) / A4 기준 210mm
								var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
								var imgHeight = canvas.height * imgWidth
										/ canvas.width;
								var heightLeft = imgHeight;
								var margin = 0; // 출력 페이지 여백설정
								var doc = new jsPDF('p', 'mm');
								var position = 80;

								// 첫 페이지 출력
								doc.addImage(imgData, 'PNG', margin, position,
										imgWidth, imgHeight);
								heightLeft -= pageHeight;

								// 한 페이지 이상일 경우 루프 돌면서 출력
								while (heightLeft >= 20) { // 35
									position = heightLeft - imgHeight;
									position = position - 20; // -25

									doc.addPage();
									doc.addImage(imgData, 'PNG', margin,
											position, imgWidth, imgHeight);
									heightLeft -= pageHeight;
								}

								// 파일 저장
								doc.save('filename.pdf');
							});
		}		
		
		function openQR(){
			OpenWindow('<%=request.getContextPath()%>/insp/qrPage?inspNo=' + '${insp.inspNo}', 'qrPage', 900, 950); 
		}
	</script>

</body>