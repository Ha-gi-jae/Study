package tcpTest;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class ChatServer {
	public static void main(String[] args) {
		
		try {
			ServerSocket sck = new ServerSocket(8888);
			System.out.println("서버 준비가 완료되었습니다.");
			Socket csk = sck.accept();
			
			Sender1 sd = new Sender1(csk);
			Receiver1 rc = new Receiver1(csk);
			
			sd.start();
			rc.start();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
