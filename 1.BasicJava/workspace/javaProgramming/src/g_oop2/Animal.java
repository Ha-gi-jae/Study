package g_oop2;

public abstract class Animal {
	
	abstract void sound();
	
}


class Dog extends Animal { //자식도 추상 클래스면 부모의 추상메서드를 쓰지 않아도 된다.
						   //변수는 상관없음.
						   //생성자 갖는다.
	@Override
	void sound() {
		System.out.println("멍멍!!");
		
	}
	
}
class Cat extends Animal {

	@Override
	void sound() {
		System.out.println("야옹~~");
		
	}
	
}

class Duck extends Animal {

	@Override
	void sound() {
		System.out.println("꽥! 꽥!");
		
	}
	
}

class Tiger extends Animal {

	@Override
	void sound() {
		System.out.println("어~ 흥~ ");
		
	}
	
}