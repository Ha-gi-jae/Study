package com.jsp.controller;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;

import com.jsp.action.Action;
import com.jsp.context.ApplicationContext;

public class HandlerMapper {

	private static final String PATH = "com/jsp/properties/url";
	
	private Map<String, Action> commandMap = new HashMap<String,Action>();
	
	public HandlerMapper() throws Exception{
		this(PATH);
	}
	
	//생성자 오버로딩
	public HandlerMapper(String path) throws Exception{
		
		// resourceBundle.getBundle(경로+파일명) : properties만 읽어서 경로에 properties를 적어 줄 필요가 없다.
		ResourceBundle rbHome = ResourceBundle.getBundle(path);
		
		Set<String> actionSetHome = rbHome.keySet(); // uri set
		
		Iterator<String> it = actionSetHome.iterator();
		
		while(it.hasNext()) {
			String command = it.next(); // key -> url
//			System.out.println("command : " + command ); // key
			String actionClassName = rbHome.getString(command);
//			System.out.println("actionClassName : "+actionClassName); // value
			
			
			try {
				Class<?> actionClass = Class.forName(actionClassName);
				Action commandAction = (Action) actionClass.newInstance();
				
				//의존주입(service, dao...)
				// 의존성 확인 및 조립
				Method[] methods = actionClass.getMethods();
				for(Method method : methods) {
					if(method.getName().indexOf("set")==0) {
						String paramType = method.getParameterTypes()[0].getName();
						// 패키지명까지 붙어서 나오기때문에 마지막 . 을 기준으로 +1 하면 클래스명.
						paramType = paramType.substring(paramType.lastIndexOf(".")+1);
						// 첫글자 소문자로 고쳐주기.
						paramType = (paramType.charAt(0)+"").toLowerCase() + paramType.substring(1);
						
						method.invoke(commandAction, ApplicationContext.getApplicationContext().get(paramType));
//						System.out.println("[HandlerMapper:invoke]   " + ApplicationContext.getApplicationContext().get(paramType));
						
					}
				}
				commandMap.put(command, commandAction);
				System.out.println("[HandlerMapper]" + command+ " : " + commandAction + " 가 준비되었습니다.");
			}catch (ClassNotFoundException e) {
				System.out.println("[HandlerMapper]" + actionClassName + "이 존재하지 않습니다.");
				throw e;
			}catch (InstantiationException e) {
				System.out.println("[HandlerMapper]" + actionClassName + "의 인스턴스를 생성할 수 없습니다.");
				throw e;
			}catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		}
	}
	
	public Action getAction(String url) {
		Action action = commandMap.get(url);
		return action;
	}
}
