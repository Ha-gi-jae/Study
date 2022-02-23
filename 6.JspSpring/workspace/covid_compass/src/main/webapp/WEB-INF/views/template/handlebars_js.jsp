<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/x-handlebars-template"  id="loading-template" >
<div style="justify-content : center; align-items: center; display:flex; min-height: 100vh;" class="loading-class">
<div class="col-md-5"></div>
<div class="col-md-2">
<i class="fas fa-3x fa-sync-alt fa-spin"></i>
<%-- <img src="<%=request.getContextPath() %>/resources/image/아이리나.JPG"> --%>
</div>
<div class="col-md-5"></div>
</div>
</script>