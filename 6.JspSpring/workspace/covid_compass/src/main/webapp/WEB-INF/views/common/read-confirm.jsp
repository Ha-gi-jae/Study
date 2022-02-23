<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
</head>

<title></title>

<body>

	<section class="content">
		<div class="card">
			<div class="card-header" style="background-color: #1a4f72; color: white; margin-bottom: 0px;">
				<h3 class="card-title">개인정보 열람</h3>
			</div>

			<div class="card-body pb-2" style="padding-top: 10px; font-weight: 500;">
				<h3 class="title" style="font-size: 25px; text-align: center;">열람사유를 입력해주세요.</h3>
				<div class="row">
					<div class="col-sm-12">
						<textarea name="reason">
	                    </textarea>
					</div>
				</div>
				<div class="row" style="padding-top: 10px;">
					<div class="col-sm-6">
						<button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" class="btn btn-block btn-primary">확인</button>
					</div>
					<div class="col-sm-6">
						<button style="background-color: #1a4f72; border-color: #1a4f72;" type="button" class="btn btn-block btn-primary">취소</button>
					</div>
				</div>
			</div>

		</div>
	</section>


</body>