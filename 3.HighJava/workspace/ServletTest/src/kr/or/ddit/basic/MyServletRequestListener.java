package kr.or.ddit.basic;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

public class MyServletRequestListener implements ServletRequestListener, ServletRequestAttributeListener {

	
	// request 객체가 사라지는 시점(response가 끝나는 시점)에. 원하는작업 
	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {
		System.out.println("[MyServletRequestListener] requestDestroyed 메서드 호출되었음.");
		
		
	}

	// request 객체가 초기화되는 시점에. 원하는 작업
	@Override
	public void requestInitialized(ServletRequestEvent arg0) {
		System.out.println("[MyServletRequestListener] requestInitialized 메서드 호출되었음.");
		
	}

	@Override
	public void attributeAdded(ServletRequestAttributeEvent arg0) {
		System.out.println("[MyServletRequestListener] attributeAdded 메서드 호출되었음. => " + arg0.getName());
		
	}

	@Override
	public void attributeRemoved(ServletRequestAttributeEvent arg0) {
		System.out.println("[MyServletRequestListener] attributeRemoved 메서드 호출되었음. => " + arg0.getName());
		
	}

	@Override
	public void attributeReplaced(ServletRequestAttributeEvent arg0) { // 톰캣 자체적으로 일어나는게 있나봄. Initialized 후에 생기는거.
		System.out.println("[MyServletRequestListener] attributeReplaced 메서드 호출되었음. => " + arg0.getName());
		
	}
	
}
