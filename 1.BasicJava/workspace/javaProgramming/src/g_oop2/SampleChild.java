package g_oop2;

public class SampleChild extends SampleParent { //상속을 받았다 = 내 것 처럼 쓰겟다.
	
	void childMethod(){
		System.out.println(var); //상속받은 변수
		System.out.println(method(7,13)); //상속받은 메서드
	}
	
	//오버라이딩 부모에게 물려받은 메서드내용을 변경가능
	//super,super() 부모 클래스 변수랑 자식클래수 변수의 이름이 같을때,  this랑 비슷 super() 부모클래스에서 생성된거 호출
	//다형성 객체는 자식객체인데 변수는 부모 타입의 변수.
	
	//오버라이딩 : 상속받은 메서드의 내용을 재정의 하는 것
	@Override //어노테이션 : 클래스, 변수, 메서드 등에 표시해 놓는것.
	//밑의 메서드가 오버라이딩 된것이다라는걸 알려줌. 반드시 밑의 메서드는 오버라이딩이 된 메서드여야함.
	int method(int a, int b){
		return a * b;
	}
	//오버라이딩은 반드시 return타입 메서드명 파라미터가 다 똑같은 상태에서!!!!!!    내용만 바꿔주면 된다.
	
	
	//super, super()
	int var;
	
	void test(double var){
		System.out.println(var); //지역변수 (아무것도 붙히지 않을시)
		System.out.println(this.var); // 인스턴스 변수
		System.out.println(super.var); // 부모클래스의 인스턴스 변수
		
		//super : 부모 클래스의 멤버와 자식 클래스의 멤버가 이름이 중복될 때 둘을 구분하기 위해 사용한다.
		
		System.out.println(method(10,20)); //자식 클래스의 메서드 ( a * b )
		System.out.println(super.method(10,20)); //부모 클래스의 메서드 ( a + b )
	}
	
	SampleChild(){
		super(); // 부모클래스의 생성자 호출 
		//자식클래스에서는 부모클래스를 반드시 호출해야함. 그래야 부모 클래스의 변수가 초기화 된다.
		//있든 없든 아무런 상관 없음. 컴파일러가 알아서 넣어준다.
		//부모클래스에 파라미터가 있는  경우 개발자가 직접 넣어줘야한다. super(10) 이런식으로 값을 넣어줘서 해줘야함. 
		
	}
	
	//다형성
	public static void main(String[] args) {
		SampleChild sc = new SampleChild(); //기존에 하던 객체생성
		SampleParent sp = new SampleChild(); //
		//SampleParent sp2 = new SampleChild2(); //이런식으로 자식이 여러명이면 다양하게 된다.
		//형변환.. 부모자식간에 한다.
		
		sc = (SampleChild)sp; //5개를 사용할 수 있어야하는데 2개만 넣었기 때문에.
		sp = sc; //부모타입을 자식타입으로 형변화했을때 실행하면 에러가 남.
		//자식타입 -> 부모타입 형변환은 생략할 수 있다.
		//sp는 지금 var method 2개 사용가능.
		//sc는 상속 받았으니 2개 기본적으로 가지고있고, 추가적으로 childMethod, var 변수, test 5개. 오버라이딩은제외
		
		//SampleChild sc2 = (SampleChild)new SampleParent(); //샘플 차일드로 형변환. 안하면 컴파일오류
		//부모타입을 자식타입에 형변환해서 사용은 불가능하다.
		
		//반드시.       ★★★★★ [ 변수 부모타입 객체 자식 타입 ] 
		sc.childMethod();
		System.out.println(sp.method(5,7));
		
	}
	
}
