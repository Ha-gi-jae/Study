package g_oop2;

public abstract class SampleAbstractParent {
	//클래스에도 똑같이 abstract 라는 제어자가 있어야 추상 클래스가 된다.
	void method(){
		
	}
	//추상메서드 : 선언부만 있고 구현부는 없는 메서드.      내용이없음.   이게 하나라도 있으면 추상클래스임
	abstract void abstractMethod();
}   // 왜만드냐?
	// 클래슨데 객체생성이 되지않음 ? 내용이없음. 대신 부모의 역할만함
	// 부모 역할 하기 위해서 추상클래스와 추상메서드를 만드는 것이다.
				

	// 오버라이딩을 해서 써야한다.
class SampleAbstractChild extends SampleAbstractParent {
	//추상클래스를 상속받으면 오버라이딩을 무조건 해줘야함.
	//컨트롤 1 하면 첫번째 뜨는데 그게 오버라이딩 하는거임
	//자식한테 강제로 메서드를 만들게 함. << 이거때문에 추상클래스를 쓴댜..
	
	@Override
		void abstractMethod() {
			// TODO Auto-generated method stub
			
		}
}