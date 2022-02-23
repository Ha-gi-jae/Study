<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
		<div class="card card-success">
				<div class="card-header" style="background-color: #5b6f90;">
					<h3 class="card-title" style="color: white">기관등록</h3>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="">

							<!--end card-header  -->
							<div class="card-body">
								<form enctype="multipart/form-data" role="form" method="post" action="" name="registForm">
									<div class="form-group">
										<label for="writer">담당자</label>
										<input type="text" id="writer" readonly name="writer" class="form-control" value="${loginUser.id }">
									</div>
									<div class="form-group">
										<label for="title">기관</label>
										<br>

										<input id="insp" checked  type="radio" name="instt" value="검사소">검사소
										<input id="pbhlth" type="radio" name="inst" value="보건소">보건소
										<input id="hsptl" type="radio" name="inst" value="병원">병원
										<input id="ltctr" type="radio" name="inst" value="생활치료센터">생활치료센터

									</div>

									<div class="form-group">
										<div class="card card-outline card-secondary">
											<div class="card-header">
												<h5 style="display: inline; line-height: 40px;">첨부파일 </h5>
												&nbsp;&nbsp;
											</div>
											<div class="card-footer fileInput">
												<input type="file" name="instFile" onchange="fileCheck()">
											</div>
										</div>
									</div>
								</form>

								<div>
									<button type="button" style="background:#5b6f90; color:#ffffff ; border-color: #5b6f90;" class="btn btn-secondary" id="registBtn" onclick="regist_go();">등 록</button>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" style="background:#5b6f90; color:#ffffff ; border-color: #5b6f90;" class="btn" id="cancelBtn" onclick="CloseWindow();">취 소</button>
								</div>
							</div>
							<!--end card-body  -->
							<!--end card-footer  -->
						</div>
						<!-- end card -->
					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->

		</div>
	<script>
 		$('input[name="inst"]').click(function(){

 			$('input[name="inst"]').attr("checked",false);
 			$(this).attr("checked",true);
		})

		function fileCheck(){
			var files=$('input[name="uploadFile"]');
			for(var file of files){
				//alert(file.value);
				var fileType = file.value.substr(file.value.lastIndexOf(".")+1).toUpperCase();
				//alert(fileType);
				if(!(file.value=="")){
					if(!(fileType=="XLSX")){
						alert("파일은 xlsx 형식만 가능합니다.");
						file.value="";
						return;
					}
				}
			}
		}


		function regist_go(){
			var files=$('input[name="uploadFile"]');
			for(var file of files){
				if(file.value==""){
					alert("파일을 선택하세요");
					file.focus();
					file.click();
					return;
				}
			}
			//구현때
			document.registForm.submit();

		}




	</script>

</body>
</html>