<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageMaker" value="${dataMap.pageMaker}"/>
<c:set var="cri" value="${dataMap.pageMaker.cri}"/>
<c:set var="loginList" value="${dataMap.loginList}"/>

<head></head>
<title></title>
<body>

	<section class="content">
		<div class="row" style="margin: 1px; margin-top: 17px;">
			<div class="col-md-12 pl-0 pr-0">
				<div class="card-header p-0 t-1">
					<div class="row mb-2">
						<div class="col-md-6">
							<button type="button" class="btn btn-primary"
								style="background: #1a4f72; border: 0px; width: 90px;"
								onclick="fileDown_go()">다운로드</button>
						</div>
					</div>
				</div>
		   <div class="card-body pl-0 pr-0">		
			<div class="tab-content" id="custom-tabs-three-tabContent">	
              <div class="row" style="margin: 1px;">
				<div class="col-md-12 pl-0 pr-0">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<div class="confirm" style="height: 650px;">
									<table class="table table-hover text-nowrap" style="text-align: center; font-size: 15px; table-layout: fixed;">
										<thead>
											<tr role="row">
												<!-- <th style="width: 5%;"><input type="checkbox"
											id="selectAll" onclick="selectAll()"></th> -->
												<th tabindex="0" aria-controls="example2" rowspan="1"
													style="text-align: center;" colspan="1" aria-label="">기관번호</th>
												<th tabindex="0" aria-controls="example2" rowspan="1"
													style="text-align: center;" colspan="1" aria-label="">회원번호</th>

												<th tabindex="0" aria-controls="example2" rowspan="1"
													style="text-align: center;" colspan="1" aria-label="">회원명</th>

												<th tabindex="0" aria-controls="example2" rowspan="1"
													style="text-align: center;" colspan="1" aria-label="">IP</th>
												<th tabindex="0" aria-controls="example2" rowspan="1"
													style="text-align: center;" colspan="1" aria-label="">발생일자</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty loginList}">
												<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
											</c:if>
											<c:forEach items="${loginList}" var="login">
												<tr>
													<!-- <td onclick="event.cancelBubble=true" style="cursor: default;"><input
											type="checkbox" name="inst" onclick="cancleAll()"></td> -->
													<td style="width: 20%;">${login.instNo}</td>
													<td style="width: 20%;">${login.mberNo}</td>
													<td style="text-align: left; width: 20%;">${login.mberNm }</td>
													<td style="width: 20%;">${login.userIp}</td>
													<td style="width: 20%;">${login.userLogTime}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>


								<div class="card-footer clearfix" style="background: white;">
									<%@ include file="/resources/js/paginationLogin.jsp"%>
								</div>
							</div>
						</div>
					</div>
				  </div>
			    </div>
			  </div>
			</div>	
		  </div>
		</div>
	</section>
	<script>
		function selectAll(checkBox){
			var length = document.getElementsByName("inst").length;
			if(document.getElementById('selectAll').checked==true){
				for(var i=0; i<length; i++) document.getElementsByName("inst")[i].checked=true;
			}

			if(document.getElementById('selectAll').checked==false){
				for(var i=0; i<length; i++) document.getElementsByName("inst")[i].checked=false;
			}


		}
				function cancleAll(){

			if(document.getElementById('selectAll').checked==true){
				document.getElementById('selectAll').checked=false;
			}
		}
				
		function fileDown_go(){
			//alert("눌림");
			location.href='<%=request.getContextPath()%>/admin/loginFileDownload';
		}
				
</script>
</body>
