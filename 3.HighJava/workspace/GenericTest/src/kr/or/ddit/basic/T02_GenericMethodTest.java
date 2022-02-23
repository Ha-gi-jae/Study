package kr.or.ddit.basic;

class Util {
	
	/**
	 * 제너릭 메서드 <T, R> R metohd(T t)
	 * 
	 * 파라미터 타입과 리턴타입으로 타입 파라미터를 가지는 메서드
	 * 선언방법: 리턴타입 앞에 <> 기호를 추가하고 타입파라미터를 기술 후 사용함.
	 * 
	 * @param p1
	 * @param p2
	 * @return
	 */
	
	
				  // 타입 앞에 제너릭타입 선언.
	public static <K, V> boolean compare(Pair<K, V> p1, Pair<K, V> p2) {
		
		boolean keyCompare = p1.getKey().equals(p2.getKey());
		// 키와 키를 같은지 비교
		boolean valueCompare = p1.getValue().equals(p2.getValue());
		// 밸류와 밸류 같은지 비교
		return keyCompare && valueCompare;
		// 각 각 true가 나온다면 true 하나라도 false 면 false
	}
}

/**
 * 멀티타입<K, V> 를 가지는 제너릭 클래스
 * @param <K>
 * @param <V>
 */

class Pair<K, V> {
	
	private K key;
	private V value;
	
	public Pair(K key, V value) {
		super();
		this.key = key;
		this.value = value;
	}
	
	public K getKey() {
		return key;
	}
	public void setKey(K key) {
		this.key = key;
	}
	public V getValue() {
		return value;
	}
	public void setValue(V value) {
		this.value = value;
	}
	
	//key와 value 모두 출력하기
	public <K, V> void displayAll(K key, V val) { // 제너릭메서드
		System.out.println(key.toString() + " : " + val.toString());
	}
	
}

public class T02_GenericMethodTest {
	public static void main(String[] args) {
		
		Pair<Integer, String> p1 = new Pair<Integer, String>(1, "홍길동");
		Pair<Integer, String> p2 = new Pair<Integer, String>(1, "홍길동");
											// 생략해도 되나, 명시적인게 좋다
		boolean result1 = Util.<Integer, String>compare(p1, p2);
								// 제너릭 문법을 이용한 메서드 이므로 사용하는 메서드앞에 타입을 써주는게 정석이긴 하나, 생략가능하다.
		if(result1) {
			System.out.println("논리(의미)적으로 동일한 객체임.");
		}else {
			System.out.println("논리(의미)적으로 동일한 객체 아님.");
		}
		
		Pair<String, String> p3 = new Pair<String, String>("001", "홍길동");
		Pair<String, String> p4 = new Pair<String, String>("002", "홍길동");
		
		boolean result2 = Util.compare(p3, p4);
							// <String, String> 생략!
		if(result2) {
			System.out.println("논리(의미)적으로 동일한 객체임.");
		}else {
			System.out.println("논리(의미)적으로 동일한 객체아님.");
		}
		
		// 제너릭 메서드 테스트
		p1.<String, Integer> displayAll("키", 180); 
		
		// 만약 displayAll 메서드에 제너릭을 없애면 컴파일러 오류가 난다.
		// 클래스는 제너릭클래스고 메서드는 일반 메서드임.
		// 메서드 단위로도 제너릭선언 되기 때문에!
		// p1 의 제너릭, displayAll 제너릭 각각 다르게 설정이 되는 것. 
		
		
		
		
	}
}
