<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head></head>

<title>비밀번호 찾기</title>

<body>
<div class="card card-info">
          <div class="card-header" style="background: #1a4f72">
            <h3 class="card-title" >비밀번호 찾기</h3>
          </div>
          <!-- /.card-header -->
          <!-- form start -->
          <form class="form-horizontal" method="post" role="form" action="<%=request.getContextPath()%>/common/findPwd" style="margin-top: 5px;">
            <div class="card-body pb-0 pt-0">
              <div class="form-group row ">
                <label for="mberId" class="col-sm-3 col-form-label">아이디</label>
                <div class="col-sm-9">
                  <input type="text" class="form-control" id="mberId" name="mberId" maxlength="25" placeholder="Enter id">
                </div>
              </div>
              <div class="form-group row">
                <label for="mberNm" class="col-sm-3 col-form-label pt-0">이름</label>
                <div class="col-sm-9">
                  <input type="text" class="form-control" id="mberNm" name="mberNm" maxlength="25" placeholder="Enter name">
                </div>
              </div>
              <div class="form-group row">
                <label for="mberBir" class="col-sm-3 col-form-label pt-0">생년월일</label>
                <div class="col-sm-9">
                  <input type="text" class="form-control" id="mberBir" name="mberBir" onkeyup="birth_keyup(this)" maxlength="10" placeholder="2022-01-01">
                </div>
              </div>
              <div class="form-group row">
                <label for="mberTelno" class="col-sm-3 col-form-label pt-0">연락처</label>
                <div class="col-sm-9">
                  <input type="text" class="form-control col-sm-8" id="mberTelno" name="mberTelno" maxlength="13" oninput="autoHyphen(this)" placeholder="010-1234-5678" style="display: inline;">
                  <button type="button" id="pleaseNumber" class="btn btn-info col-sm-3" style="background-color: #1a4f72; border-color: #1a4f72; display: inline;">인증번호 전송</button>
                </div>
              </div>
              <div class="form-group row" style="display: none;" id="numberinput">
                <label for="writenumber" class="col-sm-3 col-form-label pt-0">인증번호</label>
                <div class="col-sm-9">
                  <input type="text" class="form-control col-sm-8" id="writenumber" name="writenumber" maxlength="6" style="display: inline;">
                  <button type="button" onclick="checknumber();" class="btn btn-info col-sm-3" style="background-color: #1a4f72; border-color: #1a4f72; display: inline;">인증번호 확인</button>
                </div>
              </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
     <button type="button" class="btn btn-info" id="submitbutton" style="background-color: #1a4f72; border-color: #1a4f72;">확인</button>
     <button type="button" id="close" class="btn btn-default" style="background-color: #1a4f72; border-color: #1a4f72; color: white;">닫기</button>
            </div>
            <!-- /.card-footer -->
          </form>
        </div>
           <input type="hidden" id="number">
<script>

window.onload = function(){
	$('#close').on('click', function(){
		window.close();
	})
	//인증번호 전송 버튼 클릭
	$('#pleaseNumber').on('click', function(){
		
		mberNm = document.getElementById('mberNm').value;
		mberTelno = document.getElementById('mberTelno').value;
		
		if(mberId == null || mberId == ''){
			alert("아이디를 입력해주세요.")
			return;
		}
		if(mberNm == null || mberNm == ''){
			alert("이름을 입력해주세요.");
			return;
		}
		if(mberBir == null || mberBir ==''){
			alert("생년월일을 입력해주세요.");
			return;
		}
		if(mberTelno == null || mberTelno ==''){
			alert("연락처를 입력해주세요.");
			return;
		}
		
		//mberBir Date로 캐스팅 해줘야함.
		number = randomString();
		$('#number').val(number);
		console.log(number)
		mberData = {
			"mberNm" : mberNm,
			"mberTelno" : mberTelno,
			"number" : number
		}
			// SMS 문자보내기.
			$.ajax({
				url: "<%=request.getContextPath()%>/common/sms.do",
				data : JSON.stringify(mberData),
				type : "post",
				contentType : "application/json",
				success: function(res){
					alert("인증번호를 발송했습니다.");
					$('#numberinput').css('display', 'block');
				},
				error: function(xhr){
					alert('해당정보에 일치하는 계정이 존재하지 않습니다.\n올바른 정보를 입력해주세요.');
				}
			})
	})
}

//랜덤 문자 생성
function randomString(){
	const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
	const stringLength = 6;
	let randomString = '';
	for(let i = 0; i < stringLength; i++){
		const rnum = Math.floor(Math.random() * chars.length)
		randomString += chars.substring(rnum, rnum+1)
	}
	return randomString
}
//인증 번호 랑 입력번호 비교해서 확인 버튼.
function checknumber(){
	var hidden = $('#number').val();
	
	var write = $('#writenumber').val();
	
	if(hidden != write){
		alert("인증번호가 일치하지 않습니다.\n다시 입력해주세요.");
		return;
	}
	alert("인증되었습니다.");
	
	var form = $('form[role="form"]');	
	form.submit();
}

//생년월일 하이픈
function birth_keyup(obj){
    let birth_len = obj.value.length;
    if (event.keyCode==8){
        obj.value = obj.value.slice(0,birth_len)
        return 0;
    }else if(birth_len==4 || birth_len==7){
        obj.value += '-';
    }
}
//전화번호 하이픈
const autoHyphen = (target) => {
	target.value = target.value.replace(/[^0-9]/, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/,`$1-$2-$3`);
}
</script>
</body>