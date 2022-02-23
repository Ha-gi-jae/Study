
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session.setAttribute("userName", "HONG KILDONG"); // 세션정보 가져오기 테스트용...
%>
<!DOCTYPE html>
<html>
<head>
<title>Web Socket 예제</title>
<script src="./js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="./css/wsStyle.css">
</head>


<body>
	<div id="container">
		<aside>
			<header>
				<!-- 유저 명을 입력하는 텍스트 박스 -->
				<input id="user" type="text" placeholder="대화명을 입력하세요.">
			</header>
			<ul id="idList">
				<li>접속 중인 클라이언트</li>
			</ul>
		</aside>

		<main> 
			<!-- 메세지 출력 창 -->
			<textarea id="messageTextArea" rows="20" cols="32"></textarea>
			<!-- 송신 메시지를 작성하는 텍스트 박스 --> 
			<textarea wrap="on" id="textMessage" rows="5" cols="20"></textarea>
			<!-- 메세지를 송신하는 버튼 --> 
			<input id="sendBtn" onclick="sendMessage()" value="Send" type="button"> 
			
			<footer>
				<!-- WebSocket 접속 종료하는 버튼 -->
				<input id="disconBtn" onclick="disconnect()" value="Disconnect" type="button">
			</footer> 
		</main>
	</div>




	<!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
	<script type="text/javascript">
	
    // 「WebSocketEx」는 프로젝트 명
    // 「broadsocket」는 호스트 명
    // WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
    var webSocket = new WebSocket("ws://192.168.43.50/ShareProject/websocket");
    // 콘솔 텍스트 에리어 오브젝트
    var messageTextArea = document.getElementById("messageTextArea");
    // WebSocket 서버와 접속이 되면 호출되는 함수
    webSocket.onopen = function(message) {
      // 콘솔 텍스트에 메시지를 출력한다.
      messageTextArea.value += "Server에 연결됨.\n";
    };
    
    
    // WebSocket 서버와 접속이 끊기면 호출되는 함수
    webSocket.onclose = function(message) {
      // 콘솔 텍스트에 메시지를 출력한다.
      messageTextArea.value += "접속 끊김.\n";
    };
    
    
    // WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
    webSocket.onerror = function(message) {
    // 콘솔 텍스트에 메시지를 출력한다.
    messageTextArea.value += "에러발생..\n";
    };
    
    
    /// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
    webSocket.onmessage = function(message) {
      
    	// 콘솔 텍스트에 메시지를 출력한다.
      messageTextArea.value += message.data + "\n";
    };
    
    
    // Send 버튼을 누르면 호출되는 함수
    function sendMessage() {
    	if($('#textMessage').val() == ''){
    		alert('메세지를 작성해 주세요.');
    	} else {
    		// 유저명 텍스트 박스 오브젝트를 취득
    	      var user = document.getElementById("user");
    	      // 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
    	      var message = document.getElementById("textMessage");
    	      // 콘솔 텍스트에 메시지를 출력한다.
    	      messageTextArea.value += user.value + "(나) ▶ " + message.value + "\n";
    	    //내가 보낸 메세지가 출력될 때 자동 스크롤
    	      var scroll = document.getElementById("messageTextArea"); 
    	      scroll.scrollTop = scroll.scrollHeight; 
    	      // WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
    	      webSocket.send("[" + user.value + "] " + message.value);
    	      // 송신 메시지를 작성한 텍스트 박스를 초기화한다.
    	      message.value = "";
    	      
    	}
    }
    
    
    // Disconnect 버튼을 누르면 호출되는 함수
    function disconnect() {
      // WebSocket 접속 해제
      webSocket.close();
    }
    
	// 간지나게 엔터키 누르면 메시지 날림
	var input = document.getElementById("textMessage");
	
	input.addEventListener("keyup", function(event) {
		if (event.keyCode === 13) {
			sendMessage();
		}
	}); 
	
		
	</script>
</body>
</html>


