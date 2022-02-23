<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<script type="text/javascript">
function doExcelUploadProcess(){
	var f = new FormData(document.getElementById('form1'));
	$.ajax({
		url: "uploadExcelFile",
		data: f,
		processData: false,
		contentType: false,
		type: "POST",
		success: function(data){
			console.log(data);
			document.getElementById('result').innerHTML = JSON.stringify(data);
		},
		error: function(xhr){
			alert(xhr.status);
		}
	})
}

function doExcelDownloadProcess(){
	var f = document.form1;
	f.action = "downloadExcelFile";
	f.submit();
}
</script>
<form id="form1" name="form1" method="post" enctype="multipart/form-data">
<input type="file" id="fileInput" name="fileInput">
<button type="button" onclick="doExcelUploadProcess()">엑셀업로드 작업</button>
<button type="button" onclick="doExcelDownloadProcess()">엑셀 다운로드 작업</button>
</form>
<div id="result"></div>
</body>
</html>