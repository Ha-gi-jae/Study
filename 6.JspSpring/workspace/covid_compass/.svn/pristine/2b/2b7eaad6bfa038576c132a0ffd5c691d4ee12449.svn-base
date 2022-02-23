<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/x-handlebars-template" id="page-info-template">
		<div class="page-info">
			<span>page : {{page}}, {{startRowNum}} - {{endRowNum}} / {{totalCount}}</span>
		</div>
</script>

<script>
function printPageInfo(pageMaker, target, templateObject){
  
  pageMaker.page = pageMaker.cri.page;
  pageMaker.startRowNum = pageMaker.cri.startRowNum;
  pageMaker.endRowNum =   pageMaker.cri.endRowNum < pageMaker.totalCount 
              ? pageMaker.cri.endRowNum 
              : pageMaker.totalCount;
  
  var template = Handlebars.compile(templateObject.html());
  var html = template(pageMaker);
  target.html("").html(html);
  
}
</script>