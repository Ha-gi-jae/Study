package tcpTest;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

public class CilentChatServer {
	public static void main(String[] args) {
		try {
			Socket csk = new Socket("192.168.43.56",7777);
			System.out.println("서버에 연결되었습니다.");
			
			Sender1 sender = new Sender1(csk);
			Receiver1 receiver = new Receiver1(csk);
			
			sender.start();
			receiver.start();
		
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
