<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<title>피검자 상세정보</title>

<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
<div class="row">
<div class="col-md-2"></div>
 <div class="col-md-8">
  <div class="psti-detail-element">
    <table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
						  	<thead>
								<tr>
									<th colspan="4" style="font-size: 17px;">
										<div class="row m-0" style="justify-content: space-between;">
				                    		<label style="font-size: 17px; margin: 0px;">피검자 상세정보</label>
				                    		<button type="button" class="btn btn-success btn-sm" onclick="submitHtsc();">데이터입력</button>
				                    		<button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableOpenRrn(this);" data-enable="N" data-rrn="${psti.rrn }" data-manageNo="${psti.pstiNo }">개인정보 열람</button>
				                    		<div id="hiddenRrn" style="display: none;">${psti.rrn }</div>
				                    	</div>
									</th>
								</tr>
							</thead>
						</table>
	<div class="register-card-body" style="padding: 0px;">
		<div class="card" style="padding: 10px;">
			<div class="row">
				<div class="form-group col-lg-4">
					<div class="row">
						<label for="pstiNm" class="col-sm-5 control-label text-left">성명</label>
					</div>
					<div class="row">
						<div class="col-sm-12" style="padding-left: 5px;">
							<input name="pstiNm" type="text" class="form-control" id="pstiNm" value="${psti.pstiNm}" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-4">
					<div class="row">
						<label for="nlty" class="col-sm-6 control-label text-left" style="padding-top: 0px;">국적</label>
						<div class="col-sm-12">
							<input name="nlty" type="text" class="form-control" id="nlty" value="${psti.nlty}" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-4">
					<div class="row">
						<div class="col-lg-6">
							<label for="age" class="col-sm-12 control-label text-left">나이</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="age" type="text" class="form-control" id="age" value="${psti.age}" readonly>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<label for="gender" class="col-sm-12 control-label text-left">성별</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="gender" type="text" class="form-control" id="gender" value="${psti.gender}" readonly>
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
							<input name="rrn" id="rrn" type="text" class="form-control" value="${fn:substring(psti.rrn,0,8)}******" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-4">
					<div class="row">
						<label for="pstiTelno" class="col-sm-4 control-label text-left">연락처</label>
						<div class="col-sm-12">
							<input name="pstiTelno" type="text" class="form-control" id="pstiTelno" value="${psti.pstiTelno}" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-4">
					<div class="row">
						<label for="jobCode" class="col-sm-4 control-label text-left">직업</label>
						<div class="col-sm-12">
							<input title="${psti.job }" name="jobCode" type="text" class="form-control" id="jobCode" value="${psti.job}" readonly>
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
							<input name="pstiAdres" type="text" class="form-control" id="pstiAdres" value="${psti.pstiAdres}" readonly>
						</div>
						<div id="showAdress" class="col-sm-3" style="display:none;">
							<button type="button" style="background-color: #1a4f72; border-color: #1a4f72;" onclick="adress();" class="btn btn-block btn-primary">주소 검색</button>
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
							<input name="wrtYmd" type="text" class="form-control" id="wrtYmd" value='<fmt:formatDate value="${psti.wrtYmd}" pattern="YYYY-MM-dd" />' readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-3">
					<div class="row">
						<label for="rechkdYn" class="col-sm-12 control-label text-left">검사경위</label>
						<div class="col-sm-12">
							<input name="rechkdYn" type="text" class="form-control" id="rechkdYn" value="${psti.rechkdYn}" readonly>
						</div>
					</div>
				</div>


				<div class="form-group col-lg-2">
					<div class="row">
						<label for="vacCode" class="col-sm-12 control-label text-left" style="padding-top: 0px;">백신접종</label>
						<div class="col-sm-12">
							<input name="vacCode" type="text" class="form-control" id="vacCode" value="${psti.vac}" readonly>
						</div>
					</div>
				</div>

				<div class="form-group col-lg-2">
					<div class="row">
						<label for="feverYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">발열여부</label>
						<div class="col-sm-12">
							<input name="feverYn" type="text" class="form-control" id="feverYn" value="${psti.feverYn}" readonly>
						</div>
					</div>
				</div>
				<div class="form-group col-lg-2">
					<div class="row">
						<label for="pregnYn" class="col-sm-12 control-label text-left" style="padding-top: 0px;">임신여부</label>
						<div class="col-sm-12">
							<input name="pregnYn" type="text" class="form-control" id="pregnYn" value="${psti.pregnYn}" readonly>
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
							<input name="symptms" type="text" class="form-control" id="symptms" value="${psti.symptms}" readonly>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="card pt-0 pb-0" style="padding: 10px;">
			<div class="row">
				<div id="qrPrintId" class="form-group col-lg-5">
					<div class="row" style="margin: 0 auto; float: none;">
								<div class="col-md-12 text-center" style="justify-content: center; display: flex;">
									<form name="psti-regist-form" action="${pageContext.request.contextPath }/insp/psti-regist" method="post" style="text-align: center;">
										<input type="hidden" id="pstiNo" name="pstiNo" value="${psti.pstiNo}" />
										<div id="qrBox" class="brand-link d-flex" style="height: 155px; width: 150px; background-size: cover; background-position: center; background-repeat: no-repeat;"></div>

									</form>
								</div>

							</div>
					<div class="row">
						<div class="col-sm-12">
							<input type="text" class="form-control" value="${psti.pstiNo}" readonly style="text-align: center;">
						</div>
					</div>
				</div>

				<div class="form-group col-lg-7 pt-4">
					<div class="row">
						<div class="col-lg-6">
							<label for="minBrssr" class="col-sm-12 control-label text-left" style="padding-top: 0px;"><i class="fas fa-heart"></i>&nbsp;&nbsp;최저혈압</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="minBrssr" type="number" class="form-control" id="minBrssr" value="" oninput="negativeCheck(this);">
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<label for="maxBrssr" class="col-sm-12 control-label text-left" style="padding-top: 0px;"><i class="fas fa-heart"></i>&nbsp;&nbsp;최고혈압</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="maxBrssr" type="number" class="form-control" id="maxBrssr" value="" oninput="negativeCheck(this);">
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-6">
							<label for="bdheight" class="col-sm-12 control-label text-left" style="padding-top: 4px;"><i class="fas fa-ruler-vertical"></i>&nbsp;&nbsp;신장</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="bdheight" type="number" class="form-control" id="bdheight" value="" oninput="negativeCheck(this);">
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<label for="bdweight" class="col-sm-12 control-label text-left" style="padding-top: 4px;"><i class="fas fa-weight"></i>&nbsp;&nbsp;체중</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="bdweight" type="number" class="form-control" id="bdweight" value="" oninput="negativeCheck(this);">
								</div>
							</div>
						</div>

					</div>

					<div class="row">
						<div class="col-lg-12">
							<label for="bdheat" class="col-sm-12 control-label text-left" style="padding-top: 4px;"><i class="fas fa-thermometer-half"></i>&nbsp;&nbsp;체온</label>
							<div class="row">
								<div class="col-sm-12">
									<input name="bdheat" type="number" class="form-control" id="bdheat" value="" oninput="negativeCheck(this);">
								</div>
							</div>
						</div>
					</div>


				</div>


			</div>
		</div>


	</div>

	<div class="form-group row">
		<div class="col-md-3">
			<button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" class="btn btn-block btn-primary" onclick="OpenQR('${psti.pstiNo}');">QR코드 출력</button>
		</div>
		<div class="col-md-3">
			<button id="modifysubmitbutton" onclick="modifysubmit();" style="background-color: #1a4f72; border-color: #1a4f72; display:none;" type="button" class="btn btn-block btn-primary">수정 등록</button>
			<button id="modifybutton" style="margin-top:0px; background-color: #1a4f72; border-color: #1a4f72;" type="button" onclick="modify();" class="btn btn-block btn-primary">수정</button>
		</div>
		<div class="col-md-3">
			<button id="modifycancelbutton" onclick="modifycancel();" style="background-color: #c82333; border-color: #bd2130; display: none;" type="button" class="btn btn-block btn-primary">취소</button>
			<button id="submitbutton" onclick="registsubmit();" style="margin-top:0px; background-color: #1a4f72; border-color: #1a4f72;" type="button" class="btn btn-block btn-primary">등록</button>
		</div>
		<div class="col-md-3">
			<button class="btn btn-block btn-primary" onclick="Close();" type="button" style="background-color: #c82333; border-color: #bd2130;">닫기</button>
		</div>
	</div>
</div>
</div>
<div class="col-md-2"></div>
</div>
<script>

window.onload = function(){
	
	generateQR('${psti.pstiNo}');
}

function generateQR(pstiNo){
	
	$("#qrBox").empty();
	 
	var qrcode = new QRCode(document.getElementById("qrBox"));
	var url = 'http://192.168.143.14<%=request.getContextPath()%>/common/qrInfo?pstiNo=' + pstiNo;
	if(!pstiNo) url = "";
	
	qrcode.makeCode(url);
}

function Close(){
	var check = confirm("페이지를 닫으시겠습니까?");
	if(check){
		window.close();
	}else{
		return;
	}
}

function negativeCheck(target) {
	
	const value = parseFloat(target.value);
	
	if(value < 0){
		target.value = '';
		alert('음수는 입력할 수 없습니다.');
		target.style.borderColor = 'red';
		return;
	}
	
	target.style.borderColor = '';
	
}

function minMaxCheck(){

	if(parseInt(document.getElementById('minBrssr').value) > parseInt(document.getElementById('maxBrssr').value)){
		var temp = document.getElementById('minBrssr').value;
		document.getElementById('minBrssr').value = document.getElementById('maxBrssr').value;
		document.getElementById('maxBrssr').value = temp;
		alert('최소혈압은 최대혈압보다 클 수 없습니다.');
		
		return 'N';
	}
	
	return 'Y';
}

function modify(){
	$('#pstiNm').   attr('readonly', false);
	$('#pregnYn').  attr('readonly', false);
	$('#pstiTelno').attr('readonly', false);
	$('#pstiAdres').attr('readonly', false);
	
	$('#pstiNm').   css('border', '1px solid blue');
	$('#pregnYn').  css('border', '1px solid blue');
	$('#pstiTelno').css('border', '1px solid blue');
	$('#pstiAdres').css('border', '1px solid blue');	
	
	$('#modifybutton').css('display', 'none');
	$('#modifysubmitbutton').css('display', 'inline');
	$('#submitbutton').css('display', 'none');
	$('#changeclass').removeClass('col-sm-12');
	$('#changeclass').addClass('col-sm-9');
	$('#showAdress').css('display', 'inline');
	$('#modifycancelbutton').css('display', 'inline');
	$('#bdheat').attr('readonly', true);
	$('#bdweight').attr('readonly', true);
	$('#bdheight').attr('readonly', true);
	$('#maxBrssr').attr('readonly', true);
	$('#minBrssr').attr('readonly', true);
}
function modifysubmit(){
	var pstiNm = $('#pstiNm').val();
	var pstiTelno = $('#pstiTelno').val();
	var pstiAdres = $('#pstiAdres').val();
	var pregnYn = $('#pregnYn').val();
	var pstiNo = $('#pstiNo').val();
	$.ajax({
		url : '<%=request.getContextPath()%>/insp/psti-modify',
		type: 'post',
		data : {"pstiNm" : pstiNm, "pstiTelno" : pstiTelno, "pstiAdres" : pstiAdres, "pregnYn" : pregnYn, "pstiNo" : pstiNo},
		success : function(res){
			$('#pstiNm').attr('readonly', true);
			$('#pregnYn').attr('readonly', true);
			$('#pstiAdres').attr('readonly', true);
			$('#pstiTelno').attr('readonly', true);
			
			$('#pstiNm').   css('border', '');
			$('#pregnYn').  css('border', '');
			$('#pstiTelno').css('border', '');
			$('#pstiAdres').css('border', '');	
			
			$('#changeclass').removeClass('col-sm-9');
			$('#changeclass').addClass('col-sm-12');
			$('#showAdress').css('display', 'none');
			$('#modifybutton').css('display', 'inline');
			$('#modifysubmitbutton').css('display', 'none');
			$('#modifycancelbutton').css('display', 'none');
			$('#submitbutton').css('display', 'inline');
			alert(pstiNm + "님의 정보가 성공적으로 수정되었습니다.");
			$('#bdheat').attr('readonly', false);
			$('#bdweight').attr('readonly', false);
			$('#bdheight').attr('readonly', false);
			$('#maxBrssr').attr('readonly', false);
			$('#minBrssr').attr('readonly', false);
			window.opener.parent.location.reload();
		},
		error : function(error){
			alert('error' + error.status);
		}
	})
}

function modifycancel(){
	var pstiNo = $('#pstiNo').val();
	var pstiNm = $('#pstiNm').val();
	$.ajax({
		url : '<%=request.getContextPath()%>/insp/psti-modify-cancel',
		type : 'post',
		data : {"pstiNo" : pstiNo},
		success : function(res){
			$('#pstiNm').attr('readonly', true);
			$('#pregnYn').attr('readonly', true);
			$('#pstiAdres').attr('readonly', true);
			$('#pstiTelno').attr('readonly', true);
			
			$('#pstiNm').   css('border', '');
			$('#pregnYn').  css('border', '');
			$('#pstiTelno').css('border', '');
			$('#pstiAdres').css('border', '');	
			
			$('#changeclass').removeClass('col-sm-9');
			$('#changeclass').addClass('col-sm-12');
			$('#showAdress').css('display', 'none');
			$('#modifybutton').css('display', 'inline');
			$('#modifysubmitbutton').css('display', 'none');
			$('#modifycancelbutton').css('display', 'none');
			$('#pstiNm').val(res.pstiNm);
			$('#pregnYn').val(res.pregnYn);
			$('#pstiAdres').val(res.pstiAdres);
			$('#pstiTelno').val(res.pstiTelno);
			$('#submitbutton').css('display', 'inline');
			
			alert(pstiNm +"님의 정보 수정이 취소되었습니다.");
			$('#bdheat').attr('readonly', false);
			$('#bdweight').attr('readonly', false);
			$('#bdheight').attr('readonly', false);
			$('#maxBrssr').attr('readonly', false);
			$('#minBrssr').attr('readonly', false);
		},
		error : function(error){
			alert('error'+ error.status);
		}
	})
}

function submitHtsc(){
	$('#maxBrssr').val('120');
	minBrssr = $('#minBrssr').val('80');
	bdheight = $('#bdheight').val('180');
	bdweight = $('#bdweight').val('85');
	bdheat = $('#bdheat').val('36.5');	
	
}

function registsubmit(){
	var pstiNo = $('#pstiNo').val();
	var maxBrssr = $('#maxBrssr').val();
	var minBrssr = $('#minBrssr').val();
	var bdheight = $('#bdheight').val();
	var bdweight = $('#bdweight').val();
	var bdheat = $('#bdheat').val();
	
	if(minMaxCheck() == 'N') return;
	
	if(maxBrssr == "" || maxBrssr == null|| minBrssr =="" || minBrssr == null || bdheight =="" || bdheight == null || bdweight == "" || bdweight == null || bdheat == "" || bdheat == null) {
		alert("기초검사 정보를 입력해주세요.");
		return;
	}
		
	var pstiNm = $('#pstiNm').val();
	
	var psti = {"pstiNo" : pstiNo, "maxBrssr" : maxBrssr, "minBrssr" : minBrssr, "bdheight" : bdheight, "bdweight" : bdweight, "bdheat" : bdheat}
	$.ajax({
		url : '<%=request.getContextPath()%>/rest-insp/regist-Question',
		type : 'post',
		data : psti,
		success:function(result){
			$('#pstiNm').attr('readonly', true);
			$('#pregnYn').attr('readonly', true);
			$('#pstiAdres').attr('readonly', true);
			$('#pstiTelno').attr('readonly', true);
			
			$('#pstiNm').   css('border', '');
			$('#pregnYn').  css('border', '');
			$('#pstiTelno').css('border', '');
			$('#pstiAdres').css('border', '');	
			
			$('#changeclass').removeClass('col-sm-9');
			$('#changeclass').addClass('col-sm-12');
			$('#showAdress').css('display', 'none');
			$('#modifybutton').css('display', 'inline');
			$('#modifysubmitbutton').css('display', 'none');
			$('#modifycancelbutton').css('display', 'none');
			$('#submitbutton').css('display', 'inline');
			alert(pstiNm +"님의 문진표를 성공적으로 등록하였습니다.");
			window.opener.parent.location.reload();
			window.close();
		},
		error: function(error){
			var errorCode = error.status;
			if(errorCode == '400'){
				alert("PCR키트가 없어 검사가 불가합니다.\nPCR키트를 등록해주세요.");
			}
		}
	})
	
}

function adress() {
    new daum.Postcode({
        oncomplete: function(data) {
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
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("pstiAdres").value = extraAddr;
            
            } else {
                document.getElementById("pstiAdres").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("pstiAdres").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("pstiAdres").focus();
        }
    }).open();
}
</script>
<script>

function savePDF() {
	
	
	
	console.log($('#qrPrintId')[0]);
	
	//저장 영역 div id
	html2canvas($('#qrPrintId')[0], {
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

function OpenQR(pstiNo){
	
	OpenWindow('<%=request.getContextPath()%>/common/qrPage?pstiNo=' + pstiNo, 'qrPage', 350, 500);
	
}

</script>

</body>