<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head></head>

<title></title>

<body class="hold-transition sidebar-mini">
	<section class="content">
		<div class="row" style="margin: 1px;">
			<div class="col-md-12 pl-0 pr-0">
				<div class="card" style="margin-top: 15px;">
					
					<div class="card-body">
						<div class="table-responsive">
							<div class="fomDdoing" style="height: 730px;">
							<table class="table table-bordered" style="">
								<tr style="text-align: left;">
									<td style="font-weight: bold; background-color: #f5fafc; width: 140px">제목</td>
									<td colspan="3">${notice.title}</td>
								</tr>
								<tr style="text-align: left;">
									<td style="font-weight: bold; background-color: #f5fafc;">작성자</td>
									<td>${notice.writer}</td>
									<td style="font-weight: bold; background-color: #f5fafc; width: 140px;">작성일자</td>
									<fmt:formatDate value="${notice.wrtYmd }" pattern="yyyy-MM-dd" var="wrtYmd" />
									<td>${wrtYmd}</td>
								</tr>
								<tr style="text-align: left; font-weight: bold;">
									<td style="font-weight: bold; background-color: #f5fafc;">첨부파일</td>
									<td colspan="3">
										<a href="getFile?fileName=${fileName}">
											<span style="font-weight: bold;">${originalFileName}</span>
										</a>
									</td>
								</tr>
								<tr style="text-align: left;">
									<td colspan="4">
										<div style="height: 540px;;">${notice.content}</div>
									</td>
								</tr>
							</table>
							<!-- /.card-body -->
							<!-- /.card -->

							<div class="card-footer" style="height: auto; background-color: white; padding: 0;">

								<div class="form-group" style="border: none; text-align: left;">
									<button class="btn btn-success" style="width:10%; border-color: #1A4F72; background: #1A4F72;" onclick="go_list();">목록</button>
							</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col-->
	</section>
	<script>
		function remove_go(noticeNo){
			//alert(noticeNo);
			location.href='<%=request.getContextPath()%>/insp/notice-remove?noticeNo='+noticeNo;
		}
	
		function go_list(){
			
			if(typeof(history.pushState) == 'function'){
				var renewURL = parent.location.href;
				renewURL = renewURL.substring(0, renewURL.indexOf('?'));
				
				renewURL += "?mCode=M020600";
				
				parent.history.pushState('', null, renewURL);
				
			}else{
				location.hash = "#";
			}
			location.href='<%=request.getContextPath()%>/insp/notice-list';
		}
	</script>
	
</body>