package com.jsp.controller;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

public class XSSHttpRequestParameterAdapter extends HttpRequestParameterAdapter {
	// 스태틱은 오버라이딩 X. 오버로드 해야함
	public static Object execute(HttpServletRequest request, Class<?> className, boolean xss)
			throws Exception{
	
		Object result=null;
		
		if(xss) {
			XSSResolver.parseXSS(request);
			
			//의존성 확인 및 조립
			Method[] methods = className.getMethods(); // modifyAction 기준. - command에 있는 모든 method.
			
			//인스턴스 생성
			result = className.newInstance(); // command class 객체 생성
			
			//setter 확인
			for (Method method : methods) { 
				if (method.getName().indexOf("set")==0) { // set 붙은 메서드
					String requestParamName = method.getName().replace("set", "");
					requestParamName = (requestParamName.charAt(0)+"").toLowerCase()+requestParamName.substring(1);
					// setNno 였으면 nno 로, setContent 였으면 content로 바꿔줌.
					String[] paramValues = (String[])request.getAttribute("XSS"+requestParamName);
					// Resolver에서  XSSparamname으로 Attribute에 세팅한걸 가져와서 value에 넣어줌.
					if(paramValues !=null && paramValues.length > 0) {
						if(	method.getParameterTypes()[0].isArray()) {
							method.invoke(result,new Object[] {paramValues});
						}else {
							method.invoke(result, paramValues[0]);
						}
											
					}
				}
			}
		}else {
			result = HttpRequestParameterAdapter.execute(request, className);
		}
		
		return result;
	}

	
}
