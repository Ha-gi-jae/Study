<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head></head>

<title></title>

<body class="hold-transition sidebar-mini">
   <section class="content">
      <div class="card card-success" style="margin-top: 15px;">
               <div class="card-body" style="height: 750px;">
               <form role="form" action="notice-modify" method="post" enctype="multipart/form-data">
		               	<input type="hidden" id="deleteFileName" name="deleteFileName" value="${fileName}">
		                <input type="hidden" id="deleteFileCheck" name="deleteFileCheck" value="NO">
                  <div class="form-group">
                  	 <input type="hidden" name="noticeNo" value="${notice.noticeNo }">
                     <label for="inputTitle">제목</label> 
                     <input type="text" id="inputTitle" name="noticeTitle" class="form-control" value="${notice.title }">
                  </div>

                  <div class="form-group">
                     <label for="inputWriter">작성자</label> <input type="text"
                        id="inputWriter" class="form-control" name="noticeWriter"  value="${notice.writer }">
                  </div>
					
                  <div class="form-group" style="margin-top: 1%;">
                     <label for="inputDescription">내용</label>
                     <textarea name="noticeContent" id="summernote" style="height: 320px;" class="form-control" rows="3"
                        placeholder="내용" >${notice.content}</textarea>
                  </div>

                  <div class="form-group" style="border: none;">
                     <label for="inputClientCompany">첨부된 파일</label><br>
                     <input type="file" id="noticeModifyFile" name="noticeModifyFile" onclick="checkFiles()">

                     
                     <div class="fileGroup">
                     <input type="hidden" value="${originalFileName }" name="noticeModifyFile" id="hiddenFile">
                     <a href="getFile?fileName=${fileName}"><span style="font-weight: bold;">${originalFileName}</span></a> 
                     <%-- <input type="text" id="inputFile" style="border: none; display: block;" value="${fileName}"> --%>
                     <c:if test="${fileName ne null }">
                     <button type="button" onclick="removeFile_go();" style="border:0;outline:0;" 
																	class="badge bg-red">X</button>
					</c:if>	
					</div>
                  </div>

                  <div class="form-group" style="border: none; text-align: right;">
                     <button type="button" onclick="modify_go()" class="btn btn-success" style=" border-color:#1A4F72; background: #1A4F72;">수정</button>
                     <button type="button" class="btn btn-success"
                        style="margin-left: 1%; border-color:#1A4F72; background: #1A4F72;"
                        onclick="location.href='<%=request.getContextPath()%>/admin/notice-detail?noticeNo=${notice.noticeNo}'">취소</button>
                  </div>

               </form>
               </div>
               
               <!-- /.card-body -->
               <!-- /.card -->


      </div>
      <!-- /.col-->
   </section>
	
	<script>
		window.onload = function() {
			// Summernote
			$('#summernote').summernote({
				height : 320
			})
		}
		function removeFile_go(){
			$('div[class="fileGroup"]').remove();
			$('#noticeModifyFile').removeAttr('disabled');
			
			var check=$('#deleteFileCheck').val();
			$('#deleteFileCheck').val("YES");
			check=$('#deleteFileCheck').val();
			
		}
		function checkFiles(){
			var checkData=$('#hiddenFile').val();
			if(checkData){
				alert("기존 파일을 삭제해주세요.");
				$('#noticeModifyFile').attr('disabled','disabled');
				return;
			}
		}
		function modify_go(){
			$('form[role="form"]').submit();			
			
		}
		
	</script>
	
</body>