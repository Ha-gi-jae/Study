package kr.or.ddit.basic;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MyHttpSessionListener implements HttpSessionListener, HttpSessionAttributeListener {

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("[ MyHttpSessionListener ]에서  sessionCreated() 호출됨. => " + arg0.getSession().getId());
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("[ MyHttpSessionListener ]에서  sessionDestroyed() 호출됨. => " + arg0.getSession().getId());
		
	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		System.out.println("[ MyHttpSessionListener ]에서  attributeAdded() 호출됨. => " + arg0.getName() + " : " + arg0.getValue());
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		System.out.println("[ MyHttpSessionListener ]에서  attributeRemoved() 호출됨. => " + arg0.getName() + " : " + arg0.getValue());
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		System.out.println("[ MyHttpSessionListener ]에서  attributeReplaced() 호출됨. => " + arg0.getName() + " : " + arg0.getValue());
		
	}

}
