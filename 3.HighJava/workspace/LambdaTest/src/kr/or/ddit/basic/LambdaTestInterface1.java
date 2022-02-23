package kr.or.ddit.basic;
// 가독성을 위해 한 곳에 함. 원래는 따로 만드는게 맞음 
// 추상메서드 1개씩. => 람다식 쓸꺼니까!

// @FunctionalInterface을 쓰면 컴파일러가 추상메서드를 1개만 생성하도록 막아줌.

@FunctionalInterface
public interface LambdaTestInterface1 {
	// 반환값이 없고 매개변수도 없는 추상메서드 선언
	public void test();
}

@FunctionalInterface
interface LambdaTestInterface2 {
	// 반환값이 없고 매개변수는 있는 추상메서드 선언
	public void test(int a);
}

@FunctionalInterface
interface LambdaTestInterface3 {
	// 반환값이 있고 매개변수도 있는 추상메서드 선언
	public int test(int a, int b);
}