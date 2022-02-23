package kr.or.ddit.tcp;

import java.io.DataInputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class MultiChatServer {
	
	// 대화명, 클라이언트의 Socket을 저장하기 위한 Map변수 선언
	Map<String, Socket> clients;
	
	//생성자
	public MultiChatServer() {
		clients = Collections.synchronizedMap(new HashMap<String, Socket>());
	}
	
	public static void main(String[] args) {
		new MultiChatServer().serverStart();
	}
	
	// 서버 시작
	public void serverStart() {
		Socket socket = null;
		
		try(ServerSocket server = new ServerSocket(7777)){
			System.out.println("서버가 시작되었습니다.");
			while(true) {
				// 클라이언트의 접속을 대기한다.
				socket = server.accept();
				System.out.println("[" + socket.getInetAddress()
				+ " : " + socket.getPort()
				+ " ] 에서 접속하였습니다.");
				
				// 메시지 전송하는 스레드 생성 및 실행
				ServerReceiver receiver = new ServerReceiver(socket);
				receiver.start();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 서버에서 클라이언트로 메시지를 전송할 Thread를 Inner 클래스로 정의
	// Inner 클래스에서는 부모 클래스의 멤버들을 직접 사용할 수 있다.
	class ServerReceiver extends Thread{
		private Socket socket;
		private DataInputStream dis;
		private String name;
		
		public ServerReceiver(Socket socket) {
			this.socket = socket;
			
			try {
				// 수신용
				dis = new DataInputStream(socket.getInputStream());
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		@Override
		public void run() {
			super.run();
			try {
				// 서버에서는 클라이언트가 보내는 최초의 메시지 즉, 대화명을 수신해야함.
				name = dis.readUTF();
				
				// 대화명을 받아서 다른 모든 클라이언트에게 대화방 참여 메시지를 보낸다.
				sendMessage("#" + name + "님이 입장했습니다.");
				
				// 대화명과 소켓정보를 Map에 저장한다.
				clients.put(name, socket);
				System.out.println("현재 서버 접속자 수는" + clients.size() +"명 입니다.");
				
				//이 후의 메시지 처리는 반복문으로 처리한다.
				// 한 클라이언트가 보낸 메시지를 다른 모든 클라이언트에게 보내준다.
				while(dis != null) {
					sendMessage(dis.readUTF(), name);
				}
				
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}



