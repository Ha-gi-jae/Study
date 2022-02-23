package kr.or.ddit.basic;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

public class T12_PropertiesTest {
	/*
	 Properties는 Map보다 축소된 기능의 객체라고 할 수 있다.
	 Map은 모든 형태의 객체데이터를 key와 value값으로 사용할 수 있지만 Properties는 key와 value값으로 String만 사용할 수 있다.
		
	 Map은 put(), get()메서드를 이용하여 데이터를 입출력 하지만 Properties는 setProperty(), getProperty() 메서드를 통해서 데이터를 입출력 한다.
	*/
	
	public static void main(String[] args) throws IOException {
		Properties prop = new Properties();
		//넣을땐 set 가져올땐 get
		prop.setProperty("name", "홍길동");
		prop.setProperty("tel", "010-1234-5678");
		prop.setProperty("addr", "대전");
		
		String name = prop.getProperty("name");
		String tel = prop.getProperty("tel");
		
		System.out.println("이름 : " + name);
		System.out.println("전화 : " + tel);
		System.out.println("주소 : " + prop.getProperty("addr"));
		
		// 내용을 파일로 저장하기		#나중에 배울거임!
		prop.store(new FileOutputStream("src/kr/or/ddit/basic/my.properties"), "주석(COMMENT)입니다.");
										// src/kr/... 이런 경로를 상대경로라고 한다.
										// ./src/kr/... 이 상태임.
	}
	
		
}
