package kr.or.ddit.basic;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * FileReader(문자기반스트림) 테스트
 * @author PC-06
 */
public class T08_FileReaderTest {
	public static void main(String[] args) throws IOException {
		// 문자기반스트림은 2바이트씩 읽어오기때문에 바이트기반스트림 처럼 깨지지 않는다.
		// 복사할때는 바이트기반으로해도 문제 없다.
		
		// 문자 기반의 스트림을 이용한 파일 내용 읽기
		FileReader fr = null;
		
		// 문자단위의 입력을 담당하는 Reader형 객체 생성
		fr = new FileReader("d:/D_Other/testChar.txt");
		
		int c;
		
		while((c=fr.read()) != -1) {
			System.out.print((char)c);
		}
		
		fr.close();
	}
}
