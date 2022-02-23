<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head></head>

<title>공지사항 등록</title>

<body class="hold-transition sidebar-mini">
  <div class="content-wrapper">
	<div class="wrapper" style="background: #ffffff;">
		<div class="card card-success">
			
			<!-- Main content -->

			<div class="row">
				<div class="col-md-12">
					<div>
						
						<!-- /.card-header -->
						<div class="col-md-12">
							<div class="card-body">
							<form role="form" action="./notice-regist" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="inputName">제목</label> 
									<input type="text" name="noticeTitle" id="inputName" class="form-control">
								</div>

								<div class="form-group">
									<label for="inputWriter">작성자</label> 
									<input type="text" name="noticeWriter" id="inputWriter" class="form-control" value="시스템관리자" readonly="readonly">
								</div>
								<!-- <div>
									<label>팝업 설정</label> 
									<input type="checkbox" onclick="checkPopUp()" data-toggle="collapse" href="#collapseExample" role="button"
									aria-expanded="false" id="popUp" name="popUp" value="N" aria-controls="collapseExample">

								</div> -->
								<div class="collapse" id="collapseExample">
									<div class="">
										<div class="form-group">
											<input id="startDate" name="startDate" type="date" value="2999-12-31"> ~ <input value="2999-12-31" id="endDate" name="endDate" type="date">

										</div>

									</div>
								</div>

										<div class="form-group">
									<label for="inputDescription">내용</label>
									<textarea name="noticeContent" id="summernote"></textarea>
								</div>

								<div class="form-group" style="border: none;">
									<label for="inputClientCompany">파일 첨부</label> 
									<input type="file" id="noticeFile" name="noticeFile" style="border: none; display: block;">
								</div>

								<div class="form-group" style="border: none; text-align: right;">
									<button class="btn" style="border-color:#1A4F72; background: #1A4F72; color: white" type="submit">등록</button>
									<!-- <button type="button" class="btn" onclick="reset()" style="margin-left: 1%; border-color:#1A4F72; background: #1A4F72; color: white">리셋</button> -->
									<button class="btn" style="margin-left: 1%; border-color:#c82333; background: #c82333; color: white" onclick="CloseWind()">취소</button>
								</div>
							 </form>

							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</div>

				</div>

			</div>
		</div>
		<!-- /.col-->
	</div>
</div>
	<!-- /.content-wrapper -->


	<!-- Page specific script -->
	<script>
		window.onload = function() {
			// Summernote
			$('#summernote').summernote({
				height : 200
			})
		}
		
		function CloseWind(){
			window.close();
		}
		
		function checkPopUp(){
			//alert("눌림");
			var checkValue = document.getElementById('popUp').value;
			if(checkValue=="N"){
				document.getElementById('popUp').value="Y";
				document.getElementById('startDate').value="";
				document.getElementById('endDate').value="";
			}
			if(checkValue=="Y"){
				document.getElementById('popUp').value="N";
				document.getElementById('startDate').value="2999-12-31";
				document.getElementById('endDate').value="2999-12-31";
			}
		}
		
		function reset(){
			$('#inputName').val("");
			$('#inputWriter').val("");
			$('input[type="checkbox"]').attr('checked',false);
			$('#startDate').val("");
			$('#endDate').val("");
			$('#summernote').val("");
			$('input[type="file"]').val("");
			
		}
		
	</script>

</body>


