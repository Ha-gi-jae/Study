package kr.or.ddit.reflection;

import kr.or.ddit.basic.Service;

public class T02_ClassMetaDataExam {

	public static void main(String[] args) {
		
		// 클래스 오브젝트 생성하기
		Class<?> clazz = Service.class; // Service 클래스 정보를 클래스객체로 가져옴.
		
		System.out.println("심플클래스명 : " + clazz.getSimpleName()); // 클래스명만
		System.out.println("클래스명 : " + clazz.getName()); // 패키지 + 클래스명
		System.out.println("상위클래스명 : " + clazz.getSuperclass().getName()); // class가 속한 최상위 클래스 만.
		
		//패키지 정보 가져오기
		Package pkg = clazz.getPackage();
		System.out.println("패키지 정보 : " + pkg.getName());
		
	}
	
}
