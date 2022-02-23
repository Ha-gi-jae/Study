<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head></head>
<title></title>

<body>
	<section class="content">
		<div class="row" style="margin: 1px; margin-top: 5px;">
			<div class="col-lg-6 pl-0">
				<section class="content">
			<div class="card" style="margin: 1px; height: 763px; margin-top: 13px;">
						<div class="card-header d-flex p-0">
							<ul class="nav nav-pills ml-auto p-2" role="tablist">
								<li class="nav-item"><div class="input-group float-right" style="max-width: 600px; width:300px;">
					<!-- search bar -->
					<select class="form-control " name="searchType" id="searchType">
						<option value="" ${pageMaker.cri.searchType eq '' ? 'selected':''}>검색구분</option>
						<option value="n"
							${pageMaker.cri.searchType eq 'n' ? 'selected':''}>성 명</option>
						<option value="p"
							${pageMaker.cri.searchType eq 't' ? 'selected':''}>연락처</option>
					</select>

					<!-- keyword -->
					<input class="form-control" type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword }" style="width: 18%; display: inline-block;" />
					<span class="input-group-append">
						<button class="btn btn-primary" type="button" id="searchBtn" style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px;" data-card-widget="search"
						onclick="list_go(1, '<%=request.getContextPath()%>/rest-ltct/res-list');">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
					<!-- end : search bar -->
				</div></li>
							</ul>
						</div>
						<div class="card-body">
							<div class="tab-content" id="custom-tabs-three-tabContent">
								<div class="tab-pane fade show active" id="custom-psti-detail"
									role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
									<%@ include file="./res-list-module-work.jsp"%>
								</div>
							</div>
						</div>
						<!-- /.card -->
					</div>
			
			</section>
				
			</div>
			<div class="col-lg-6 pr-0">
				<section class="content">
					<div class="card" style="margin: 1px; height: 763px; margin-top: 13px;">
						<div class="card-body">
						 <table class="table table-bordered" style="border-left-color: white; border-right-color: white;">
							<thead>
								<tr>
									<th style="font-size: 17px;">
										<div class="row m-0" style="justify-content: space-between;">
				                    		<label style="font-size: 17px; margin: 0px;">재검결과 상세정보</label>
				                    		<button type="button" class="btn btn-sm btn-primary" id="enableReadRrn" onclick="enableReadRrn(this);" data-enable="N" data-rrn="" data-manageNo="">개인정보 열람</button>
				                    	</div>
									</th>
								</tr>
							</thead>
								<tr class="ddoing" style="height: 12px; border : 1px solid white;"></tr>
						 </table>
									<%@ include file="./res-detail-module-work.jsp"%>
						</div>
						<!-- /.card -->
					</div>
					<!-- search bar -->
				</section>
			</div>


		</div>
		<!-- /.card-body -->
	</section>

</body>