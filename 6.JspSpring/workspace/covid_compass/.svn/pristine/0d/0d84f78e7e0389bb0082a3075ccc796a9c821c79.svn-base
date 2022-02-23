<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<nav aria-label="Navigation">
	<ul class="pagination justify-content-center m-0">
		<li class="page-item">
			<a class="page-link" href="javascript:list_go(1);">
				<i class="fas fa-angle-double-left"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : pageMaker.cri.page }');">
				<i class="fas fa-angle-left"></i>
			</a>
		</li>
		<c:forEach var = "pageNum" begin = "${pageMaker.startPage }" end="${pageMaker.endPage }">
			<li class="page-item ${pageMaker.cri.page == pageNum ? 'active':'' }">
				<a class="page-link" href="javascript:list_go('${pageNum }');">${pageNum }</a>
			</li>
		</c:forEach>
		<li class="page-item">
			<a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 : pageMaker.cri.page }');">
				<i class="fas fa-angle-right"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:list_go('${pageMaker.realEndPage }');">
				<i class="fas fa-angle-double-right"></i>
			</a>
		</li>  						
	</ul>
</nav>


<form id="pbhtJobForm">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="pbht" />
	<input type='hidden' name="searchType2" value="" />
	<input type='hidden' name="keyword" value="" />
</form>
<script>
	function list_go(page,url){
		if(!url) url = "pbht-list";
		
		var pbhtJobForm = $('#pbhtJobForm');
		
		pbhtJobForm.find("[name='page']").val(page);
		pbhtJobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
		pbhtJobForm.find("[name='searchType2']").val($('select[name="searchType2"]').val());
		pbhtJobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
		pbhtJobForm.attr({
			action : url,
			method : 'get'
		}).submit();
	}
</script>