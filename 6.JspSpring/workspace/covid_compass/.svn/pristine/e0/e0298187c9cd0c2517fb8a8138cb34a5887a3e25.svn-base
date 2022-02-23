<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>

</head>

<title></title>

<body>
<script>
function confirmationClose(){
	
	var check = confirm("확인서발급을 종료하시겠습니까?");
	
	if(check){
		window.close();
	}
	else{
		return;
	}
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
								doc.save('filename.pdf');
							});
		}
	</script>
	<div class="form-group row pr-3" style="margin-top: 16px;">
		<div class="col-md-6"></div>
		<div class="col-md-3">
			<button type="button" onclick="savePDF();"style="background-color: rgb(26, 79, 114); border-color: rgb(26, 79, 114);" class="btn btn-block btn-primary">확인서발급</button>
		</div>
		<div class="col-md-3">
			<button type="button"  onclick="confirmationClose();" class="btn btn-block btn-danger">닫기</button>
		</div>
	</div>

	<div id="pdfArea">
		<div style="border: 1px solid black; margin: 10px;">
			<div style="border: 2px double black; margin: 10px;">
				<div style="height: 120px;"></div>
				<div class="card-body" style="text-align: center">
					<h1>코로나19 PCR검사 음성확인서</h1>
				</div>
				<div style="height: 120px;"></div>
				<div class="row text-center">
					<div class="col-md-6">
						<h4 style="display: inline;">
							<b>성&nbsp;&nbsp; 명</b>&nbsp;(성&nbsp; 별)&nbsp;&nbsp;:&nbsp;${confirmation.pstiNm}&nbsp;&nbsp;
						</h4>
						<h6 style="display: inline;">(${confirmation.gender eq 'M' ? '남' : '여' })</h6>
					</div>
					<div class="col-md-6">
						<h4>
							<b>생&nbsp;&nbsp; 년 &nbsp;&nbsp;월 &nbsp;&nbsp;일 &nbsp;&nbsp;:&nbsp;&nbsp;</b>${confirmation.bir}
						</h4>
					</div>
				</div>
				<div style="height: 150px;"></div>
				<div class="row text-left">
					<div class="col-md-1"></div>
					<div class="col-md-6">
						<h4>
							<b>검&nbsp;&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;&nbsp;일&nbsp;&nbsp;&nbsp;&nbsp;자&nbsp;&nbsp;:&nbsp;&nbsp;</b>
							<fmt:formatDate value="${confirmation.resYmd}" pattern="yyyy년  MM월  dd일"/>
						</h4>
					</div>
				</div>
				<div class="row text-left">
					<div class="col-md-1"></div>
					<div class="col-md-6">
						<h4>
							<b>검&nbsp;&nbsp;&nbsp;&nbsp;체&nbsp;&nbsp;&nbsp;&nbsp;종&nbsp;&nbsp;&nbsp;&nbsp;류&nbsp;&nbsp;:&nbsp;&nbsp;</b> 비강도말
						</h4>
					</div>
				</div>
				<div class="row text-left">
					<div class="col-md-1"></div>
					<div class="col-md-6">
						<h4>
							<b>검&nbsp;&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;&nbsp;방&nbsp;&nbsp;&nbsp;&nbsp;법&nbsp;&nbsp;:&nbsp;&nbsp;</b> PCR
						</h4>
					</div>
				</div>
				<div class="row text-left">
					<div class="col-md-1"></div>
					<div class="col-md-6">
						<h4>
							<b>검&nbsp;&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;&nbsp;결&nbsp;&nbsp;&nbsp;&nbsp;과&nbsp;&nbsp;:&nbsp;&nbsp;</b> 
							${confirmation.pstvYn eq 'N' ? '음성' : ''}
						</h4>
					</div>
				</div>
				<div style="height: 150px;"></div>
				<div class="row text-center">
					<div class="col-md-12">
						<h4>상기 인에 대한 검사결과를 위와 같이 확인합니다.</h4>
					</div>
				</div>
				<div style="height: 150px;"></div>
				<div class="row text-left">
					<div class="col-md-12 ml-3">
						<span>*&nbsp;보건소에서&nbsp;&nbsp;발급된&nbsp;&nbsp;음성확인서는&nbsp;&nbsp;「감염병예방법」&nbsp;&nbsp;제4조에&nbsp;&nbsp;따라 &nbsp;&nbsp;코로나19&nbsp;&nbsp;발생과&nbsp;&nbsp;유행방지와&nbsp;&nbsp;방역을&nbsp;&nbsp;위한&nbsp;&nbsp;국내용&nbsp;&nbsp;공익<br> &nbsp;&nbsp;목적으로&nbsp;&nbsp;한정됩니다.
						</span>
					</div>
				</div>
				<div style="height: 120px;"></div>
				<div class="row text-right" style="height: 100px;">
					<div class="col-md-8 align-self-center">
						<h4 style="display: inline;">검&nbsp;&nbsp;&nbsp;&nbsp;사&nbsp;&nbsp;&nbsp;&nbsp;기&nbsp;&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;:&nbsp;&nbsp; 대덕보건소</h4>
					</div>
					<div class="col-md-3">
						<div style="width: 100px;height: 100px; background-image: url(<%=request.getContextPath()%>/resources/image/직인.JPG);background-size: cover;"></div>
					</div>
				</div>
				<div style="height: 80px;"></div>
			</div>
		</div>
	</div>




</body>


