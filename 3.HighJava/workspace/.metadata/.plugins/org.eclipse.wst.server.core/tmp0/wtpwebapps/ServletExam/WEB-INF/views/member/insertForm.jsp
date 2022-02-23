<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>신규회원 등록</title>
		<style>
			table{
				border : 2px solid black;
				border-collapse : collapse;
				text-align : center;
			}
			td{
				width : 150px;
				height : 30px;
			}
		</style>
	</head>
	<body>
		<form action="insert.do" method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td>ID</td>
					<td><input type="text" name="memId"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="memName"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="memTel"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="memAddr"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<!-- <td><input type="file" name="atchFile"></td> --><!-- 파일 하나만 업로드 -->
					<td><input type="file" name="atchFile" multiple></td><!-- 파일 여러개 업로드 -->
				</tr>
			</table>
			<br>
			<input type="submit" value="회원 등록">
		</form>
	</body>
</html>