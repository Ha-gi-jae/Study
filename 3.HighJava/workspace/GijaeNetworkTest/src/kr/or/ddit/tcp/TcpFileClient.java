package kr.or.ddit.tcp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.Socket;

import org.omg.CORBA_2_3.portable.InputStream;

public class TcpFileClient {
	
	/*
	 * 클라이언트 서버에 접속하여 서버가 보내주는 파일을 d:C_Lib 폴더에 저장한다.
	 */
	
	private Socket socket;
	private InputStream is;
	private FileOutputStream fos;
	
	public void clientStart() {
		
		// 저장 파일 지정
		File file = new File("d:/C_Lib/가구1.jpg");
		
		try {
			
			socket = new Socket("192.168.43.47", 7777);
			System.out.println("파일 다운로드 시작...");
			
			fos = new FileOutputStream(file);
			
			BufferedInputStream bis = new BufferedInputStream(socket.getInputStream());
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			
			int c = 0;
			
			while((c=bis.read()) != -1) {
				bos.write(c);
			}
			
			bis.close();
			bos.close();
			
			System.out.println("파일 다운로드 완료...");
			
			
			
		}catch(IOException e){
			e.printStackTrace();
		}finally {
			if(is != null) {
				try {is.close();}catch (IOException e) {}
			}
			if(fos != null) {
				try {fos.close();}catch(IOException e) {}
			}
			if(socket != null) {
				try {socket.close();}catch(IOException e) {}
			}
		}
		
	}
	
	public static void main(String[] args) {
		new TcpFileClient().clientStart();
	}
}
