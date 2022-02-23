<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><decorator:title default="HeHe System" /></title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- DataTables -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<!-- summernote -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
<!-- CodeMirror -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/codemirror/codemirror.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/codemirror/theme/monokai.css">
<!-- SimpleMDE -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/simplemde/simplemde.min.css">
<decorator:head />
<style>
button {
	background: #1a4f72;
}
.on{
	background-color: rgb(236, 236, 236);
}
</style>

</head>
<body class="hold-transition">
	<div class="wrapper" style="max-width: 1280px; margin: 0 auto;">

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light" style="padding-right: 0;">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" data-widget="pushmenu" href="#" role="button">
						<i class="fas fa-bars"></i>
					</a>
				</li>
			</ul>
			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">

				<!-- 로그인 확인  -->
				<li class="nav-item">
					<div class="user-panel mt-3 d-flex">
						<div class="media">
							<i class="fas fa-clipboard fa-3x" style="margin-right: 15px; color: #5b6f90;"></i>
							<div class="media-body">
								<p class="dropdown-item-title">
									<b>테스트</b>님 안녕하세요.
								</p>
								<span class="float-right text-sm text-danger"></span> <input class="btn btn-block btn-primary btn-xs" style="background-color: #5bbc71; border-color: #5bbc71;" type="button" value="로그아웃" />
							</div>
						</div>
					</div>
					<aside class="main-sidebar sidebar-dark-primary elevation-4" style="background-color: #5b6f90;">
						<!-- Brand Logo -->
						<div class="brand-link mt-2 pb-3 mb-3 d-flex" 
									style="
									background:url(<%=request.getContextPath()%>/resources/bootstrap/dist/img/compass.jpg);
									background-size:cover;
									background-position:center;
									background-repeat:no-repeat;
									height:97px;
							">
						</div>
						<c:if test="${!empty loginUser }">
							<div class="user-panel mt-3 pb-3 mb-3 d-flex">
								<div class="image">
									<img src="<%=request.getContextPath() %>/member/getPicture.do?picture=${loginUser.picture}" class="img-circle elevation-2" alt="User Image">
								</div>

								<div class="info">
									<div class="row">
										<a href="javascript:OpenWindow('<%=request.getContextPath() %>/member/detail.do?id=${loginUser.id }','내정보', '800', '700');" class="d-block">${loginUser.name}</a>
										&nbsp;&nbsp;
										<button onclick="location.href='<%=request.getContextPath()%>/common/logout.do';" class="btn btn-xs btn-primary col-xs-3" type="button">LOGOUT</button>
									</div>
									<a href="tel:${loginUser.phone}">tel : ${loginUser.phone }</a>
									<br>

									<a href="mailto:${loginUser.email }">email : ${loginUser.email }</a>
								</div>
							</div>
						</c:if>
					</aside>
				</li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->

		<!-- Sidebar -->
		<div class="sidebar">
			<!-- Sidebar user panel (optional) -->

			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column subMenuList" data-widget="treeview" role="menu" data-accordion="false">
					<!-- Add icons to the links using the .nav-icon classwith font-awesome or any other icon font library -->
					<li class="nav-item subMenu">
						<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
							<div style="display: inline-block; width: 50px">
								<i class="fas fa-user fa-2x"></i>
							</div>
							<h7> <b>피검자 조회</b></h7>
						</a>
					</li>
					<li class="nav-item subMenu">
						<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
							<div style="display: inline-block; width: 50px">
								<i class="fas fa-ambulance fa-2x"></i>
							</div>
							<h7> <b>시료 요청</b></h7>

						</a>
					</li>
					<li class="nav-item subMenu">
						<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
							<div style="display: inline-block; width: 50px">
								<i class="fas fa-check-circle fa-2x"></i>
							</div>
							<h7> <b>결과조회</b></h7>
						</a>
					</li>
					<li class="nav-item subMenu">
						<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
							<div style="display: inline-block; width: 50px">
								<i class="far fa-envelope fa-2x"></i>
							</div>
							<h7> <b>SMS</b></h7>
						</a>
					</li>
					<li class="nav-item subMenu">
						<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
							<div style="display: inline-block; width: 50px">
								<i class="fas fa-poll fa-2x"></i>
							</div>
							<h7> <b>통계</b></h7>
						</a>
					</li>

					<li class="nav-item subMenu">
						<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
							<div style="display: inline-block; width: 50px">
								<i class="fas fa-bell fa-2x"></i>
							</div>
							<h7> <b>공지사항</b></h7>
						</a>
					</li>

					<li class="nav-item subMenu">
						<a href="javascript:go_back();" class="nav-link">
							<div style="display: inline-block; width: 50px">
								<i class="fas fa-qrcode fa-2x"></i>
							</div>
							<h7> <b>QR문진표</b></h7>
						</a>
					</li>

					<li class="nav-item subMenu">
						<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
							<div style="display: inline-block; width: 50px">
								<i class="fas fa-address-card fa-2x"></i>
							</div>
							<h7> <b>직원관리</b></h7>
						</a>
					</li>

					<li class="nav-item subMenu">
						<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
							<div style="display: inline-block; width: 50px">
								<i class="fas fa-user-cog fa-2x"></i>
							</div>
							<h7> <b>내정보</b></h7>
						</a>

					</li>
				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
			<div class="p-3">
				<h5>Title</h5>
				<p>Sidebar content</p>
			</div>
		</aside>
		<!-- /.control-sidebar -->
	</div>