package kr.or.ddit.reflection;

/*
	Java Reflection에 대하여...
	
	1. 리플렉션은 런타임 시점에 클래스 또는 멤버변수, 메서드, 생성자에 대한 정보를 가져오거나 수정할 수 있고, 새로운 객체를 생성하거나, 메서드를 실행할 수 있다.
	2. Reflection API는 java.lang.reflect 패키지와 java.lang.Class를 통해 제공된다.
	3. java.lang.Class 의 주요 메서드
	 - getName(), getSuperclass(), getInterface, getModifiers()
	4. java.lang.reflect 패키지의 주요 클래스
	 - Field, Method, Constructor, Modifier 등.
	5. Reflection API의 기능은 뛰어나지만, 약간의 오버헤드가 발생한다.
	 - (느린수행속도, 보안취약성, 권한문제등.) 그러므로, 가급적 마지막수단으로 사용하도록 고려되어야 한다.
 */
public class T01_ClassObjectCreationExam {
	public static void main(String[] args) throws ClassNotFoundException {
		// 첫번째 방법 : Class.forName() 이용하기
		Class<?> klass = Class.forName("kr.or.ddit.reflection.T01_ClassObjectCreationExam");
				 // class는 못쓰니까 보통 klass 또는 clazz 로 쓴다.

		// 두번째 방법 : getClass() 이용하기
		klass = new T01_ClassObjectCreationExam().getClass();
				 // class 객체 만들고 그 객체를 getClass()메서드로 가져온다.
		
		// 세번째 방법 : .class 이용하기
		klass = T01_ClassObjectCreationExam.class;
				 // 클래스명.class 해당 클래스의 정보를 가져온다.
	}
}
