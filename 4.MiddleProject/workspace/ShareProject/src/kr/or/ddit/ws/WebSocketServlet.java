package kr.or.ddit.ws;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint(value = "/websocket", configurator = GetHttpSessionConfigurator.class)

public class WebSocketServlet {

	// 웹소켓 접속자의 EndpointConfig객체를 담기 위한 맵객체
	private static Map<Session, EndpointConfig> clientsMap = Collections.synchronizedMap(new HashMap<>());

	public WebSocketServlet() {
		log("WebSocketServlet() 생성자 호출됨...");
		
	}

	
	@OnOpen
	public void afterConnectionEstablished(Session session, EndpointConfig config) throws Exception {

		// EndpointConfig의 클래스를 위 맵에 넣는다.
		if (!clientsMap.containsKey(session)) {
			// userSession 클래스는 connection이 될 때마다 인스턴스 생성되는 값이기 때문에 키로서 사용할 수 있다.
			clientsMap.put(session, config);
		}

		log("웹소켓 세션ID(" + session.getId() + ") 연결됨.");
		log("총 접속자 수 : " + clientsMap.size());
	}

	@OnClose
	public void afterConnectionClosed(Session session) throws Exception {
		log("웹소켓 세션ID(" + session.getId() + ") 연결 종료됨...");
		
		clientsMap.remove(session); // 맵에서 제거하기
		
		log("총 접속자 수 : " + clientsMap.size());
	}
	

	@OnMessage
	public void handleTextMessage(Session session, String message) throws Exception {

		// 위 맵으로 부터 userSession을 키로 EndpointConfig값을 가져온다.
		if (clientsMap.containsKey(session)) {
			EndpointConfig config = clientsMap.get(session);
			// HttpSessionConfigurator에서 설정한 session값을 가져온다.
			HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());

			log("메시지 전송한 사용자의 HTTP세션 정보 가져오기 테스트 중... : " + httpSession.getAttribute("userName"));
		}

		log("웹소켓 세션ID(" + session.getId() + ")로부터 수신된 메시지 : " + message);

		for(Map.Entry<Session, EndpointConfig> entry: clientsMap.entrySet()) {
			Session clientSession = entry.getKey();
			
			// 메시지 전송할 대상자가 접속한 상태이고, 대상자의 웹소켓 세션ID가 현재 요청한 웹소켓 세션ID와 일치하는가...(나에게는 보내지 않기 위해 체크함.)
			if(clientSession.isOpen() && !clientSession.getId().equals(session.getId())) {
				clientSession.getBasicRemote().sendText(message); // 메시지 전송
				log(clientSession.getId() + "에 메시지 발송 : " + message);
			}
		}
	}

	@OnError
	public void handleTransportError(Session session, Throwable exception) throws Exception {
		log(session.getId() + "익셉션 발생: " + exception.getMessage());
	}

	/**
	 * 로깅처리 메서드
	 * @param logMsg
	 */
	private void log(String logMsg) {
		System.out.println(new Date() + " : " + logMsg);
	}
	
} //WebSocketServlet
