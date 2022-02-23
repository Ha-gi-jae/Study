package kr.or.ddit.basic;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Properties;

/**
 * 외부의 properties 파일을 읽어와 Properties객체로 처리하기
 * @author PC-06
 */
public class T02_PropertiesTest {
	public static void main(String[] args) {
		// 읽어온 정보를 저장할 Properties객체 생성
		Properties prop = new Properties();
		
		// 읽어올 파일명을 이용한 File객체 생성
		File file = new File("res/db.properties");
		
		try {
			// 파일 읽기를 수행할 FileInputStream 객체 생성
			FileInputStream fis = new FileInputStream(file);
			
			// Properties객체로 파일 내용 읽기
			prop.load(fis); // 파일 내용을 읽어와 key와 value값으로 분류한 후, Properties객체에 담아준다.
			
			// 읽어온 자료 출력하기
			
			// key값만 읽어와 Enumeration 객체로 변환하기
			Enumeration<String> keys = (Enumeration<String>)prop.propertyNames(); // 키 값만 쭉 던져주는 친구.propertyNames()
			// Enumeration 먼저 나와서 쓰다 iterator 로 바뀌어가는 추세. 느낌 비슷하다 둘이.
			
			// key개수만큼 반복해서 값 출력하기
			while(keys.hasMoreElements()) { // 순서가 일정하지는 않다.
				String key = keys.nextElement();
				String value = prop.getProperty(key); // set 세팅 get 꺼내깅
				System.out.println(key + " : " + value);
			}
			
			System.out.println("출력 끝...");
			
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		
	}
}
