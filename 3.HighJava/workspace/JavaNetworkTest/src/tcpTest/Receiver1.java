package tcpTest;

import java.io.DataInputStream;
import java.io.IOException;
import java.net.Socket;

public class Receiver1 extends Thread{
	DataInputStream dis;
	
	public Receiver1(Socket csk) {
		try {
			dis = new DataInputStream(csk.getInputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		super.run();
		
		while(dis!=null) {
			try {
				System.out.println(dis.readUTF());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
