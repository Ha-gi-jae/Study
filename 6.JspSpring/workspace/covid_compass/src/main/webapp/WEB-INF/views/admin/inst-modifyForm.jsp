<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title></title>
</head>
<body>
<div class="card" style="width:650px; height:200px; margin-left:10px; margin-top: 15px;">
	<div class="card-header" style="background-color: #1a4f72">
		<h3 class="card-title"><span style="color: white">기관수정</span></h3>
	</div>
	<form role="form" action="./inst-modify" method="get">
	<div class="row" style="margin: 10px;">
			<label for="note">기관명</label>
			<div class="col-sm-4">
				<input type="text" name="instNm" class="form-control" value="${inst.instNm}">
			</div>
			<label style="margin-left:60px;" for="sort">연락처</label>
			<div class="col-sm-4">
				<input name="instTelno" type="text" class="form-control" oninput="autoHyphen(this);"  value="${inst.instTelno }">
			</div>
		</div>
		
		<div class="row" style="margin: 10px;">
			<div class="col-10">
				<label style="" for="instAdres">주소</label>
				<input type="text" id="instAdres" name="instAdres" class="form-control" value="${inst.instAdres}">
			</div>
			<div class="col-2" style="margin-top: 26px;">
				<button type="button" onclick="address_go();" class="btn btn-secondary" style="float: right; width:100%; background-color: #1a4f72;">검색</button>
			</div>
		</div>
		<div class="row">
			<div style="margin-left: 540px;">
				<input id="instNoModify" type="hidden" name="instNo" value="${inst.instNo}">
				<button type="submit" class="btn btn-primary user-list" style="background: #1a4f72; border-color: #1a4f72;padding-top: 3px; ">
					<span style="display: block;text-align: center; ">저장</span>
				</button>
			</div>
			<div  style="margin-left: 10px;">
				<button onclick="closeWind()" type="button" class="btn btn-primary user-list" style="background: #1a4f72; border-color: #1a4f72;padding-top: 3px; ">
					<span style="display: block;text-align: center; ">취소</span>
				</button>
			</div>
		</div>
	 </form>
</div>
	<script>
	function closeWind(){
		window.close();
	}
	function address_go(){
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
		                document.getElementById("instAdres").value = extraAddr;
		            
		            } else {
		                document.getElementById("instAdres").value = '';
		            }

		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById("instAdres").value = addr+" ";
		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById("instAdres").focus();
		        }
		    }).open();
	}
	
	// 연락처 하이픈 자동 입력
	const autoHyphen = (target) => {
		//alert(target.value.length);
		var targetLength = target.value.length;
		if(parseInt(targetLength) == 9){
			target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{2})(\d{3})(\d{4})$/,`$1-$2-$3`);
		}
		if(parseInt(targetLength) == 12){
			//alert("check");
			var checkTarget = target.value.substr(0,2);
			if(checkTarget == '02'){
				 target.value = target.value.replace(/-/g,'');
				 target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{2})(\d{4})(\d{4})$/,`$1-$2-$3`); 
			}else{
				 target.value = target.value.replace(/-/g,'');
				 target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{3})(\d{3})(\d{4})$/,`$1-$2-$3`);
			}
		}
		if(parseInt(targetLength) == 13){
			 target.value = target.value.replace(/-/g,'');
			 target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{3})(\d{4})(\d{4})$/,`$1-$2-$3`);
		}
		
	}
	
	</script>
</body>
</html>