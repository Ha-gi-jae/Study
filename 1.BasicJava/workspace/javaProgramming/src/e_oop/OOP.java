package e_oop;


public class OOP {

	public static void main(String[] args) {
		/*
		 * 객체지향 프로그래밍(Object Oriented Programming)
		 *  - 프로그래밍을 단순히 코드의 연속으로 보는것이 아니라 객체간의 상호작용으로 보는 것
		 *  - 코드의 재사용성이 높고 유지보수가 용이하다.
		 */
		
		SampleClass sc = new SampleClass(); //객체 생성.   메모리에 올라감.    new 가 SampleClass가 저장된 주소를 알려줌.
				  //sc 에는 주소가 들어있음.
		
		System.out.println(sc.field); // 기본값 
		
		String returnValue = sc.method1(15); // SampleClass에 있는 sc.method1의 parameter에 10을 넣어라. 근데 직접이 아니고 복사되서 들어가는거임.
		
		System.out.println(returnValue);
		
		sc.method2(); //호출
		
		sc.flowTest1();//호출
		
		
		
		
		//방금만든 클래스의 객체를 생성하고 변수에 저장해주세요.
		//객체가 지정된 변수를 통해 메서드를 호출해주세요.
		//파라미터가 있는 메서드는 타입에 맞는 값을 넘겨주시고,
		//리턴타입이 있는 메서드는 리턴받은 값을 출력해주세요
		ClassMaker cm = new ClassMaker();
		cm.a();
		
		int b = cm.b();
		System.out.println(b);
		
		cm.c(20);
		
		int parameter = cm.d(10, 30);
		System.out.println(parameter);
		
		
		//다음을 한줄씩 게산해서 최종 결과값을 출력해주세요.
		Calculator cal = new Calculator();
	
		double res = cal.plus(123456,654321);
		System.out.println(res);
		res = cal.gob(res, 123456);
		res = cal.div(res, 123456);
		res =cal.minus(res, 654321);
		res =cal.rem(res, 123456);
		System.out.println(res);
		//double로해야해
		
		
		//과제 성적처리 
		
	}

}
