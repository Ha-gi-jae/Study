package com.hgj.context;

import java.util.HashMap;
import java.util.Map;

public class ApplicationContext {
	
	{
		System.out.println("까꿍까꿍");
	}

	// 외부에서 직접 접근 불가능 X
	private static Map<String, Object> container = new HashMap<String, Object>();
	
	private ApplicationContext() {}
	
	
	// 은닉화. 외부에서는 getApplicationContext를 이용해서 container 값을 꺼내갈 수 만 있음.
	// setter가 없기때문에 ApplicationContext의 container 자체에 직접 값을 줄순 없다.
	
	public static Map<String, Object> getApplicationContext(){
		return container;
		// container = 빈 껍데기 를 제공해줌. 
	}
}
