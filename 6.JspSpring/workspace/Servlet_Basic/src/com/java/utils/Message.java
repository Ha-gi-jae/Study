package com.java.utils;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;

import org.apache.ibatis.io.Resources;

public class Message {
	// 싱글톤
	private static Message instance = new Message();
	private Message() {} // 생성자  private! 외부접근 막아줌
	public static Message getInstance() {
		return instance;
	}
	
	private Properties properties = new Properties();
	
	public void initMessage(String propertiesURL)throws IOException{
		Reader reader = Resources.getResourceAsReader(propertiesURL);
		properties.load(reader);
	}
	
	public String getMessage(String key) {
		String message = properties.getProperty(key);
		return message;
	}
}
