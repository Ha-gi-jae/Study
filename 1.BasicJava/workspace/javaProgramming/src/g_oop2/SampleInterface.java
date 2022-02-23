package g_oop2;

public interface SampleInterface {//추상클래스처럼 부모의 역할만 한다. 추상클래스: 같은메서드 다른내용 쓸때 쓰임. 이 기능 특화된 것이 인터페이스
	  //인터페이스 : 멤버로 상수와 추상메서드만 받을 수 있음.
	  //다중 상속이 가능하다.
      //여러개의 인터페이스로 부터 상속 받을 수 있다는 것임.
	
	//인터페이스의 모든 멤버변수는 public static final 제어자를 사용해야한다.
	public static final int NUM1 =1;
	
	//모든 멤버변수의 제어자가 같기 때문에 생략이 가능하다.
	int NUM2 =2;
	
	//인터페이스의 모든 메서드는 public abstract 제어자를 사용해야한다.
	public abstract void method1();
	
	//모든 메서드의 제어자가 같기 때문에 생략이 가능하다.
	void method2();
	
	
	
}
                     //인터페이스를 상속받을때는 implements 를 쓴다. extends 아님!! 
class SampleImplement implements SampleInterface, SampleInterface2 {//오버라이딩 ctrl + 1 해주기.
									//위 처럼 쓰면 여러개 상속 받는 거임. ★인터페이스만 가능.
	//인터페이스를 상속받을때는 implements 를 쓴다. extends 아님!! 
	//같은 메서드가 두개 이상이면 한개만 오버라이딩 하면 된다.
	//내용이 있으면 구분 할 필요가 있지만 내용이 없으니까 구분 할 필요가 없다. 
	@Override //클래스의 틀을 잡아주는 역할로 많이 쓰임.
	public void method1() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void method2() {
		// TODO Auto-generated method stub
	}
		

	@Override
	public void method3() {
		// TODO Auto-generated method stub
		
	}
	
}

interface SampleInterface2{
	void method1();
	void method3();
	
}














