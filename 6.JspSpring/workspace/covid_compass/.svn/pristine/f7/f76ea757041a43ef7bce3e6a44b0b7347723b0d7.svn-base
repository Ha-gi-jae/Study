<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head></head>

<title></title>

<body class="hold-transition sidebar-mini">
	<section class="content">
	    <div class="card" style="margin-top: 15px;">
               <!-- /.card-header -->
               <div class="card-body" style="height: auto;">
                  <div class="form-group">
                     <label for="inputTitle">제목</label> <input type="text"
                        id="inputTitle" class="form-control" readonly value="${notice.title }">
                  </div>

                  <div class="form-group">
                     <label for="inputWriter">작성자</label> <input type="text"
                        id="inputWriter" class="form-control" readonly value="${notice.writer }">
                  </div>
                  <div class="form-group">
						<label for="inputWriter">작성일</label>
						<fmt:formatDate value="${notice.wrtYmd }" pattern="yyyy-MM-dd" var="wrtYmd"/> 
						<input type="text" readonly="readonly" name="startDate" id="inputWriter" class="form-control" value="${wrtYmd}">
				  </div>
				 <%--  <c:if test="${notice.popUp eq 'Y' }">
						<div class="form-group">
							<label for="inputWriter">팝업설정</label><br>
							<div class="row">
								<div class="col-4">
									<label for="inputWriter">시작일</label>
									<fmt:formatDate value="${notice.startYmd }" pattern="yyyy-MM-dd" var="startYmd"/> 
									<input type="text" readonly="readonly" name="startDate" id="inputWriter" class="form-control" value="${startYmd}">
								</div>
								<div class="col-4">
									<label for="inputWriter">종료일</label>
									<fmt:formatDate value="${notice.endYmd }" pattern="yyyy-MM-dd" var="endYmd"/> 
									<input type="text" readonly="readonly" name="startDate" id="inputWriter" class="form-control" value="${endYmd}">
								</div>
							</div>
				  		</div>
				  </c:if> --%>
                  <div class="form-group" style="margin-top: 1%;">
                     <label for="inputDescription">내용</label>
                    <div class="card" style="border:1px solid #ced4da; background-color:#e9ecef; width: 1247px; height: 410px;">${notice.content}</div>
                  </div>

                  <div class="form-group" style="border: none;">
                  	<input type="hidden" name="attachNo" value="${attachNo}">
                     <label for="inputClientCompany">첨부된 파일</label><br>
                     <a href="getFile?fileName=${fileName}"><span style="font-weight: bold;">${originalFileName}</span></a> 
                     <%-- <input type="text" id="inputFile" style="border: none; display: block;" value="${fileName}"> --%>
                  </div>

                  <div class="form-group" style="border: none; text-align: right;">
                     <button onclick="location.href='notice-modifyForm?noticeNo=${notice.noticeNo}'"
                        class="btn btn-success" style="border-color:#1A4F72; background: #1A4F72;">수정</button>
                     <button class="btn btn-success" onclick="remove_go(${notice.noticeNo})"
                        style="margin-left: 1%; border-color:#1A4F72; background: #1A4F72;">삭제</button>
                     <button class="btn btn-success"
                        style="margin-left: 1%; border-color:#1A4F72; background: #1A4F72;"
                        onclick="location.href='<%=request.getContextPath()%>/admin/notice-list'">목록</button>
                  </div>

               </div>
               <!-- /.card-body -->
               <!-- /.card -->


      </div>
      <!-- /.col-->
	</section>
	<script>
		function remove_go(noticeNo){
			//alert(noticeNo);
			location.href='<%=request.getContextPath()%>/admin/notice-remove?noticeNo='+noticeNo;
		}
	
	</script>
	
</body>