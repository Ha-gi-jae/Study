package kr.or.ddit.basic;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * 성능향상을 위한 보조 스트림 예제
 * (문자기반의 Buffered스트림 사용 예제)
 * @author PC-06
 *
 */
public class T12_BufferedIOTest {
	public static void main(String[] args) throws IOException {
		
		// 이클립스에서 만든 자바프로그램이 실행되는 기본 위치는 해당 '프로그램 폴더'가 기본 위치가 된다.
		FileReader fr = new FileReader("src/kr/or/ddit/basic/T11_BufferedIOTest.java");
		// FileReader => 파일로 부터 읽는.
		/*
		int c;
		
		while((c=fr.read()) != -1) {
			System.out.print((char)c);
		}
		
		fr.close();
		*/
		
		// 한줄씩 읽을 수 있도록 해주는 readLine()을 이용하기 위해  BufferedReader 사용하기
		
		BufferedReader br = new BufferedReader(fr);
		// 보조스트림이기 때문에 기본 스트림이 필요함.
		
		String temp = "";
		for(int i = 1;(temp = br.readLine()) != null; i++) {
			System.out.printf("%4d : %s\n", i, temp);
		}
		
		br.close();
		
	}
}
