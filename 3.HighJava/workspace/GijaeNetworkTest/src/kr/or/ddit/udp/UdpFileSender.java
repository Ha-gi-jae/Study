package kr.or.ddit.udp;

import java.io.File;
import java.io.FileInputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class UdpFileSender {
	public static void main(String[] args) {
		
		File file = new File("d:/D_Other/dddd.jpg");
		
		DatagramSocket ds = null;
		
		if(!file.exists()) {
			System.out.println("파일이 존재하지 않습니다.");
			System.exit(0);
		}
		
		long fileSize = file.length();
		long totalReadBytes = 0;
		
		long startTime = System.currentTimeMillis();
		
		int port = 8888;
		
		try {
			ds = new DatagramSocket();
			// 전송받을 주소
			InetAddress receiveAddr = InetAddress.getByName("192.168.43.47");
			
			String str = "start"; // 전송 시작을 알려주기 위한 문자열.
			DatagramPacket dp = new DatagramPacket(str.getBytes(), //바이트타입 전송 데이터
					str.getBytes().length, // 보낼 패킷의 길이
					receiveAddr, // 전송할 주소
					port); // 접속할 주소가 열어둔 포트번호
			ds.send(dp);
			
			FileInputStream fis = new FileInputStream(file);
			byte[] buffer = new byte[1000];
			
			str = file.getName(); // 파일명
			dp = new DatagramPacket(str.getBytes(),
					str.getBytes().length,
					receiveAddr,
					port);
			
			str = String.valueOf(fileSize); // 파일 크기
			dp = new DatagramPacket(str.getBytes(),
					str.getBytes().length,
					receiveAddr,
					port);
			ds.send(dp);
			
			while(true) {
				Thread.sleep(10); // 패킷 전송간의 간격을 주기 위해서...
				int readBytes = fis.read(buffer, 0, buffer.length);
				// 이 0의 의미는?!!! 0부터시작하겠다.
				if(readBytes == -1) {
					break; // 다 읽으면 -1 반환하니까. 브레이킄
				}
				dp = new DatagramPacket(buffer, readBytes, receiveAddr, port);
				
				ds.send(dp);
				totalReadBytes += readBytes;
				
				System.out.println("진행 상태 : " + totalReadBytes + "/" + fileSize + "Bytes("+ (totalReadBytes * 100 / fileSize)+"%)");
				
			}
			
			long endTime = System.currentTimeMillis();
			long diffTime = endTime - startTime;
			double transferSpeed = fileSize / diffTime; // 파일크기 / 걸린시간 => 전송속도 구하는거
			
			System.out.println("걸린 시간 : " + diffTime + "(ms)");
			System.out.println("평균 전송 속도 : " + transferSpeed + "Bytes/ms");
			System.out.println("전송 완료...");
			
			fis.close();
			ds.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}




