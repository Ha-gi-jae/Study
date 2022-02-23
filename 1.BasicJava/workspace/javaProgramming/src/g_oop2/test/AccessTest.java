package g_oop2.test;

import g_oop2.AccessModifier;

public class AccessTest extends AccessModifier {//하위패키지라 import를 해줘야 한다.
												//하위패키지라 해서 같은 패키지가 아니다.
												//상속 받았는데 왜  protected 않되냐?
												//내것이 아니라서. 내것처럼 접근을 해야함.
												//am이 아니라 at.
	public static void main(String[] args) {
		AccessModifier am = new AccessModifier();
		
		System.out.println(am.publicVar);
		am.publicMethod();
		
//		System.out.println(am.protectedVar);
//		am.protectedMethod();
		
//		System.out.println(am.defaultVar);
//		am.defaultMethod();
		
//		System.out.println(am.privateVar);
//		am.privateMethod();
		
		AccessTest at = new AccessTest();
		
		System.out.println(at.protectedVar);
		at.protectedMethod();
		
	}
	
}
