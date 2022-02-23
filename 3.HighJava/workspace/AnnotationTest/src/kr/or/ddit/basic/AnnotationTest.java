package kr.or.ddit.basic;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class AnnotationTest { // Annotation : 주석처럼 사용하되, 프로그램에 의미있는 유용한 정보를 제공
	public static void main(String[] args) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, InstantiationException {
		
		System.out.println("static 변수값 : " + PrintAnnotation.id);
		
		System.out.println("--------------------------------");
		
		// reflection 기능을 이용한 메서드 실행하기
		// 선언된 메서드 목록 가져오기
		Method[] declaredMethods = Service.class.getDeclaredMethods(); // Service 클래스에서 선언한 메소드를 가지고오겠다.
		
		for(Method m : declaredMethods) {
			
			System.out.println(m.getName()); // 메서드명 출력
			
			// 선언된 PrintAnnotation 객체 정보 가져오기
			PrintAnnotation printAnn = m.getDeclaredAnnotation(PrintAnnotation.class); // 모두 reflection 기능
			
			// count 수 만큼 value 출력하기
			for(int i = 0 ; i < printAnn.count(); i++) {
				System.out.print(printAnn.value());
			}
			
			System.out.println(); // 줄바꿈 처리
			
			// reflection 기능을 이용한 메서드 실행하기
//			m.invoke(new Service());

			// reflection을 이용한 객체 생성하기
			Class<?> clazz = Service.class;
			Service service = (Service) clazz.newInstance();
			//Annotation을 출력하기위한 메서드 =>   invoke = 출력 메서드.
			m.invoke(service); // reflection.. 
		}
	}
}
