package kr.or.ddit.basic;

/**
 * 제한된 타입파라미터(Bounded Parameter) 예제
 */
public class T03_GenericMethodTest {
	public static void main(String[] args) {

		int result1 = Util2.compare(10, 20);
		System.out.println(result1);
		
		int result2 = Util2.compare(3.14, 3);
		System.out.println(result2);
		
//		int result3 = Util2.compare("c", "java"); number 외에는 불가
		
		
		
		
		
	}
}

class Util2 { // 숫자만 허용하게 만들어줄 것 임! extends Number = Number와 그의 자식들(byte short integer long float ...등) 만 올 수있다.
	public static <T extends Number> int compare(T t1, T t2) { // 리턴타입 앞에 <T> => 제너릭메서드네~ 
		double v1 = t1.doubleValue();
		double v2 = t2.doubleValue();
		
		return Double.compare(v1, v2); // int > 1 0 -1 로 반환 해줌
	}
}