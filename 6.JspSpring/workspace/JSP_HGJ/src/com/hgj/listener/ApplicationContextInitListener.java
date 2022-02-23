package com.hgj.listener;

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

import com.hgj.context.ApplicationContext;

/**
 * Application Lifecycle Listener implementation class ApplicationContextInitListener
 *
 */
@WebListener
public class ApplicationContextInitListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent sce)  { 
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	// ServletContextEvent 는 Event와 ServletContext를 같이 가지고 있음.
    	ServletContext sc = sce.getServletContext();
    	String beanConfigXml = sc.getInitParameter("contextConfigLocation");
    	// web.xml에서 parameter name이 contextConfigLocation 인 parameter-value를 가져옴
    	// context param은 전역임. 어디에서든지 다 가져다 쓸 수 있음.
    	
    	if(beanConfigXml == null) return; // 위에서 해당 내용을 못 가져왔으면 돌아가라!
    	
    	beanConfigXml = sc.getRealPath("/") + beanConfigXml.replace("classpath:", "WEB-INF/classes/").replace("/", File.separator);
    	// 톰캣이 배포한 실제 경로 + parametervalue에 있는 classpath: 를 WEB-INF/classes 경로로 변경,  OS마다 구분자 변경
    	
    	try {
    		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    		DocumentBuilder documentBuilder = factory.newDocumentBuilder();
			Document document = documentBuilder.parse(beanConfigXml);
			// beanConfigxml을 document로 만드려면 빌더로 파싱을 해줘야하는데 빌더를 만드려면 빌더팩토리가 필요함.
			
			Element root = document.getDocumentElement();
			// root의 태그네임 = beans
			
			if(root == null || !root.getTagName().equals("beans")) return;
			// root가 null 이거나 root에서 tagName을 가져온게 beans가 아니라면 돌아가.
			
			
			NodeList beans = root.getElementsByTagName("bean");
			// Tag Name이 bean인 요소들을 모두 NodeList에 넣어!
			Map<String, Object> applicationContext = ApplicationContext.getApplicationContext();
			
			for(int i = 0; i < beans.getLength(); i++) { // 현재 bean 3개.
				
				// 치환 
				Node bean = beans.item(i);
				if(bean.getNodeType() == Node.ELEMENT_NODE) {
					// element = <p /> <div /> 같은 태그. 리턴 상수 = 1 
					// bean,getNodeType 이 element타입 태그  이므로 리턴상수 1 이다.
					Element ele = (Element) bean;
					// bean이 element 타입 이니까 element 로 형변환
					// 왜 하냐? 요소의 속성 (id, class) 가져오려고.
					String id = ele.getAttribute("id"); // bean의 id
					String classType = ele.getAttribute("class"); // bean의 class
					
					System.out.printf("id : %s, class=%s\n",id,classType);
					
					Class<?> cls = Class.forName(classType);
					// bean에 있는 class 의 해당하는 이름을 가져옴.
					Object targetObj = cls.newInstance();
					// single tone 위에서 가져온 해당 클래스의 인스턴스를 생성.
					applicationContext.put(id, targetObj);
				}
			}
			
			for(int i = 0; i < beans.getLength(); i++) {
				Node bean = beans.item(i);
				if(bean.getNodeType() == Node.ELEMENT_NODE) {
					Element eleBean = (Element) bean;
					
					NodeList properties = bean.getChildNodes();
					// NodeList타입의 properties 에 bean의 하위 노드(property)를 넣어라.
					// 현재 하위 property 는 2개 있음! 그러므로 밑에 length는 2 임.
					for(int j = 0; j < properties.getLength(); j++) {
						Node property = properties.item(j);
						// NodeList 타입 properties의 아이템(인덱스) 를  Node타입 property에 넣어라!
						if(!property.getNodeName().equals("property")) continue; // 노드 네임이 property가 아니면 건너가렴.
						
						if(property.getNodeType() == Node.ELEMENT_NODE) {
							Element ele = (Element) property;
							String name = ele.getAttribute("name");
							String ref = ele.getAttribute("ref-value");
							
							System.out.printf("name = %s, ref-value=%s\n", name, ref);
							
							String setMethodName = "set"+name.substring(0, 1).toUpperCase() + name.substring(1);
							// 위에서 가져온 name을 set메서드 형식으로 바꿔주는중! set 하고 name의 첫글자 대문자 + 네임 두번째글자부터 끝까지.
							
							String className = eleBean.getAttribute("class");
							// bean태그에 있는 eleBean(name)의 class를 가져옴.
							
							Class<?> classType = Class.forName(className); // className의 클래스를 가져와서 classType넣기.
							
							Method[] methods = classType.getMethods(); // 해당 class의 모든 메소드를 가져와서 메소드타입의배열에 넣음!
							
							for(Method method : methods) {
								if(method.getName().equals(setMethodName)) {
									// 실제 메서드 이름과 내가가져와서 만든 set메서드의 이름이 같으면
									method.invoke(applicationContext.get(eleBean.getAttribute("id")), applicationContext.get(ref));
									// eleBean은 현재 memberService 태그의 bean임.
									System.out.println("[invoke] 해당 id의  context : "+applicationContext.get(eleBean.getAttribute("id")) + "   ref-value : " + applicationContext.get(ref));
								}
							}
						}
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
	
}
