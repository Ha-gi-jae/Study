<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head></head>

<title></title>

<body>

<script>
var mberCode = '${loginUser.mberCode}';
if(mberCode == 'B101' || mberCode == 'B121'){
	location.href="<%=request.getContextPath()%>/indexPage?mCode=M020000";
}
if(mberCode == 'B102' || mberCode == 'B122'){
	location.href="<%=request.getContextPath()%>/indexPage?mCode=M030000";
}
if(mberCode == 'B103' || mberCode == 'B123'){
	location.href="<%=request.getContextPath()%>/indexPage?mCode=M040000";
}
if(mberCode == 'B104' || mberCode == 'B124'){
	location.href="<%=request.getContextPath()%>/indexPage?mCode=M050000";
}
if(mberCode == 'B125'){
	location.href="<%=request.getContextPath()%>/indexPage?mCode=M060000";
}
</script>

</body>
