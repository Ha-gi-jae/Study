<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>

</head>

<title>QR코드</title>

<body>
<script>
function confirmationClose(){
	
	var check = confirm("qr코드 발급을 종료하시겠습니까?");
	
	if(check){
		window.close();
	}
	else{
		return;
	}
}

function generateQR(pstiNo){
	
	$("#qrBox").empty();
	 
	var qrcode = new QRCode(document.getElementById("qrBox"));
	var url = 'http://192.168.143.14<%=request.getContextPath()%>/common/qrInfo?pstiNo=' + pstiNo;
	if(!pstiNo) url = "";
	
	qrcode.makeCode(url);
}

window.onload = function(){
	generateQR('${pstiNo}');
}

</script>


	<script type="text/javascript">
		function savePDF() {
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
								var position = 10;

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
								doc.save('qrcode-${pstiNo}.pdf');
							});
		}
		
	</script>
<section>
	<div class="row" style="margin: 1px; height: 45px; align-content: space-around">
			<div style="width: 45%;"></div>
			<div class="check" style="width: 25%;">
				<button type="button" onclick="savePDF();"style="background-color: rgb(26, 79, 114); border-color: rgb(26, 79, 114);" class="btn btn-block btn-primary">qr인쇄</button>
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
				<div class="row">
					<div class="col-lg-3"></div>
					<div id="qrPrintId" class="form-group col-lg-6">
					<div class="row" style="margin: 0 auto; float: none;">
								<div class="col-md-12 text-center" style="justify-content: center; display: flex;">
									<form style="text-align: center;">
										<input type="hidden" id="pstiNo" name="pstiNo" value="${pstiNo}" />
										<div id="qrBox" class="brand-link d-flex" style="height: 130px; width: 130px; background-size: cover; background-position: center; background-repeat: no-repeat;"></div>

									</form>
								</div>

							</div>
					<div class="row">
						<div style="width: 30%;"></div>
						<div style="width: 40%;">
							<input type="text" class="form-control" value="${pstiNo}" readonly style="text-align: center;">
						</div>
						<div style="width: 30%;"></div>
					</div>
					</div>
					<div class="col-lg-3"></div>
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


