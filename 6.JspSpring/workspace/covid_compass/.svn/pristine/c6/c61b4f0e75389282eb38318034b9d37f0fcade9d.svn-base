package com.spring.compass.util;

import com.josephoconnell.html.HTMLInputFilter;

public class XSSUtil {

	public static String xssProcess(String str) {
		
		String xssStr = null;
		
		if(str != null) {
			xssStr = HTMLInputFilter.htmlSpecialChars(str);
		}
		
		return xssStr;
				
		
	}
}
