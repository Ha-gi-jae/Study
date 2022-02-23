package com.jsp.listener;

import java.io.File;
import java.lang.reflect.Method;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.jsp.context.ApplicationContext;

public class ApplicationContextInitListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent arg0)  { 
    	System.out.println("Listener dead...");
    }

    public void contextInitialized(ServletContextEvent ctxEvent)  { 
    	System.out.println("Listener start!!!");
    	
    	ServletContext ctx = ctxEvent.getServletContext();
    	String beanConfigXml = ctx.getInitParameter("contextConfigLocation");
//    	System.out.println("context param : " + beanConfigXml);
    	
    	if(beanConfigXml == null) return;
    	
    	beanConfigXml = ctx.getRealPath("/") + beanConfigXml.replace("classpath:", "WEB-INF/classes/").replace("/", File.separator);
    	
//    	System.out.println(beanConfigXml);
    	
    	try {// w3c.dom
    		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    		DocumentBuilder documentBuilder = factory.newDocumentBuilder();
    		Document document = documentBuilder.parse(beanConfigXml); // xml이 Object로 바뀜.
    		
    		Element root = document.getDocumentElement();
    		
//    		System.out.println(root.getTagName());
    		
    		if(root == null || !root.getTagName().equals("beans")) return;
    		
    		// <beans> <bean id="identify" class="class Type"></bean> </beans>
    		NodeList beans = root.getElementsByTagName("bean");
    		
    		Map<String, Object> applicationContext = ApplicationContext.getApplicationContext(); // application context
    		
    		for(int i = 0; i < beans.getLength(); i++) { // bean instance 생성
//    			System.out.println(beans.item(i).getNodeName());
    			// 치환
    			Node bean = beans.item(i);
    			if (bean.getNodeType() == Node.ELEMENT_NODE) {
    				Element ele = (Element) bean;
    				String id = ele.getAttribute("id");
    				String classType = ele.getAttribute("class");
    				
//    				System.out.printf("id : %s, class=%s\n ", id, classType);
    				
    				//주소 @나온다 인스턴스 처리가 잘 된거다.
    				// map instance put
    				Class<?> cls = Class.forName(classType);
    				Object targetObj = cls.newInstance(); // single tone
    				applicationContext.put(id, targetObj);
//    				System.out.println("id : " + id + ", class : " + targetObj);
    			}
    		}
    		// 의존: 내가 아닌 얘가 하는것 dependence
    		// 의존 주입
    		for(int i = 0; i < beans.getLength(); i++) { // invoke 할때 쓰려고 만듬.
    			Node bean = beans.item(i);
    			if(bean.getNodeType() == Node.ELEMENT_NODE) {
    				Element eleBean = (Element) bean;
    				
    				NodeList properties = bean.getChildNodes();
    				
    				for(int j = 0; j < properties.getLength(); j++) {
    					Node property = properties.item(j);
    					if(!property.getNodeName().equals("property")) continue; //노드네임 property아니면 걸러줌.
    					
    					if(property.getNodeType() == Node.ELEMENT_NODE) { // 명시적(확인차)
    						Element ele = (Element) property;
    						String name = ele.getAttribute("name");
    						String ref = ele.getAttribute("ref-value");
    						
//    						System.out.printf("name = %s, ref-value=%s\n", name, ref);
    						
    						String setMethodName = "set" + name.substring(0, 1).toUpperCase() + name.substring(1);
    						
    						String className = eleBean.getAttribute("class"); // bean에 있는 eleBean(name)의 class를 가져옴.
    						Class<?> classType = Class.forName(className);
    						
    						Method[] methods = classType.getMethods();
    						for(Method method : methods) {
    							// 의존성 여부 확인
    							if(method.getName().equals(setMethodName)) {// 실제 메서드 이름().equals(property의 name을 가져와서 만든 set메서드)
    								method.invoke(applicationContext.get(eleBean.getAttribute("id")), applicationContext.get(ref));
    								// if문에서 비교를 안해주면 서버 펑펑 터짐.. 왜냐고? 모든 메서드 다 가져오니까.
//    								System.out.println("[invoke] " + applicationContext.get(eleBean.getAttribute("id")) +" : " + applicationContext.get(ref) );
    							}
    						}
     					}
    				}
    			}
    		}
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    }
	
}
