package kr.or.ddit.basic;

public class Service {
	
	@PrintAnnotation()
	public void method1() {
		System.out.println("메서드1에서 출력되었습니다.");
	}
	
	@PrintAnnotation(value = "%") // value를 하나만 쓸 때는 value = 생략가능 >> ("%") 이렇게.
	public void method2() {
		System.out.println("메서드2에서 출력되었습니다.");
	}
	
	@PrintAnnotation(value = "#", count = 25)
	public void method3() {
		System.out.println("메서드3에서 출력되었습니다.");
	}
	
	@PrintAnnotation(value = "^^", count = 20)
	public void method4() {
		System.out.println("메서드4에서 출력되었습니다.");
		System.out.println("혹시너냐");
	}
	
	
}
