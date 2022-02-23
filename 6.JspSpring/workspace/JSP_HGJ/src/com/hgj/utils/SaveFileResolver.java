package com.hgj.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileItem;

public class SaveFileResolver {

	public static List<File> fileUpload(FileItem[] items, String uploadPath) throws Exception{
		List<File> uploadFileList = new ArrayList<File>();
		
		File file = new File(uploadPath);
		file.mkdirs();
		
		if(items != null) for(FileItem item : items) {
			String fileName = new File(item.getName()).getName();
			fileName = MakeFileName.toUUIDFileName(fileName, "$$");
			
			String filePath = uploadPath + File.separator + fileName;
			File storeFile = new File(filePath);
			
			try {
				item.write(storeFile);
			}catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
			uploadFileList.add(storeFile);
		}
		return uploadFileList;
	}
}
