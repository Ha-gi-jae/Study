package kr.or.ddit.basic;

import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * 성능향상을 위한 보조 스트림 예제
 * (바이트기반의 Buffered스트림 사용 예제)
 * @author PC-06
 */
public class T11_BufferedIOTest {
	public static void main(String[] args) throws IOException {
		// 입출력 성능 향상을 위해서 버퍼를 이용하는 보조스트림
		FileOutputStream fos = null; // 일반
		BufferedOutputStream bos = null; // 보조
		
		fos = new FileOutputStream("d:/D_Other/bufferTest.txt");
		
		// 버퍼의 크기를 지정하지 않으면 기본적으로 버퍼크기가 8192byte(8kb)로 설정된다.
		
		// 버퍼 크기가 5인 스트림 생성
		bos = new BufferedOutputStream(fos, 5); // 보조이기 때문에 일반(기본)스트림이 필요.
		
		for(int i = '1'; i <= '9'; i++) { // 숫자 자체를 문자로 지정...
			bos.write(i);
		}
		
		bos.flush(); // 작업을 종료하기 전에 버퍼에 남아있는 데이터를 모두 출력시킨다. (close시 자동으로 호출됨.)
		
		bos.close();
		// 보조만 close 함. => 보조만 닫아도 일반(기본)스트림이 자동으로 닫힌다.
		System.out.println("작업끝...");
	}
}
