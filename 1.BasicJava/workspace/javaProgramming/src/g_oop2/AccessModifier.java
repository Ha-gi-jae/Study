package g_oop2;

public class AccessModifier {
		
	public String publicVar = "public : 제한이 없음";
	protected String protectedVar = "protected : 같은 패키지 + 상속받은 클래스에서 접근 가능";
	String defaultVar = "default : 같은 패키지에서만 접근 가능";
	private String privateVar = "private : 클래스 내에서만 접근 가능";
	
	public void publicMethod(){
		System.out.println(publicVar);
	}
	
	protected void protectedMethod(){
		System.out.println(protectedVar);
	}
	
	void defaultMethod(){
		System.out.println(defaultVar);
	}
	
	private void privateMethod(){
		System.out.println(privateVar);
	}
	
	public static void main(String[] args) {
		Time t = new Time();
		
//		t.hour = 14;
//		t.minute = 2;
//		t.second = 99;
		
		t.setHour(10);
		t.setMinute(-120);
		t.setSecond(10);
		//이대로 출력. 아직 로직을 안 넣었음.
		
		System.out.println(t.getTime());
	//변수에는 로직을 못 넣어도 메서드는 넣을 수 있따~
	
		//접근제어자 사용 이유
		//데이터를 보호하기 위해
		//사용하는데 불필요한 멤버를 숨기기 위해
//		t.clock();
		
		
	}	
	
}

















