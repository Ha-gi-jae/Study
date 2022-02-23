package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.List;

public class T03_LambdaTest {
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		
		list.add("홍길동");
		list.add("이순신");
		list.add("변학도");
		
		list.forEach(name -> System.out.println(name));
		
	}
}
