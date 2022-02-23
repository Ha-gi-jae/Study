package tcpTest;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.Scanner;

public class Sender1 extends Thread{
	private Scanner s = new Scanner(System.in);
	private String name ="뽀로로";
	private DataOutputStream dos;
	
	public Sender1(Socket csk) {
		try {
			dos = new DataOutputStream(csk.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		super.run();
		
		while(dos!=null) {
			try {
				dos.writeUTF(name+": "+s.nextLine());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
}
