package kr.or.ddit.basic;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * 파일 읽기 예제
 * @author PC-06
 *
 */
public class T05_FileStreamTest {
	public static void main(String[] args) {
		// FileInputStream객체를 이용한 파일 내용 읽기
		FileInputStream fis = null; // 변수선언
		
		try {
			// 객체 생성
			fis = new FileInputStream("d:/D_Other/test2.txt"); 
			
			//위의 객체 생성과 동일하다.
//			File file = new File("d:/D_Other/test2.txt");
//			fis = new FileInputStream(file); 
			
			// 파일 입장에서는 보내는것 프로그램 입장에서는 받는것 => input. 
			// 프로그램 입장에서 보내는 것 파일입장에서 받는 것 => output.
			// 프로그램을 기준으로.
			
			int c; // 읽어온 데이터를 저장할 변수
			
			// 읽어온 값이 -1이면 파일의 끝까지 읽었다는 의미이다.
			while((c=fis.read()) != -1) {
				// 읽어온 자료 출력하기
				System.out.print((char)c);
			}
			
		}catch(IOException ex){
			ex.printStackTrace();
		}finally {
			try {
				fis.close(); // 작업 완료 후 스트림 닫기
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
