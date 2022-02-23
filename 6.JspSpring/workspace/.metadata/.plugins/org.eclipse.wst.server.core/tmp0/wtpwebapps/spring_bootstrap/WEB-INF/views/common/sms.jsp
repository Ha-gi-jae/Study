<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
 <!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{1.2.0}.js"></script>

<script>
IMP.init('iamport'); // 가맹점 식별코드
$(document).ready(function(){
	 var aa = { merchant_uid: 'adfadsf', min_age: 12, popup: true } 
	 var rsp = { success: true, error_code: 'kd', error_msg: 'male', imp_uid: 'music', merchant_uid: 'adfadsf' }
	 
		$('#phone').on('click', function(){
			IMP.certification(aa, function(rsp));
		})
	});
	
	IMP.certification({
	    merchant_uid : 'merchant_' + new Date().getTime() //본인인증과 연관된 가맹점 내부 주문번호가 있다면 넘겨주세요
	}, function(rsp) {
	    if ( rsp.success ) {
	    	 // 인증성공
	        console.log(rsp.imp_uid);
	        console.log(rsp.merchant_uid);
	        $.ajax({
					type : 'POST',

					url : '/certifications/confirm',

					dataType : 'json',

					data : {
						imp_uid : rsp.imp_uid

					}

			 }).done(function(rsp) {
			 		alert()

			 });
	    } else {
	    	 // 인증취소 또는 인증실패

	        var msg = '인증에 실패하였습니다.';

	        msg += '에러내용 : ' + rsp.error_msg;
	        alert(msg);

	    }

	});
</script>
</head>
<body>
<button id="phone">안녕</button>
</body>
</html>