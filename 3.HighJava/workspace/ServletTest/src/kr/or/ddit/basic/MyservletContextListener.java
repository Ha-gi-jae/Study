package kr.or.ddit.basic;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyservletContextListener implements ServletContextListener, ServletContextAttributeListener {


	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("[ MyservletContextListener ]에서 contextDestroyed() 호출됨. => " + arg0.getServletContext().getContextPath() );
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("[ MyservletContextListener ]에서 contextInitialized() 호출됨. => " + arg0.getServletContext().getContextPath() );
		
	}
	
	@Override
	public void attributeAdded(ServletContextAttributeEvent arg0) {
		System.out.println("[ MyservletContextListener ]에서 attributeAdded() 호출됨. => " + arg0.getName() + " : " + arg0.getValue());
		
	}
	
	@Override
	public void attributeRemoved(ServletContextAttributeEvent arg0) {
		System.out.println("[ MyservletContextListener ]에서 attributeRemoved() 호출됨. => " + arg0.getName() + " : " + arg0.getValue());
		
	}
	
	@Override
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
		System.out.println("[ MyservletContextListener ]에서 attributeReplaced() 호출됨. => " + arg0.getName() + " : " + arg0.getValue());
		
	}

}
