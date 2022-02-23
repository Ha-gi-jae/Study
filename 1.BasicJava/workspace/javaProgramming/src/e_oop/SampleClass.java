package e_oop;

public class SampleClass {
			//class 이름만 첫글자 대문자!!!!! 
	
	
	public static void main(String[] args) {
		int local = 10; // 지역변수 : 메서드 안에서만 사용하는 변수 ex) for(int i =0 ...) 에서 i 같은느낌.
	}
	
	int field; //전역변수 : 클래스 전체 영역에서 사용하는 변수. 어디서든 초기화를 하지 않아도 자동으로 기본값으로 초기화가 된다.
	
	/*
	 *  - 메서드 : 변수를 가지고 할 일
	 *  - 선언 방법 : 리턴타입 메서드명(파라미터){ }
	 *  - 파라미터(매개변수) : 실행에 필요한 정보.             외부에서 받아온다.
	 *  - 리턴타입(반환타입) : 실행 후 돌려줘야하는 결과물               외부에서 처리 부탁한 곳에 돌려줌.
	*/
	
	String method1(int parameter){//타입에 맞는 값만 넘길수 있음. int 이기때문에 OOP에서 10.0을 하면 오류남.  //String 타입의 반환값이 없으면 컴파일에러가 뜸.
		return parameter + " 를 받아 명령을 수행하고 결과물을 리턴하는 메서드";
		// 스트링 타입을 return 해줘야함. parameter 의 정수 10이 자동으로 char로 형변환해서 넘어감.
	}
	
	void method2(){ //void = 비어있다.    외부에서 데이터도 받지 않고. 돌려줄 것도 없고. 불러주기만 하면 자기 것만 함.
		System.out.println("파라미터도 리턴타입도 없는 메서드");
	}
	
	
	void flowTest1(){
		System.out.println("flowTest1 시작 : 1 ");
		flowTest3();
		System.out.println("flowTest1 종료 : 6 ");
		
	}
	
	void flowTest2(){
		System.out.println("flowTest2 시작 : 3 ");
		System.out.println("flowTest2 종료 : 4 ");
	}
	
	void flowTest3(){
		System.out.println("flowTest3 시작 : 2 ");
		flowTest2();
		System.out.println("flotTest3 종료 : 5 ");
	}
	
	
	
}