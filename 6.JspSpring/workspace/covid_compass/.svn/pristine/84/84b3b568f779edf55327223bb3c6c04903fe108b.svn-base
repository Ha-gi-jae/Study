<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
	margin-left: 0%;
	margin-right: 0%;
}
</style>
</head>

<title>QR코드</title>

<body>
<script>
function confirmationClose(){
	
		window.close();
		
}

function generateQR(){
	
	$("#qrcode").empty();
	 
	var qrcode = new QRCode(document.getElementById("qrcode"));
	var url = 'http://192.168.143.14<%=request.getContextPath()%>/guest/question?inspNo=' + '${insp.inspNo}';

	console.log(url);
	
	qrcode.makeCode(url);
}

window.onload = function(){
	generateQR();
}

</script>


	<script type="text/javascript">
		function savePDF() {
			
			var check = confirm('qr코드를 발급하시겠습니까?');
			if(!check) return; 
			
			//저장 영역 div id
			html2canvas($('#pdfArea')[0], {
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

								var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
								var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
								var imgHeight = canvas.height * imgWidth
										/ canvas.width;
								var heightLeft = imgHeight;
								var margin = 10; // 출력 페이지 여백설정
								var doc = new jsPDF('p', 'mm');
								var position = 50;

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
		
	</script>
<section>
	<div class="row" style="margin: 1px; height: 45px; align-content: space-around">
			<div style="width: 45%;"></div>
			<div class="check" style="width: 25%;">
				<button type="button" onclick="savePDF();"style="background-color: rgb(26, 79, 114); border-color: rgb(26, 79, 114);" class="btn btn-block btn-primary">qr발급</button>
			</div>
			<div style="width: 2%;"></div>
			<div class="check" style="width: 25%;">
				<button type="button"  onclick="confirmationClose();" class="btn btn-block btn-danger">닫기</button>
			</div>
		</div>
	

	<div id="pdfArea">
		<div style="border: 1px solid black; margin: 10px; margin-top: 0;">
			<div style="border: 2px double black; margin: 10px;">
				<div style="height: 80px;"></div>				
				<div class="row" style="justify-content: center;">
					<div class="col-md-1"></div>
					<div id="pdfDiv">
						<div class="" style="justify-content: center;">
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
					<div class="col-md-1"></div>
				</div>
				
				<div class="row text-left">
				</div>
				<div class="row text-left">
				</div>
				<div class="row text-left">
				</div>
				<div class="row text-left">
				</div>
				<div style="height: 80px;"></div>
			</div>
		</div>
	</div>

</section>


</body>


