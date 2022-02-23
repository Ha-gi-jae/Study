<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<title>회원등록</title>

<body>

	<!-- Content Wrapper. Contains page content -->
<div >
  	 <section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>회원등록</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="#">
				        	<i class="fa fa-dashboard">회원관리</i>
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	등록
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
  	</section>
	<!-- Main content -->
	<section class="content register-page">
		<div class="register-box">
			<div class="login-logo">
    			<a href=""><b>회원 등록</b></a>
  			</div>
			<!-- form start -->
			<div class="card">				
				<div class="register-card-body">
					<form role="form" class="form-horizontal" action="regist.do" method="post">						
						<input type="hidden" name="picture" />
						<div class="input-group mb-3">
							<div class="mailbox-attachments clearfix" style="text-align: center;">
								<div class="profile-user-img img-fluid img-circle" id="pictureView" style="border: 1px solid black; height: 200px; width: 140px; margin: 0 auto;"></div>
								<div class="mailbox-attachment-info">
									<div class="input-group input-group-sm">
										<label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">파일선택</label>
										<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled/>
										<span class="input-group-append-sm">											
											<button type="button" class="btn btn-info btn-sm btn-append" onclick="upload_go();">업로드</button>											
										</span>
									</div>
								</div>
							</div>
							<br />
						  </div>	
						  <div class="form-group row">
							 <label for="id" class="col-sm-3" style="font-size:0.9em;" >
							 	<span style="color:red;font-weight:bold;">*</span>아이디</label>	
							<div class="col-sm-9 input-group input-group-sm">
								<input name="id" 
									onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);"
								type="text" class="form-control" id="id" placeholder="13글자 영문자,숫자 조합">
								<span class="input-group-append-sm">	
									<button type="button" onclick="idCheck_go();"  class="btn btn-info btn-sm btn-append">중복확인</button>
								</span>								
							</div>								
						</div>
						<div class="form-group row">
							<label for="pwd" class="col-sm-3" style="font-size:0.9em;">
								<span style="color:red;font-weight:bold;">*</span>패스워드</label>
							<div class="col-sm-9 input-group-sm">								
								<input class="form-control" name="pwd" type="password" class="form-control" id="pwd"
										placeholder="20글자 영문자,숫자,특수문자 조합" />
							</div>
							
						</div>
						<div class="form-group row">
							<label for="name" class="col-sm-3" style="font-size:0.9em;">
								<span style="color:red;font-weight:bold;">*</span>이 름</label>
							<div class="col-sm-9 input-group-sm">								
								<input class="form-control" name="name" type="text" class="form-control" id="name"
										placeholder="이름을 입력하세요"
										onkeyup="this.value=this.value.trim();" />
							</div>
							
						</div>		
						<div class="form-group row">
							<label for="authority" class="col-sm-3" style="font-size:0.9em;" >권 한</label>
							<div class="col-sm-9">
								<select name="authority" class="form-control" style="font-size:0.9em;">
									<option value="ROLE_USER">사용자</option>
									<option value="ROLE_MANAGER">운영자</option>
									<option value="ROLE_ADMIN">관리자</option>
								</select>
							</div>
						</div>					
						<div class="form-group row">
							<label for="email" class="col-sm-3" style="font-size:0.9em;">이메일</label>
							<div class="col-sm-9 input-group-sm">
								<input name="email" type="email" class="form-control" id="email"
										placeholder="example@naver.com">
							</div>
						</div>
						<div class="form-group row">
							<label for="phone" class="col-sm-3 control-label">전화번호</label>
							<div class="col-sm-9">	
								<div class="input-group-sm">
									<select style="width:75px;" name="phone" id="phone" class="form-control float-left">
										<option value="">-선택-</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="017">017</option>
										<option value="018">018</option>
									</select>							
									<label class="float-left" style="padding: 0; text-align: center;">&nbsp;-&nbsp;</label>										
									<input style="width:68px;" name="phone" type="text" class="form-control float-left" />
									<label class="float-left" style="padding: 0; text-align: center;">&nbsp;-</label>
									<input style="width:68px;" name="phone" type="text" class="form-control float-right" />						
								</div>
							</div>
						</div>
						<div class="form-group row">
							 <label for="address1" class="col-sm-3" style="font-size:0.9em;" >
							 	<span style="color:red;font-weight:bold;"></span>기본주소</label>	
							<div class="col-sm-9 input-group input-group-sm">
								<input name="address" type="text" readonly class="form-control" id="address1">
								<span class="input-group-append-sm">	
									<button type="button" onclick="address_go();"  class="btn btn-info btn-sm btn-append">주소검색</button>
								</span>								
							</div>								
						</div>
						<div class="form-group row">
							<label for="address2" class="col-sm-3" style="font-size:0.9em;">상세주소</label>
							<div class="col-sm-9 input-group-sm">
								<input name="address" type="text" class="form-control" id="address2">
							</div>
						</div>
						
						<div class="card-footer">
							<div class="row">								
								<div class="col-sm-6">
									<button type="button" id="registBtn" onclick="regist_go();return false;" class="btn btn-info">등&nbsp;&nbsp;록</button>
							 	</div>
							 	
							 	<div class="col-sm-6">
									<button type="button" id="cancelBtn" onclick="CloseWindow();"
										class="btn btn-default float-right">&nbsp;&nbsp;&nbsp;취 &nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;</button>
								</div>
							
							</div>
						</div>
						<input type="hidden" value="1" name="enabled">
						<input type="hidden" value="mimi" name="register">
					</form>					
				</div><!-- register-card-body -->
			</div>
		</div>
	</section>		<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<form role="imageForm" action="upload/picture" method="post" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control" onchange="picture_go();" style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value=""/>
	<input type="hidden" name="checkUpload" value="0" />
</form>
<script>
var formData = "";

function picture_go(){// form 데이터 객체화
	
	formData = new FormData($('form[role="imageForm"]')[0]);
	var form = $('form[role="imageForm"]');
	var picture = form.find('[name=pictureFile]')[0];
	
	// 확장자 확인
	var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
	if(!(fileFormat == "JPG" || fileFormat == "JPEG")){
		alert("이미지는 jpg/jpeg 형식만 가능합니다.");
		picture.value = "";
		return;
	}
	// 파일 크기 확인
	if(picture.files[0].size > 1024 * 1024 * 5){
		alert("사진 용량은 5MB 이하만 가능합니다.");
		picture.value = "";
		return;
	}
	// 업로드 확인 변수 초기화
	form.find('[name="checkUpload"]').val(0);
	
	document.getElementById('inputFileName').value=picture.files[0].name;
	
	//미리보기 (브라우저에 부담을 많이주기때문에 자주쓰이는 방식은 아니다.)
	if(picture.files && picture.files[0]){
		var reader = new FileReader();
		reader.onload = function (e){
			$('div#pictureView').css({
				'background-image':'url('+e.target.result+')',
				'background-position':'center',
				'background-size':'cover',
				'background-repeat':'no-repeat'
			});
		}
		reader.readAsDataURL(picture.files[0]);
	}
}

function upload_go(){ // 객체화 된 데이터 ajax로 전송.
	//if:만약 ^ $('input[name="pictureFile]"]').val():input태그의 name이 pictureFile인 밸류가 ^ !: 비었을경우
	if(!$('input[name="pictureFile"]').val()){
		alert("사진을 선택하세요.");
		$('input[name="pictureFile"]').click();
		return;
	}
	if($('input[name="checkUpload"]').val()==1){
		alert("이미 업로드된 사진입니다.");
		return;
	}
	$.ajax({
		url: "picture",
		data: formData,
		type: 'post',
		contentType: false,
		processData: false,
		success: function(data){
			$('input[name="checkUpload"]').val(1);
			
			$('input#oldFile').val(data);
			$('form[role="form"] input[name="picture"]').val(data);
			alert("사진이 업로드 되었습니다.");
		},
		error: function(error){
			alert("현재 사진 업로드가 불가합니다. \n 관리자에게 연락바랍니다.");
		}
	});
}
var checkID="";

function idCheck_go(){
	var input_ID=$('input[name="id"]');
	
	if(!input_ID.val()){
		alert("아이디를 입력하시오.");
		input_ID.focus();
		return;
	}else{
		//4 ~ 12 영문자와 숫자로 입력
		var reqID=/^[a-z]{1}[a-zA-Z0-9]{3,12}$/;
		if(!reqID.test($('input[name="id"]').val())){
			alert("아이디 첫글자는 영소문자이며, \n4~12자의 영문자와 숫자로만 입력해야합니다.");
			$('input[name="id"]').focus();
			return;
		}
	}
	$.ajax({
		url: "idCheck?id="+input_ID.val().trim(),
		method : "get",
		success : function(result){
			if(result == "DUPLICATED"){
				alert("중복된 아이디입니다.");
				$('input[name="id"]').focus();
			}else{
				alert("사용가능한 아이디입니다.");
				checkedID=input_ID.val().trim();
				$('input[name="id"]').val(input_ID.val().trim());
			}
		},
		error: function(error){
			alert("시스템장애로 가입이 불가합니다.");
		}
	});
}

function regist_go(){
	
	var uploadCheck = $('input[name="checkUpload"]').val();
	if(uploadCheck=="0"){
		alert("사진업로드는 필수 입니다.");
		return;
	}
	if(!$('input[name="id"]').val()){
		alert("아이디는 필수입니다.");
		return;
	}
// 	if(!$('input[name="id"]').val()!=checkedID){
// 		alert("아이디는 중복 확인이 필요합니다.");
// 		return;
// 	}
	if(!$('input[name="pwd"]').val()){
		alert("패스워드는 필수입니다.");
		return;
	}
	if(!$('input[name="name"]').val()){
		alert("이름은 필수입니다.");
		return;
	}
	
	var form = $('form[role="form"]');
	form.submit();
}

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
                document.getElementById("address1").value = extraAddr;
            
            } else {
                document.getElementById("address1").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
//             document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("address1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();
        }
    }).open();
}
</script>
</body>