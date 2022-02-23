package kr.or.ddit.tcp;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

/**
 * 소켓을 통해 메시지 전송하는 스레드
 * @author PC-06
 *
 */
public class Sender extends Thread{
	private Scanner scan;
	private String name;
	private DataOutputStream dos;
	
	public Sender(Socket socket) {
		name = "[" + socket.getInetAddress() + " : " + socket.getLocalPort() + " ] ";
		scan = new Scanner(System.in);
		
		try {
			dos = new DataOutputStream(socket.getOutputStream());
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		super.run();
		while(dos != null) {
			
		}try {
			dos.writeUTF(name + " >>> " + scan.nextLine());
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
}
