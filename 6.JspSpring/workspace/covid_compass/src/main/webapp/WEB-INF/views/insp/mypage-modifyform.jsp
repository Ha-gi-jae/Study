<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title></title>

<head></head>

<body>
<div class="wrapper">
			<div class="card-primary">
			  <div class="card-header" style="background-color: #5b6f90;">
			    <h3 class="card-title">내 정보 수정</h3>
			  </div>
			  <!-- /.card-header -->
			  <!-- form start -->
			  <form>
			  
			  <div class="card-body">
			    
			    <div class="row" style="margin-bottom: 20px;">
			        <label for="mber_id" class="col-md-2 text-right" style="padding-top: 7px;">소속기관</label>
				      <div class="col-md-3">
				        <input type="text" class="form-control" id="mber_id" value="대덕검사소" readonly>
				      </div>
			      
			        <label for="mber_id" class="col-md-2 text-right" style="padding-top: 7px;">소속번호</label>
				      <div class="col-md-4">
				        <input type="text" class="form-control" id="mber_id" value="A12345" readonly>
				      </div>
			    </div>
			    
			    <div class="row" style="margin-bottom: 20px;">
			        <label for="mber_nm" class="col-md-2 text-right" style="padding-top: 7px;">성명</label>
				      <div class="col-md-3">
				        <input type="text" class="form-control" id="mber_id" value="홍길동" readonly>
				      </div>
			      
			        <label for="mber_birth" class="col-md-2 text-right" style="padding-top: 7px;">생년월일</label>
				      <div class="col-md-4">
				        <input type="date" class="form-control" id="mber_birth" value="2022-01-06" readonly>
				      </div>
			    </div>
			    
			    <div class="row" style="margin-bottom: 20px;">
			        <label for="mber_telno" class="col-md-2 text-right" style="padding-top: 7px;">연락처</label>
				      <div class="col-md-3">
				        <input type="text" class="form-control" id="mber_id" value="010-1234-5678" maxlength="13">
				      </div>
			      
			        <label for="mber_email" class="col-md-2 text-right" style="padding-top: 7px;">이메일</label>
				      <div class="col-md-4">
				        <input type="text" class="form-control" id="mber_birth" value="ddit@ddit.or.kr">
				      </div>
			    </div>

				<div class="row" style="margin-bottom: 20px;">
			        <label for="mber_adres" class="col-md-2 text-right">주소</label>
			          <div class="col-md-7">
			            <input type="text" class="form-control" id="mber_adres" id="mber_adres" value="대전 중구 계룡로 846">
			          </div>
			          <div class="col-md-2">
			          <button type="button" onclick="address_go();" class="btn btn-block btn-secondary" style="background-color: #5b6f90;">주소검색</button>
			          </div>
			   </div>
			   
			    <div class="row">
				    <div class="col-md-7"></div>
				    
				    <div class="col-md-2">
				   		<button type="button" class="btn btn-block btn-secondary" style="background-color: #5b6f90;">취소</button>
				    </div>
				    <div class="col-md-2">
				   		<button type="button" class="btn btn-block btn-secondary" style="background-color: #5b6f90;">수정</button>
				    </div>
			    </div>
			    
			 </div>
			    <!-- /.card-body -->
			    
					<input type="hidden" value="아이디">
			  </form>
			</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
                document.getElementById("mber_adres").value = extraAddr;
            
            } else {
                document.getElementById("mber_adres").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("mber_adres").value = addr+",";
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("mber_adres").focus();
        }
    }).open();
}
</script>
</body>