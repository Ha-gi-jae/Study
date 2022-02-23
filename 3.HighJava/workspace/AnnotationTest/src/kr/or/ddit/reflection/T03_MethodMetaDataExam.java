package kr.or.ddit.reflection;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import kr.or.ddit.basic.Service;

public class T03_MethodMetaDataExam {
	public static void main(String[] args) {
		// class 객체 생성
		Class<?> klass = new Service().getClass();
		
		// 클래스에 선언된 모든 메서드의 메타데이터 정보 가져오기
		Method[] methodArr = klass.getDeclaredMethods(); // 메서드타입 객체로 
		
		for(Method m : methodArr) {
			System.out.println("메서드명 : " + m.getName());
			System.out.println("메서드 리턴타입 : " + m.getReturnType());
			
			// 해당 메서드 접근제어자 정보 가져오기
			int modFlag = m.getModifiers(); // 접근제어자 Modifiers
			System.out.println("메서드 접근제어자 : " + Modifier.toString(modFlag));
			
			// 해당 메서드의 파라미터 값 가져오기
			Class<?>[] paramArr = m.getParameterTypes();
			System.out.print("메서드 파라미터 타입 : ");
			for(Class<?> clazz : paramArr) {
				System.out.print(clazz.getName() + " | ");
			}
			System.out.println();
			// 해당 메서드에 존재하는 annotation 타입 정보 가져오기
			Annotation[] annos = m.getAnnotations();
			System.out.println("Annotation 타입 : ");
			for(Annotation anno : annos) {
				System.out.print(anno.annotationType().getName()+ " | ");
				//getName()이기 때문에 패키지명 + 클래스명 을 가지고 온다. getSimpleName()을 한다면 클래스명만 가지고옴.
			}
			System.out.println();
			System.out.println("--------------------------------------");
		}
		
	}
}
