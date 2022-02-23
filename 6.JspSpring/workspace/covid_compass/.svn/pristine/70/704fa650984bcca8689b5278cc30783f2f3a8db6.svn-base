package com.spring.compass.util;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class FileRegistUtil {
	
	public static String fileRegist(MultipartFile file , String filePath) throws Exception{
		String fileName = MakeFileName.toUUIDFileName(file.getOriginalFilename(), "$$");
		File target = new File(filePath,fileName);
		
		target.mkdirs();
		
		file.transferTo(target);
		
		return fileName;
	}
}
