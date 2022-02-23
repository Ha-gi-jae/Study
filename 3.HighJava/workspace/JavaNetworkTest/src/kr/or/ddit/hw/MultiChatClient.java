package kr.or.ddit.hw;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

public class MultiChatClient {
	Scanner scan = new Scanner(System.in);
	private String nickName;
	
	public void clientStart() {
		System.out.print("대화명 >> ");
		nickName = scan.next();
		
		Socket socket = null;
		
		try {
			socket = new Socket("192.168.43.56", 7777);
			
			System.out.println("서버에 연결되었습니다.");
			
			ClientSender sender = new ClientSender(socket, nickName);
			
			ClientReceiver receiver = new ClientReceiver(socket);
			
			sender.start();
			receiver.start();
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	class ClientSender extends Thread{
		private DataOutputStream dos;
		private String name;
		private Scanner scan = new Scanner(System.in);
		
		public ClientSender(Socket socket, String name) {
			this.name = name;
			
			try {
				dos = new DataOutputStream(socket.getOutputStream());
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		@Override
		public void run() {
			super.run();
			try {
				if(dos != null) {
					dos.writeUTF(name);
				}
				while(dos != null) {
					dos.writeUTF(scan.nextLine());
				}
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	class ClientReceiver extends Thread{
		private DataInputStream dis;
		
		public ClientReceiver(Socket socket) {
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
				System.out.println(dis.readUTF());
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		new MultiChatClient().clientStart();
	}
}
