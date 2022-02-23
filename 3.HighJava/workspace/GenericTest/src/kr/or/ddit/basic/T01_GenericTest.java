package kr.or.ddit.basic;

import java.util.Map;

public class T01_GenericTest { // 어렵다. 문법이 달라져서. 반복 열심히 하세용^^~~
/*
	제너릭 클래스 만드는 방법
	형식)
	 class 클래스명<제너릭타입글자> { // 사용할때 타입을 말해줌.
	 	제너릭타입글자 변수명;	//변수선언에 제너릭을 사용할 경우
	 	...
	 		제너릭타입글자 메서드명(){	// 반환값이 있는 메서드에서 사용할 경우
	 		...
	 		
	 		return 값;
	 		}
	 	...
	 }
	 
	 -- 제너릭타입글자--
	 T => Type
	 K => Key
	 V => Value
	 E => Element(자료구조에 들어가는 것들을 나타낼 때 사용)
	 
*/
	
	public static void main(String[] args) {
		
		NonGenericClass ng1 = new NonGenericClass();
		ng1.setVal("가나다라");
		
		NonGenericClass ng2 = new NonGenericClass();
		ng2.setVal(100);
		
		String rtnNg1 = (String) ng1.getVal(); // 오브젝트타입이기 때문에 캐스팅해서 꺼내와야함.
		System.out.println("문자열 반환값 rtnNg1 => " + rtnNg1);
		
		Integer irtnNg2 = (Integer)ng2.getVal(); // 마찬가지로 캐스팅해줘야함.
		System.out.println("정수 반환값 irtnNg2 => " + irtnNg2);
		System.out.println();
		
		MyGeneric<String> mg1 = new MyGeneric<String>(); // MyGeneric<T> mg1 = new MyGeneric<T>(); 여기서 T는 Type이 아니라 그냥 문자 T임. 
		MyGeneric<Integer> mg2 = new MyGeneric<Integer>(); // <> 안에는 Type만 올 수 있음. String, Integer, Double 이런거.
															// 생성할때마다 타입을 지정해줘야 함! 반.드.시.
															// 인터페이스도 가능.
		mg1.setVal("우리나라");
		mg2.setVal(500);
		rtnNg1 = mg1.getVal();
		irtnNg2 = mg2.getVal();
		
		System.out.println("제너릭 문자열 반환값 : " + rtnNg1);
		System.out.println("제너릭 정수형 반환값 : " + irtnNg2);
		
		
	}
}


class NonGenericClass {
	
	private Object val; // 오브젝트타입 멤버변수 선언

	public Object getVal() {
		return val;
	}

	public void setVal(Object val) {
		this.val = val;
	}
	
	
	
}

class MyGeneric<T> {// 클래스 만들때 선언.
	
	private T val; // T타입(사용할때 받음) - 클래스 생성할때 선언해줘서 컴파일 오류 안남. 제너릭타입 문법이란것을 안다는 거임.
					
	public T getVal() {
		return val;
	}

	public void setVal(T val) {
		this.val = val;
	}
	
	
}