<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String car1 = request.getParameter("car1");
	String[] car2 = request.getParameterValues("car2");
	/*  Values를 쓸때는 배열 타입[]이 와야함 */
	
	String str = "선택한 값 <br>";
	
	if(car1 !=null){
		//out.print(car1); /* 실제 값이 나오는 것은 아니다 */
		str += car1 + "<br>";
		
	}else if(car2 != null){
		//out.print(car2);
		
		for(String car : car2){
			str += car + "<br>";
		}
	}
%>

<!-- 여기서 div를 써서 스타일 줄 수 있음. -->
<div><%= str %></div> 


   <!-- 자바문장 출력방법은 퍼센트뒤에 = 을 붙여준다.
 				JSP에서는 OUT이라는 객체로 출력을 한다. -->

</body>
</html>