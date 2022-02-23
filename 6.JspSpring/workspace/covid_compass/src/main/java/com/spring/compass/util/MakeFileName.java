package com.spring.compass.util;

import java.util.UUID;

public class MakeFileName {
	
	public static String toUUIDFileName(String fileName, String delimiter) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid+delimiter+fileName;
	}
	
	public static String parseFileNameFromUUID(String fileName, String delimiter) {
		String[] fileNameArr = fileName.split(delimiter);
		String originFileName = fileNameArr[fileNameArr.length-1];
		
		return originFileName;
	}
}
