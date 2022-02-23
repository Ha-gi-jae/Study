package kr.or.ddit.tcp;

import java.io.DataInputStream;
import java.io.IOException;
import java.net.Socket;

/**
 * 소켓에서 메시지를 받아서 화면에 출력하는 스레드
 * @author PC-06
 *
 */
public class Receiver extends Thread {
	private DataInputStream dis;

	public Receiver(Socket socket) {
		try {
			dis = new DataInputStream(socket.getInputStream());
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		super.run();
		while(dis != null) {
			try {
				System.out.println(dis.readUTF());
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
