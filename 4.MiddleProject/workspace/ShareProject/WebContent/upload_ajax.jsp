<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Ajax를 이용한 File Upload 예제</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function () {

    $("#btnSubmit").click(function (event) {

        //stop submit the form, we will post it manually.
        event.preventDefault();

        // Get form
        var form = $('#fileUploadForm')[0];

        // Create an FormData object
        var data = new FormData(form);

        // If you want to add an extra field for the FormData
        data.append("CustomField", "This is some extra data, testing");

        // disabled the submit button
        $("#btnSubmit").prop("disabled", true);

        // 전송시작
        $.ajax({
            type: "POST",
            //enctype: 'multipart/form-data',
            url: "upload2",
            data: data,
            processData: false, //필수
            contentType: false, // 필수
            cache: false,
            timeout: 600000,
            success: function (data) {

                $("#result").text(data);
                console.log("SUCCESS : ", data);
                $("#btnSubmit").prop("disabled", false);

            },
            error: function (e) {

                $("#result").text(e.responseText);
                console.log("ERROR : ", e);
                $("#btnSubmit").prop("disabled", false);

            }
        });

    });

});
</script>
</head>

<body>
   <h3>아파치 자카르타 프로젝트의 fileupload 모듈을 이용한 파일업로드(AJAX버전)</h3>
    <form id="fileUploadForm" method="post" action="upload2" enctype="multipart/form-data">
        파일선택: <input type="file" name="uploadFile" multiple="multiple"/>
        전송자: <input type="text" name="sender">
        <input id="btnSubmit" type="submit" value="Upload"/>
    </form>
    <div id="result">
    </div>
</body>
</html>