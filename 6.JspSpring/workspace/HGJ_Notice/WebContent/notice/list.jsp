<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="noticeList" value="${dataMap.noticeList }"/>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<title>공지사항목록</title>

<head></head>

<body>
	 <!-- Main content -->
	   <!-- Content Wrapper. Contains page content  -->
<div>
	<section class="content-header">
	  	<div class="container-fluid">
	  		<div class="row md-2">
	  			<div class="col-sm-6">
	  				<h1>공지사항목록</h1>  				
	  			</div>
	  			<div class="col-sm-6">
	  				<ol class="breadcrumb float-sm-right">
			        <li class="breadcrumb-item">
			        	<a href="list.do">
				        	<i class="fa fa-dashboard"></i>공지사항
				        </a>
			        </li>
			        <li class="breadcrumb-item active">
			        	목록
			        </li>		        
	    	  </ol>
	  			</div>
	  		</div>
	  	</div>
	</section>
	 
   	<section class="content">
   		<div class="card">
   			<div class="card-header with-border">
   				<button type="button" class="btn btn-primary" onclick="OpenWindow('regist','게시글등록',800,900);" >회원등록</button>
   				<div id="keyword" class="card-tools" style="width:550px;">
   					 <div class="input-group row">
   					 	<!-- search bar -->
   					 	
   					 	 <!-- sort num -->
					  	<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
					  		<option value="10">정렬개수</option>
					  		<option value="20" ${pageMaker.cri.perPageNum == 20 ? 'selected' : '' }>20개씩</option>
					  		<option value="30" ${pageMaker.cri.perPageNum == 30 ? 'selected' : '' }>30개씩</option>
					  		<option value="50" ${pageMaker.cri.perPageNum == 50 ? 'selected' : '' }>50개씩</option> 
					  	</select>
					  	
					  	  <!-- search bar -->
					 	<select class="form-control col-md-3" name="searchType" id="searchType">	
					 		<option value="" ${pageMaker.cri.searchType eq '' ? 'selected': '' }>검색구분 </option>
					 		<option value="writer" ${pageMaker.cri.searchType eq 'writer' ? 'selected': '' }>작성자</option>
					 		<option value="title" ${pageMaker.cri.searchType eq 'title' ? 'selected': '' }>제목</option>
					 		<option value="content" ${pageMaker.cri.searchType eq 'content' ? 'selected': '' }>내용</option>
					 		<option value="writer_content" ${pageMaker.cri.searchType eq 'writer_content' ? 'selected': '' }>작성자+제목</option>
					 		<option value="title_content" ${pageMaker.cri.searchType eq 'title_content' ? 'selected': '' }>제목+내용</option>
					 		<option value="writer_title_content" ${pageMaker.cri.searchType eq 'writer_title_content' ? 'selected': '' }>작성자+제목+내용</option>
						</select>
						<!-- keyword -->
   					 	<input  class="form-control" type="text" name="keyword" 
										placeholder="검색어를 입력하세요." value="${pageMaker.cri.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" 
									id="searchBtn" data-card-widget="search" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					<!-- end : search bar -->		
   					 </div>
   				</div>   			
   			</div>
   			<div class="card-body" style="text-align:center;">
    		  <div class="row">
	             <div class="col-sm-12">	
		    		<table class="table table-bordered">
		    			<tr>
		                	<th>번호</th>
		                	<th>제목</th>
		                	<th>작성자</th>
		                	<th>작성일</th>
		                	<th>조회수</th> <!-- yyyy-MM-dd  -->
		               	</tr>
		               	<c:if test="${empty noticeList }">
		               		<tr>
		               			<td colspan="5" class="text-center">
		               				해당내용이 없습니다.
		               			</td>
		               		</tr>
		               	</c:if>
		               	
		               	<c:if test="${!empty noticeList }">
		               		<c:forEach items="${requestScope.pointNotice }" var="point">
		               			<tr onclick="OpenWindow('detail?no=${point.nno}','','800','900');" style="cursor:pointer; border:2px solid red;">
		               				<td>${point.nno }</td>
		               				<td>${point.title }</td>
		               				<td>${point.writer }</td>
		               				<td><fmt:formatDate value="${point.regdate }" pattern="yyyy-MM-dd"/></td>
		               				<td>${point.viewcnt }</td>
		               			</tr>
		               		</c:forEach>
		               	
		               		<c:forEach items="${noticeList }" var="notice">
		               			<tr onclick="OpenWindow('detail?no=${notice.nno}','','800','900');" style="cursor:pointer;">
		               				<td>${notice.nno }</td>
		               				<td>${notice.title }</td>
		               				<td>${notice.writer }</td>
		               				<td><fmt:formatDate value="${notice.regdate }" pattern="yyyy-MM-dd"/></td>
		               				<td>${notice.viewcnt }</td>
		               			</tr>
		               		</c:forEach>
		               	</c:if>
		               	
		            </table>
    		     </div> <!-- col-sm-12 -->
    	       </div> <!-- row -->
    		</div> <!-- card-body -->
    		<div class="card-footer">
    			<%@ include file="/common/pagination.jsp" %>
    		</div>
	     </div>
   	</section>

</body>
