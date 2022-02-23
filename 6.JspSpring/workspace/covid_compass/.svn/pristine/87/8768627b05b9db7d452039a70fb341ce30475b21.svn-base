<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
								<li class="nav-item" style="margin-right: 10px;">
								<button type="button" class="btn btn-primary" 
										style="background: #1a4f72; border: 0px; width: 90px; margin-top: 1px;" 
										onclick="OpenWindow('./inst-registForm','','600','600')">기관등록</button>
								<button type="button" class="btn btn-primary" 
										style="background: #c82333; border: 0px; width: 90px; margin-right: 10px; margin-top: 1px;" 
										onclick="deleteInst()">기관삭제</button>
   								</li>
   								
								<li class="nav-item"><div class="input-group float-right" style=" width:400px;">
					<!-- search bar -->
					<select class="form-control " name="searchType" id="searchType" style="width: 40px;">
						<option value="" ${pageMaker.cri.searchType eq '' ? 'selected':''}>검색구분</option>
						<option value="allInst"
							${pageMaker.cri.searchType eq 'allInst' ? 'selected':''}>전체</option>
						<option value="insp"
							${pageMaker.cri.searchType eq 'insp' ? 'selected':''}>검사소</option>
						<option value="pbht"
							${pageMaker.cri.searchType eq 'pbht' ? 'selected':''}>보건소</option>
						<option value="hspt"
							${pageMaker.cri.searchType eq 'hspt' ? 'selected':''}>병원</option>
						<option value="ltct"
							${pageMaker.cri.searchType eq 'ltct' ? 'selected':''}>생활치료센터</option>
					</select>
					
					<select class="form-control " name="searchType2" id="searchType2" style="width: 40px;">
						<option value="" ${pageMaker.cri.searchType2 eq '' ? 'selected':''}>검색구분</option>
						<option value="name"
							${pageMaker.cri.searchType2 eq 'name' ? 'selected':''}>기관명</option>
						<option value="adres"
							${pageMaker.cri.searchType2 eq 'adres' ? 'selected':''}>주소</option>
					</select>
					
					<!-- keyword -->
					<input class="form-control" type="text" name="keyword"
						value="${pageMaker.cri.keyword }"
						style="width: 18%; display: inline-block;" /> 
					<span class="input-group-append">
						<button class="btn btn-primary" type="button" id="searchBtn"
							style="background: #1a4f72; color: #ffffff; border-color: #1a4f72; display: inline-block; margin-bottom: 4px;"
							data-card-widget="search" onclick="list_go('1','<%=request.getContextPath()%>/rest-inst/inst-list')">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
					<!-- end : search bar -->
				</div></li>
							</ul>
            </div>
            <div class="card-body" style="padding: 15px;">
              <div class="tab-content" id="custom-tabs-three-tabContent">
                <div class="tab-pane fade show active" id="custom-psti-detail" role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
                  <%@ include file="./inst-detail-left.jsp"%>
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
						<div class="d-flex p-0">
							<table class="table table-bordered" style="border-left-color: white; border-right-color: white; margin-bottom: 0px;">
									<tr>
										<th colspan="4" style="font-size: 17px;">기관상세</th>
									</tr>
									<!-- <tr class="ddoing" style="height: 12px; border: none;"></tr> -->
							</table>
						</div>
						<div class="card-body">
							<div class="tab-content" id="custom-tabs-three-tabContent">
								<div class="tab-pane fade show active" id="custom-inptnt-detail"
									role="tabpanel" aria-labelledby="custom-tabs-three-home-tab">
									<%@ include file="./inst-detail-right.jsp"%>
								</div>
							</div>
						</div>
						<!-- /.card -->
					</div>
					<!-- search bar -->
				</section>
			</div>


		</div>
		<!-- /.card-body -->
	</section>
	<script>
		function deleteInst(){
			var len=$('input[name=instCheckBox]:checked').length;
			if(len == 0){
				alert("기관을 선택해주세요.");
				return;
			}
			
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
