<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="mainLogList" value="${dataMap.mainLogList }"/>
<c:set var="mainFailLogList" value="${dataMap.mainFailLogList }"/>

<head>
<style>
	.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: #fff;
    background-color: #1a4f72;
}
</style>
</head>

<body>
<!-- 메인 에러로그 div 시작 -->

	<div class="row" style="box-sizing: content-box; padding: 1px;">
		<div class="col-6" style="margin-top: 10px;">
			<!-- Custom Tabs -->
			<div class="card">
				<div class="card-header ui-sortable-handle">
					<span class="card-title" style="font-weight: bold;">접속실패 로그</span>
					<div class="card-tools">
						<button type="button" class="btn btn-primary"
								style="background: #1a4f72; border: 0px; width: 80px; height: 30px;"
							 	onclick="failFileDown_go()">다운로드</button>
				    </div>
				</div>
				<!-- /.card-header -->

				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">
						<div class="card col-md-12"
							style="position: relative; left: 0px; top: 0px; margin-bottom: 0px;">
							<div class="card-header ui-sortable-handle" style="cursor: move;">
								
							</div>

							<!-- /.card-header -->
							<div class="card-body" style="padding: 0px;  height: 293px;">
								<div class="table-responsive">
									<table class="table table-hover text-nowrap"
										style="text-align: center; ">
										<thead>
											<tr role="row">
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
											<c:set var="failLogList" value="${mainFailLogList}"/>
											<c:if test="${empty failLogList}">
												<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
											</c:if>
											<c:forEach items="${failLogList}" var="failLog">
											<tr style="cursor: default;">
												<td>${failLog.instNo }</td>
												<td>${failLog.mberNo }</td>
												<td>${failLog.mberNm}</td>
												<td>${failLog.userIp }</td>
												<td>${failLog.userLogTime }</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>

							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_2"></div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_3"></div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_4"></div>
					<!-- /.tab-pane -->
				</div>
				<!-- /.tab-content -->
			</div>
		</div>
		<!-- /.col -->

<!-- 메인 에러로그 div 끝 -->
<!-- 메인 접속로그 div 시작 -->
		<div class="col-6" style="margin-top: 10px;">
			<!-- Custom Tabs -->
			<div class="card">
				<div class="card-header ui-sortable-handle">
					<span class="card-title" style="font-weight: bold;">접속성공 로그</span>
					<div class="card-tools">
						<button type="button" class="btn btn-primary"
								style="background: #1a4f72; border: 0px; width: 80px; height: 30px;"
							 	onclick="fileDown_go()">다운로드</button>
					</div>
					
				</div>
				<!-- /.card-header -->

				<div class="tab-content">
					<div class="tab-pane active" id="tab_5">
						<div class="card col-md-12"
							style="position: relative; left: 0px; top: 0px; margin-bottom: 0px;">
							<div class="card-header ui-sortable-handle" style="cursor: move;">
								
							</div>
							<!-- /.card-header -->
							<div class="card-body" style="padding: 0px;  height: 293px;">
								<div class="table-responsive">
									<table class="table table-hover text-nowrap"
										style="text-align: center;">
										<thead>
											<tr role="row">
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
											<c:set var="logList" value="${mainLogList}"/>
											<c:if test="${empty logList }">
											 	<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
											</c:if>
											<c:forEach items="${logList}" var="log">
											<tr style="cursor: default;">
												<td>${log.instNo }</td>
												<td>${log.mberNo }</td>
												<td>${log.mberNm}</td>
												<td>${log.userIp }</td>
												<td>${log.userLogTime }</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>

							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_6"></div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_7"></div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_8"></div>
					<!-- /.tab-pane -->
				</div>
				<!-- /.tab-content -->
			</div>
		</div>
		<!-- /.col -->
	</div>


<!-- 메인 에러로그 div 끝 -->
<!-- 메인 기관관리 div 시작 -->
	<div class="row" style="box-sizing: content-box; padding: 1px;">
		<div class="col-9">
			<!-- Custom Tabs -->
			<div class="card">
				<div class="card-header ui-sortable-handle">
					<span class="card-title" style="font-weight: bold; margin-left: 10px; margin-top: 10px; ">기관 관리</span>
					<div class="card-tools">
						<ul class="nav nav-pills ml-auto p-2">
							<li class="nav-item">
								<a class="nav-link active"  href="#tab_9" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-home-tab" aria-selected="true">검사소</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#tab_10" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-profile-tab" aria-selected="false">보건소</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#tab_11" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-profile-tab" aria-selected="false">병원</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#tab_12" data-toggle="pill" role="tab" aria-controls="custom-tabs-three-profile-tab" aria-selected="false">생활치료센터</a>
							</li>
							<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">관리메뉴 <span class="caret"></span></a>
								<div class="dropdown-menu">
									<a class="dropdown-item" tabindex="-1" href="#"
										onclick="OpenWindow('./inst-registForm','기관등록','600','600');">등록</a>
									<a  onclick="deleteInst()" class="dropdown-item" tabindex="-1">삭제</a>
	
								</div></li>
						</ul>
					</div>
				</div>
				<!-- /.card-header -->

				<div class="tab-content">
					<div class="tab-pane active" id="tab_9">
						<div class="card col-md-12"
							style="position: relative; left: 0px; top: 0px; margin-bottom: 0px;">
							<div class="card-header ui-sortable-handle" style="cursor: move; width: 400px;">
								<div class="input-group float-left" style="">
									<select class="form-control " name="searchType2" id="searchType2" style="width: 30px;">
										<option value="" ${pageMaker.cri.searchType2 eq '' ? 'selected':''}>검색구분</option>
										<option value="name"
											${pageMaker.cri.searchType2 eq 'name' ? 'selected':''}>기관명</option>
										<option value="adres"
											${pageMaker.cri.searchType2 eq 'adres' ? 'selected':''}>주소</option>
									</select>
										<input class="form-control" type="text" name="keyword"
											value="${pageMaker.cri.keyword }"
											style="width: 90px; display: inline-block;" />
										<span class="input-group-append">
											<button class="btn btn-primary" type="button" id="searchBtn"
												style=" background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px;"
												data-card-widget="search"
												onclick="list_go('1','<%=request.getContextPath()%>/rest-main/insp-list')">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
								</div>
							</div>
							<!-- /.card-header -->
							
							<%@ include file="./main-insp-list.jsp" %>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_10">
						<div class="card col-md-12"
							style="position: relative; left: 0px; top: 0px; margin-bottom: 0px;">
							<div class="card-header ui-sortable-handle" style="cursor: move; width: 400px;">
								<div class="input-group float-left" style="">
									<select class="form-control " name="searchType2pb" id="searchType2pb" style="width: 30px;">
										<option value="" ${pageMaker.cri.searchType2 eq '' ? 'selected':''}>검색구분</option>
										<option value="name"
											${pageMaker.cri.searchType2 eq 'name' ? 'selected':''}>기관명</option>
										<option value="adres"
											${pageMaker.cri.searchType2 eq 'adres' ? 'selected':''}>주소</option>
									</select>
										<input class="form-control" type="text" name="keywordpb"
											value="${pageMaker.cri.keyword }"
											style="width: 90px; display: inline-block;" />
										<span class="input-group-append">
											<button class="btn btn-primary" type="button" id="searchBtn"
												style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px;"
												data-card-widget="search"
												onclick="pbhtList_go('1','<%=request.getContextPath()%>/rest-main/pbht-list')">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
								</div>
							</div>
							<!-- /.card-header -->
							
							<!-- /.card-body -->
							<%@ include file="./main-pbht-list.jsp" %>
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_11">
						<div class="card col-md-12"
							style="position: relative; left: 0px; top: 0px; margin-bottom: 0px;">
							<div class="card-header ui-sortable-handle" style="cursor: move; width: 400px;">
								<div class="input-group float-left" style="">
									<select class="form-control " name="searchType2hs" id="searchType2hs" style="width: 30px;">
										<option value="" ${pageMaker.cri.searchType2 eq '' ? 'selected':''}>검색구분</option>
										<option value="name"
											${pageMaker.cri.searchType2 eq 'name' ? 'selected':''}>기관명</option>
										<option value="adres"
											${pageMaker.cri.searchType2 eq 'adres' ? 'selected':''}>주소</option>
									</select>
										<input class="form-control" type="text" name="keywordhs"
											value="${pageMaker.cri.keyword }"
											style="width: 90px; display: inline-block;" />
										<span class="input-group-append">
											<button class="btn btn-primary" type="button" id="searchBtn"
												style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px;"
												data-card-widget="search"
												onclick="hsptList_go('1','<%=request.getContextPath()%>/rest-main/hspt-list')">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
								</div>
							</div>
							<!-- /.card-header -->
							
							<%@ include file="./main-hspt-list.jsp" %>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.tab-pane -->
					<div class="tab-pane" id="tab_12">
						<div class="card col-md-12"
							style="position: relative; left: 0px; top: 0px; margin-bottom: 0px;">
							<div class="card-header ui-sortable-handle" style="cursor: move; width: 400px;">
								<div class="input-group float-left" style="">
									<select class="form-control " name="searchType2lt" id="searchType2lt" style="width: 30px;">
										<option value="" ${pageMaker.cri.searchType2 eq '' ? 'selected':''}>검색구분</option>
										<option value="name"
											${pageMaker.cri.searchType2 eq 'name' ? 'selected':''}>기관명</option>
										<option value="adres"
											${pageMaker.cri.searchType2 eq 'adres' ? 'selected':''}>주소</option>
									</select>
										<input class="form-control" type="text" name="keywordlt"
											value="${pageMaker.cri.keyword }"
											style="width: 90px; display: inline-block;" />
										<span class="input-group-append">
											<button class="btn btn-primary" type="button" id="searchBtn"
												style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px;"
												data-card-widget="search"
												onclick="ltctList_go('1','<%=request.getContextPath()%>/rest-main/ltct-list')">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
								</div>
							</div>
							<!-- /.card-header -->
							
							<!-- /.card-body -->
							<%@ include file="./main-ltct-list.jsp" %>
						</div>
					</div>
					<!-- /.tab-pane -->
				</div>
				<!-- /.tab-content -->
			</div>
		</div>
		<!-- ./card -->
<!-- 메인 기관관리 div 끝 -->
<!-- 메인 데이터백업 div 시작 -->
		<div class="col-3">
			<div class="card card-default">
				<div class="card-header ui-sortable-handle" style="padding-bottom: 23px;">
					<span class="card-title" style="font-weight: bold;">
						<i class="far fa-copy"></i> 데이터 백업</span>
				</div>
				<!-- /.card-header -->
				<div class="card-body"
					style="padding-bottom: 50px; padding-top: 30px; height: 362px;">
					<div>
						<button type="button" onclick="location.href='<%=request.getContextPath()%>/admin/inspDataBackup'" style="margin-left:23px; background:#1a4f72; width: 220px;" class="btn btn-secondary">검사소 데이터 백업</button>
						<br> <br>

						<button type="button" onclick="location.href='<%=request.getContextPath()%>/admin/pbhtDataBackup'" style="margin-left:23px; background:#1a4f72; width: 220px;" class="btn btn-secondary">보건소 데이터 백업</button>
						<br> <br>

						<button type="button" onclick="location.href='<%=request.getContextPath()%>/admin/hsptDataBackup'" style="margin-left:23px; background:#1a4f72; width: 220px;" class="btn btn-secondary">병원 데이터 백업</button>
						<br> <br>

						<button type="button" onclick="location.href='<%=request.getContextPath()%>/admin/ltctDataBackup'" style="margin-left:23px; background:#1a4f72; width: 220px;" class="btn btn-secondary">생활치료센터 데이터
							백업</button>
						<br> <br>

						<button type="button" onclick="location.href='<%=request.getContextPath()%>/admin/pstiDataBackup'" style="margin-left:23px; background:#1a4f72; width: 220px;" class="btn btn-secondary">피검자 백업</button>
					</div>
				</div>
			</div>
			<!-- /.card-body -->
		</div>
	</div>
<!-- 메인 데이터백업 div 끝 -->
	<script>
		
		/* function selectAll(checkBox){
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
		} */
		function fileDown_go(){
			//alert("눌림");
			location.href='<%=request.getContextPath()%>/admin/loginFileDownload';
		}
		
		function failFileDown_go(){
			//alert("눌림");
			location.href='<%=request.getContextPath()%>/admin/loginFailFileDownload';
		}
		
		
		function deleteInst(){
			var deleteValues=new Array();
			$('input[type=checkbox]:checked').each(function(){
				var data = new Object();
				var test =$(this).val();
				data.instNo = test;
				deleteValues.push(data);
			});
			
			var jsonData = JSON.stringify(deleteValues);
			
			
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/eachInst-remove',
				type : 'POST',
				data : jsonData,
				contentType: 'application/json',
				dataType : 'json',
				success : function(res){
					alert(res.msg);
					location.reload();
				},
				error : function(xhr){
					alert(xhr.msg);
				}
			})
		}
		
		
		
</script>


</body>