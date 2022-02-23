<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
<style></style>
</head>

<title></title>

<body>
<!-- 주소API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="row">

	<div class="card card-success">
		<div class="card-header" style="background-color: #5b6f90;">
			<h3 class="card-title">피검자상세</h3>
		</div>
		<div class="register-card-body">
			<div class="form-group row">
				<input type="hidden" name="pstiInnb" value="${pstiInnb }">
				<label for="inputEmail3" class="col-sm-4 control-label text-right" style="padding-top: 7px;">성명</label>
				<div class="col-sm-3">
					<input name="pstiNm" type="text" class="form-control" id="inputEmail3"
						value="${pstiNm }홍길동" >
				</div>
				<label for="inputEmail3" class="col-sm-2 control-label text-right" style="padding-top: 7px;">국적</label>
				<div class="col-sm-3">
					<input name="pstiNlty" type="text" class="form-control" id="inputEmail3"
						value="${pstiNlty }KOREA" readonly>
				</div>
			</div>
			<div class="form-group row">
				<input type="hidden" name="pstiInnb" value="${pstiInnb }">
				<label for="inputEmail3" class="col-sm-4 control-label text-right" style="padding-top: 7px;">검사경위</label>
				<div class="col-sm-3">
					<input name="chckReasonCode" type="text" class="form-control" id="inputEmail3"
						value="${chckReasonCode }본인판단" readonly>
				</div>
				<label for="inputEmail3" class="col-sm-2 control-label text-right" style="padding-top: 7px;">백신접종</label>
				<div class="col-sm-3">
					<input name="inoclCode" type="text" class="form-control" id="inputEmail3"
						value="${inoclCode }3차이상" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-4 control-label text-right" style="padding-top: 7px;">성명</label>
				<div class="col-sm-3">
					<input name="pstiSexdstn" type="text" class="form-control" id="inputEmail3"
						value="${pstiSexdstn }남" readonly>
				</div>
				<label for="inputEmail3" class="col-sm-2 control-label text-right">나이</label>
				<div class="col-sm-3">
					<input name="pstiAge" type="text" class="form-control" value="${pstiAge }27" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword3"
					class="col-sm-4 control-label text-right" style="padding-top: 7px;">주민/외국인등록번호</label>
				<div class="col-sm-8">
					<input name="pstiRrn" type="text" class="form-control" value="${pstiRrn }960101-1111111" readonly>
				</div>
			</div>
			
			
			
			<div class="form-group row">
				<label for="inputPassword3"
					class="col-sm-4 control-label text-right" style="padding-top: 7px;">발열여부</label>
				<div class="col-sm-3">
					<input name="pstiPyrexiaYn" type="text" class="form-control"
						id="inputPassword3" value="${pstiPyrexiaYn }Y" readonly>
				</div>
				<label for="inputPassword3"
					class="col-sm-2 control-label text-right" style="padding-top: 7px;">임신여부</label>
				<div class="col-sm-3">
					<input name="pstiPregnanYn" type="text" class="form-control"
						id="inputPassword3" value="${pstiPregnanYn }N" >
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword3"
					class="col-sm-4 control-label text-right" style="padding-top: 7px;">증상</label>
				<div class="col-sm-8">
					<input name="pstiSymptms" type="text" class="form-control"
						id="inputPassword3" value="${pstiSymptms }기침, 두통, 어지럼증" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputPassword3"
					class="col-sm-4 control-label text-right" style="padding-top: 7px;">연락처</label>
				<div class="col-sm-8">
					<input name="pstiTelno" type="text" class="form-control"
						id="inputPassword3" value="${pstiTelno }000-0000-0000" >
				</div>
			</div>

			<div class="form-group row">
				<label for="inputPassword3"
					class="col-sm-4 control-label text-right" style="padding-top: 7px;">주소</label>
				<div class="col-sm-6">
					<input name="pstiAdres" type="text" class="form-control"
						id="psti_adres" value="${pstiAdres }oo시 oo로 oo-oo 상세주소" >
				</div>
				<div class="col-sm-2">
					<button type="button" onclick="address_go();" class="btn btn-primary" style="float: right; width:100%; background-color: #5b6f90;">검색</button>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3"
					class="col-sm-4 control-label text-right" style="padding-top: 7px;">직업</label>
				<div class="col-sm-8">
					<select id="job_select" class="form-control" name="job_code">
						<option value="A">의회의원,고위임직원 및 관리자</option>
						<option value="B">전문가</option>
						<option value="C">기술공 및 준전문가</option>
						<option value="D">사무종사자</option>
						<option value="E">서비스종사자</option>
						<option value="F">판매종사자</option>
						<option value="G">농업 및 어업숙련 종사자</option>
						<option value="H">기능원 및 기능관련 종사자</option>
						<option value="I">장치,기계조작 및 조립종사자</option>
						<option value="J">단순노무 종사자</option>
						<option value="K">군인</option>
						<option value="L">(전업) 주부</option>
						<option value="M">학생</option>
						<option value="N">무직</option>
						<option value="O">기타</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3"
					class="col-sm-4 control-label text-right" style="padding-top: 7px;">작성일</label>
				<div class="col-sm-8">
					<input name="wrtYmd" type="text" class="form-control"
						id="inputPassword3" value="${wrtYmd }2022-01-05" readonly>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8"></div>
				<div class="col-sm-4">
					<button type="button" class="btn btn-primary" style="width: 100%;background-color: #5b6f90;">수정</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
//주소 API
function address_go() {
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
                document.getElementById("psti_adres").value = extraAddr;
            
            } else {
                document.getElementById("psti_adres").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("psti_adres").value = addr+" ";
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("psti_adres").focus();
        }
    }).open();
}

</script>
</body>