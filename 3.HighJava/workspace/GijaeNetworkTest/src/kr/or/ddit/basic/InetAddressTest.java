package kr.or.ddit.basic;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class InetAddressTest {
	public static void main(String[] args) throws UnknownHostException {
		
		//InetAddress 클래스 => IP주소를 다루기 위한 클래스
		
		//getByName()메서드는 www.naver.com 또는 SEM-PC등과 같은 머신이름이나
		//IP주소를 파라미터값을 이용하여 유효한 InetAddress 객체를 제공한다.
		
		//naver사이트의 ip정보 가져오기
		
		InetAddress googleIp = InetAddress.getByName("www.nexon.com");
		System.out.println("Host Name => " + googleIp.getHostName());
		System.out.println("Host Addres => " + googleIp.getHostAddress());
		System.out.println();
		
		//자기 자신 컴퓨터의 IP정보 가져오기
		InetAddress localIp = InetAddress.getLocalHost();
		System.out.println("내 컴퓨터의 Host Name => " + localIp.getHostName());
		System.out.println("내 컴퓨터의 Host Address => " + localIp.getHostAddress());
		
		// IP주소가 여러개인 호스트의 정보 가져오기
		InetAddress[] googleIps = InetAddress.getAllByName("www.nexon.com");
		for(InetAddress gIp: googleIps) {
			System.out.println(gIp.toString());
		}
	}
}
