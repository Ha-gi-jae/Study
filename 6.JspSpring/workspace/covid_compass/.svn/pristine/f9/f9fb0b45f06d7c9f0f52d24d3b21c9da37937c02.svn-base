<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<title>기관등록</title>
<body>
	<div class="card">
		<div class="card-header d-flex p-0">
			<h3 class="card-title p-3">기관등록</h3>
			<ul class="nav nav-pills ml-auto p-2">
				<li class="nav-item"><a class="nav-link active" href="#tab_1"
					data-toggle="tab" >직접등록</a></li>
				<li class="nav-item"><a class="nav-link" href="#tab_2"
					data-toggle="tab">파일등록</a></li>
			</ul>
		</div>
		<!-- /.card-header -->
		<div class="card-body">
			<div class="tab-content">
				<div class="tab-pane active" id="tab_1">
					<form role="selfform" method="post" action="inst-selfRegist" accept-charset="utf-8" >
						<div class="form-group">
							<label>담당자</label> <input type="text" id="writer"
								readonly="readonly" name="writer" class="form-control"
								value="관리자">
						</div>
						<div class="form-group">
							<label>기관</label> <br> 
							<input id="inst" onclick="createDiv()" checked="checked" type="radio" name="inst" value="검사소">검사소&nbsp; 
							<input id="pbhlth" onclick="deleteDiv()" type="radio" name="inst" value="보건소">보건소&nbsp; 
							<input id="hspt" onclick="deleteDiv()" type="radio" name="inst" value="병원">병원&nbsp; 
							<input id="ltctr" onclick="deleteDiv()" type="radio" name="inst" value="생활치료센터">생활치료센터
						</div>
						<div class="form-group" id="instNameDiv">
							<label>기관명</label> <input type="text" id="inst" name="instName"
								class="form-control" value="" onclick="checkResAgency()">
						</div>
						<div class="form-group row" id="selectPbht">
							<div class="col-10">
								<label>관할보건소</label> 
								<input type="hidden" name="resAgencyNo" id="resAgencyNo" value="${pbhtNo}">
								<input type="text" id="resAgency" name="resAgency" class="form-control" value="${instNm}">
							</div>
							<div class="col-2" style="margin-top: 26px;">
								<button type="button" id="searchResAgency" onclick="OpenWindow('./pbht-list','','600','794')" class="btn btn-secondary" style="float: right; width:100%; background-color: #1a4f72;">찾기</button>
							</div>
						</div>
						<div class="form-group">
							<label>연락처</label> <input type="text" id="inst" name="instCall" oninput="autoHyphen(this);" class="form-control" value="">
						</div>
						<div class="form-group row">
							<div class="col-10">
								<label for="instAddr">주소</label>
									<input type="text" id="instAdres" name="instAdres" class="form-control" value="">
							</div>
							<div class="col-2" style="margin-top: 26px;">
								  <button type="button" onclick="address_go();" class="btn btn-secondary" style="float: right; width:100%; background-color: #1a4f72;">검색</button>
							</div>
						</div>

					</form>
					<div style="float: right;">
						<button type="button" style="background: #1a4f72; color: #ffffff; border-color: #5b6f90;"
							    class="btn btn-secondary" id="registBtn" onclick="selfRegist_go();">등록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" style="background: #c82333; color: #ffffff; border-color:#c82333;"
							    class="btn" id="cancelBtn" onclick="CloseWind();">취 소</button>
						</div>
					
				</div>
				<!-- /.tab-pane -->
				<div class="tab-pane" id="tab_2" style="height: 440px;">
					<form enctype="multipart/form-data" role="fileform" method="post" action="inst-fileRegist" name="registForm">
					<div class="form-group">
							<label>기관</label> <br> 
							<input id="inst" checked type="radio" name="inst" value="검사소">검사소&nbsp; 
							<input id="pbhlth" type="radio" name="inst" value="보건소">보건소&nbsp; 
							<input id="hspt" type="radio" name="inst" value="병원">병원&nbsp; 
							<input id="ltctr" type="radio" name="inst" value="생활치료센터">생활치료센터
							
							<div class="nav-item dropdown" style="float: right">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">양식다운로드 <span class="caret"></span></a>
								<div class="dropdown-menu">
									<a onclick="location.href='<%=request.getContextPath()%>/admin/sampleInspFile'" class="dropdown-item" tabindex="-1" href="#" >검사소</a>
									<a onclick="location.href='<%=request.getContextPath()%>/admin/samplePbhtFile'" class="dropdown-item" tabindex="-1">보건소</a>
									<a onclick="location.href='<%=request.getContextPath()%>/admin/sampleHsptFile'" class="dropdown-item" tabindex="-1">병원</a>
									<a onclick="location.href='<%=request.getContextPath()%>/admin/sampleLtctFile'" class="dropdown-item" tabindex="-1">생활치료센터</a>
								</div>
							</div>
					</div>
					<div class="form-group">
						<div class="card card-outline card-secondary">
							<div class="card-footer fileInput">
								<input type="file" name="instFile" onchange="fileCheck()">
							</div>
						</div>
					</div>
					<div style="float: right;">
						<button type="button"
							style="background: #1a4f72; color: #ffffff; border-color: #5b6f90;"
							class="btn btn-secondary" id="registBtn" onclick="fileRegist_go();">등록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button"
							style="background: #c82333; color: #ffffff; border-color: #c82333;"
							class="btn" id="cancelBtn" onclick="CloseWind();">취 소</button>
					</div>
					
					</form>
					
				</div>
				<!-- /.tab-pane -->

			</div>
			<!-- /.tab-content -->
		</div>
		<!-- /.card-body -->
	</div>



	

	<script>
		function CloseWind(){
			window.close();
			
		}
		function checkResAgency(){
			var checkRadio = $('input[checked="checked"]').val();
			if(checkRadio =='검사소'){
				var resAgency = $('#resAgency').val();
				if(resAgency == ''){
					alert("관할보건소를 먼저 선택해주세요.");
					$('#searchResAgency').click();
					return;
				}
				
			}else{
				return;
			}
		}
		function createDiv(){
			$('#selectPbht').remove();
			var html = "<div class='form-group row' id='selectPbht'>"
					  	+"<div class='col-10'>"
					  		+"<label>관할보건소</label><input type='text' id='resAgency' name='resAgency' class='form-control'>"
					  	+"</div>"
					  	+"<div class='col-2' style='margin-top: 26px;'>"
					  		+"<button id='searchResAgency' type='button' onclick=\"OpenWindow('./pbht-list','','600','794')\" class='btn btn-secondary' style='float: right; width:100%; background-color: #1a4f72;'>찾기</button>"
					 	+"</div>"
					   +"</div>";
			$('#instNameDiv').after(html);
		}
		function deleteDiv(){
			$('#selectPbht').remove();
		}
 		$('input[name="inst"]').click(function(){

 			$('input[name="inst"]').attr("checked",false);
 			$(this).attr("checked",true);
		})

		function fileCheck(){
			var files=$('input[name="instFile"]');
			for(var file of files){
				//alert(file.value);
				var fileType = file.value.substr(file.value.lastIndexOf(".")+1).toUpperCase();
				//alert(fileType);
				if(!(file.value=="")){
					if(!(fileType=="XLSX"||fileType=="XLS")){
						alert("파일은 xlsx 형식과 xls 형식만 가능합니다.");
						file.value="";
						return;
					}
				}
			}
		}
		
 		function selfRegist_go(){
 			var selfForm=$('form[role="selfform"]');
 			var instName =$('input[name="instName"]').val();
 			
 			var checkRadio = $('input[checked="checked"]').val();
 			var resAgency = $('#resAgency').val();
 			var instCall =$('input[name="instCall"]').val();
 			var instAdres=$('input[name="instAdres"]').val();
 			
 			if(instName==''){
	 			alert("기관명을 입력하세요");
	 			return;
 			}
 			if(checkRadio=='검사소' && resAgency==''){
 				alert('관할보건소를 입력하세요');
 				return;
 			} 
 			
 			if(instCall==''){
 				alert("연락처를 입력하세요");
 				return;
 			}
 			
 			if(instAdres==''){
 				alert("주소를 입력하세요");
 				return;
 			}
 			
 			
 			selfForm.submit();
 		}
 		
 		
		function fileRegist_go(){
			var files=$('input[name="instFile"]');
			for(var file of files){
				if(file.value==""){
					alert("파일을 선택하세요");
					file.focus();
					file.click();
					return;
				}
			}
			var fileForm=$('form[role="fileform"]');
			fileForm.submit();

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