<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageMaker" value="${pbhtMap.pbhtPageMaker}"/>
<c:set var="cri" value="${pbhtMap.pbhtPageMaker.cri}"/>
<c:set var="pbhtList" value="${pbhtMap.pbhtList}"/>
<head></head>
<title></title>

<body>
  <section class="content">
    <div class="row" style="margin: 1px; margin-top: 7px;">
      <div class="col-lg-6 pl-0">
        <section class="content">
          <div class="card" style="margin: 1px; height: 763px; margin-top: 13px;">
				<div class="card-header d-flex p-0">
					<ul class="nav nav-pills ml-auto p-2" role="tablist">
						<li class="nav-item"><div class="input-group float-right" style="width: 400px;">
								<!-- search bar -->
								<select class="form-control " name="searchType2"
									id="searchType2" style="width: 40px;">
									<option value=""
										${pageMaker.cri.searchType2 eq '' ? 'selected':''}>검색구분</option>
									<option value="name"
										${pageMaker.cri.searchType2 eq 'name' ? 'selected':''}>이름</option>
									<option value="adres"
										${pageMaker.cri.searchType2 eq 'adres' ? 'selected':''}>주소</option>
								</select>

								<!-- keyword -->
								<input class="form-control" type="text" name="keyword"
									value="${pageMaker.cri.keyword }"
									style="width: 18%; display: inline-block;" /> <span
									class="input-group-append">
									<button class="btn btn-primary" type="button" id="searchBtn"
										style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px;"
										data-card-widget="search"
										onclick="list_go('1','<%=request.getContextPath()%>/admin/pbht-list')">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
								<!-- end : search bar -->
							</div></li>
					</ul>
				</div>
			  <div class="card-body" style="padding: 0px; height:252px;">
					<div class="table-responsive">
						<table class="table table-hover text-nowrap"
							style="text-align: center; table-layout: fixed;">
							<thead>
								<tr role="row">
									<th tabindex="0" aria-controls="example2" rowspan="1"
										style="text-align: center; width: 15%;" colspan="1" aria-label="">구분</th>
									<th tabindex="0" aria-controls="example2" rowspan="1"
										style="text-align: center; width: 30%;" colspan="1" aria-label="">기관명</th>
									<th tabindex="0" aria-controls="example2" rowspan="1"
										style="text-align: center; width: 32%;" colspan="1"
										aria-sort="ascending" aria-label="">주소</th>
									<th tabindex="0" aria-controls="example2" rowspan="1"
										style="text-align: center; width: 15%;" colspan="1" aria-label="">연락처</th>
									<th tabindex="0" aria-controls="example2" rowspan="1"
										style="text-align: center; width: 15%;" colspan="1" aria-label="">직원수</th>
								</tr>
							</thead>
							<tbody id="main-pbht-list-table-body">
							<c:if test="${empty pbhtList }">
								<td colspan="6"><strong>해당 내용이 없습니다.</strong></td>
							</c:if>
							<c:forEach items="${pbhtList}" var="pbht">
								<tr onclick="getPbhtNo('${pbht.instNm}','${pbht.pbhtNo}')" class="each-pbht-element" style="cursor: pointer;">
									<td><span class="badge badge-success">보건소</span></td>
									<td style="text-align:left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										${pbht.instNm }</td>
									<td style="text-align:left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">
										${pbht.instAdres }</td>
									<td>${pbht.instTelno }</td>
									<td>${pbht.empCnt }</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
				
					</div>
				
				</div>
				<div class="card-footer clearfix" style="background-color: white;">
					<%@ include file="/resources/js/adminPbhtPagination.jsp" %>
				</div>
            <!-- /.card -->
          </div>

        </section>

      </div>

		</div>
		<!-- /.card-body -->
	</section>
	
	<form id="pbhtJobForm">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="pbht" />
	<input type='hidden' name="searchType2" value="" />
	<input type='hidden' name="keyword" value="" />
	</form>
	<script>
		function getPbhtNo(instNm, pbhtNo) {
			window.opener.location.href='<%=request.getContextPath()%>/admin/inst-registForm?instNm='+instNm+'&pbhtNo='+pbhtNo;
			window.close();
		}
		function deleteInst(){
			if(confirm("해당 기관을 삭제하시겠습니까?")){
				var deleteValues=[];
				$('input[name=instCheckBox]:checked').each(function(){
					var test =$(this).val();
					//console.log(test);
					deleteValues.push(test);
				});
				
				location.href='<%=request.getContextPath()%>/admin/inst-remove?deleteValues='+deleteValues;
			}
			
		}
		
		
	</script>
</body>
