package kr.or.ddit.hw;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class MultiChatServer {
	Map<String, Socket> clients;
	
	public MultiChatServer() {
		clients = Collections.synchronizedMap(new HashMap<String, Socket>());
	}
	
	
	public void serverStart() {
		Socket socket = null;
		
		try(ServerSocket server = new ServerSocket(7777)){
			System.out.println("서버가 시작되었습니다.");
			
			while(true) {
				socket = server.accept();
				System.out.println("[" + socket.getInetAddress() + " : " + socket.getPort() +"] 에서 접속하였습니다.");
				
				ServerReceiver receiver = new ServerReceiver(socket);
				receiver.start();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	class ServerReceiver extends Thread{
		private Socket socket;
		private DataInputStream dis;
		private String name;
		
		public ServerReceiver(Socket socket) {
			this.socket = socket;
			
			try {
				dis = new DataInputStream(socket.getInputStream());
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		@Override
		public void run() {
			super.run();
			try {
				name = dis.readUTF();
				
				sendMessage("#" + name + "님이 입장했습니다.");
				
				clients.put(name, socket);
				System.out.println("현재 서버 접속자 수는 " + clients.size() + "명 입니다.");
				
				while(dis != null) {
					sendMessage(dis.readUTF(), name);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sendMessage(name + "님이 나가셨습니다.");
				clients.remove(name);
				System.out.println("[" + socket.getInetAddress() +" : " + socket.getPort() + "] 에서 접속을 종료했습니다.");
				System.out.println("현재 접속자 수는 " + clients.size() + "명 입니다." );
			}
		}
	}
	
	public void realSendSpecial(String msg2, String from) {
		try {
			DataOutputStream dos = new DataOutputStream(clients.get(from).getOutputStream());
			dos.writeUTF(msg2);
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void sendSpecial(String msg2, String name2, String from) {
		realSendSpecial("[귓속말:" + name2 +"] " + msg2,from);
	}
	
	public void sendMessage(String msg) {
		Iterator<String> it = clients.keySet().iterator();
		while(it.hasNext()) {
			try {
				String name = it.next();
				
				DataOutputStream dos = new DataOutputStream(clients.get(name).getOutputStream());
				dos.writeUTF(msg);
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void sendMessage(String msg, String from) {
		if(msg.substring(0, 2).equals("/w")) {
			int num = msg.indexOf(" ");
			int num2 = msg.indexOf(" ", num + 1);
			String to = msg.substring(num + 1, num2).trim();
			String msg2 = msg.substring(num2, msg.length());
			sendSpecial(msg2, from, to);
		}else {
			sendMessage("[" + from + "]" + msg);
		}
	}
	
	public static void main(String[] args) {
		new MultiChatServer().serverStart();
	}
	
}
