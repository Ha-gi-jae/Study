package kr.or.ddit.basic;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * 파일 출력 예제
 * @author PC-06
 */
public class T06_FileStreamTest {
	public static void main(String[] args) {
		// 파일에 출력하기
		FileOutputStream fos = null;

		try {
			// 출력용 OutputStream 객체 생성
			fos = new FileOutputStream("d:/D_Other/out.txt");
										// ,붙히고 컨트롤 스페이스바 하면 boolean append(이어붙히는기능)가 있음. true로 하면 해당 문서에 이어서 작성이된다. 
			for(char ch = 'a'; ch <= 'z'; ch++) {
				fos.write(ch); // 파일에 쓰는중
			}
			System.out.println("파일에 쓰기 작업 완료...");
			
			// 쓰기 작업 완료 후 스트림 닫기
			fos.close();
			
			//=====================================================
			
			// 저장된 파일의 내용을 읽어와 화면에 출력하기
			FileInputStream fis = new FileInputStream("d:/D_Other/out.txt");
			
			int c;
			while((c = fis.read()) != -1) {
				System.out.print((char)c);
			}
			System.out.println();
			System.out.println("출력 끝...");
			
			fis.close();
			
		}catch(IOException ex) {
			ex.printStackTrace();
		}
	}
}
