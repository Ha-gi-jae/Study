package e_oop;

public class ClassMaker {

	//전역변수 하나를 선언 및 초기화 해주세요.
	int a = 5; // 초기화를 해주지 않으면 기본 값이 들어감.

	//리턴타입과 파라미터가 없는 메서드 하나를 만들어주세요. //void!!!!!!
	//메서드 안에서 전역변수를 출력해주세요.
	void a(){
		System.out.println(a);
	}
	
	//전역변수와 동일한 타입의 리턴타입이 있고 파라미터는 없는 메서드 하나를 만들어주세요.
	//메서드 안에서 전역변수를 리턴해주세요.
	 int b(){                 // 메서드 앞 int가 리턴값의 타입.
		return a;
	}
	

	//리턴타입은 없고 파라미터가 있는 메서드 하나를 만들어 주세요.
	//메서드 안에서 파라미터를 출력해주세요.
	 void c(int parameter){
		 System.out.println(parameter);
	 }
	 
	 //int타입의 리턴타입과 int타입의 파라미터 두개가 있는 메서드 하나를 만들어주세요.
	 //메서드 안에서 두 파라미터를 곱한 결과를 리턴해주세요.
	 int d(int parameter1, int parameter2){
		 return  parameter1*parameter2;
	 }
	 //	리턴타입이 없다 = void. 리턴타입이 있다 = 데이터타입.
	 
	 
	 
	 
	 
}
