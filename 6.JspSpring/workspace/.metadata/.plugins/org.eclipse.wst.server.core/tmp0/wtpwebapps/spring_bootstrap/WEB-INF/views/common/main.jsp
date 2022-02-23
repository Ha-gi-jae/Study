<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<head></head>

<title></title>

<body>


	<h1>Home Page 입니다.</h1>
 	<span>저는 타이머랍니다 ^0^ :</span><span class="time"></span>

<script>

window.onload = function(){
	sessionTime();
}

var timer = null;
var isRunning = false;

function sessionTime(){
	var display = $('.time');
	var leftSec = 3600;
	
	if (isRunning){
		clearInterval(timer);
		display.html("");
		startTimer(leftSec, display);
	}else{
		startTimer(leftSec, display);
	}
}
function startTimer(count, display){
	var minutes, seconds;
	timer = setInterval(function (){
		minutes = parseInt(count / 60, 10);
		seconds = parseInt(count % 60, 10);
		
		minutes = minutes < 10 ? "0" + minutes : minutes;
		seconds = seconds < 10 ? "0" + seconds : seconds;
		display.html(minutes + ":" + seconds);
		
		if(--count < 0){
			clearInterval(timer);
			alert("세션시간이 만료되었습니다.");
			display.html("세션만료");
			isRunning = false;
		}
	}, 1000);
	isRunning = true;
}

</script>
</body>