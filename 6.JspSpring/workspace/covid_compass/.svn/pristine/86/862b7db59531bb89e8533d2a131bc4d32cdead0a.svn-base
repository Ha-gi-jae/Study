<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head></head>

<title></title>

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
									<input type="text" name="noticeTitle" id="inputName" class="form-control" value="${notice.title }" readonly="readonly">
								</div>

								<div class="form-group">
									<label for="inputWriter">작성자</label> 
									<input type="text" name="noticeWriter" id="inputWriter" class="form-control" value="${notice.writer }" readonly="readonly">
								</div>
								
								<div class="collapse" id="collapseExample">
									<div class="">
										<div class="form-group">
											<input id="startDate" name="startDate" type="date" value="2999-12-31"> ~ <input value="2999-12-31" id="endDate" name="endDate" type="date">

										</div>

									</div>
								</div>

								<div class="form-group">
									<label for="inputDescription">내용</label>
									<div class="card" style="border:1px solid #ced4da; background-color:#e9ecef; height: 320px;">${notice.content}</div>
								</div>

								<div class="form-group" style="border: none;">
			                  		<input type="hidden" name="attachNo" value="${attachNo}">
			                     	<label for="inputClientCompany">첨부된 파일</label><br>
			                     	<a href="getFile?fileName=${fileName}"><span style="font-weight: bold;">${originalFileName}</span></a> 
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


