package com.jsp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.fileupload.FileItem;

import com.jsp.utils.MakeFileName;

public class SaveFileResolver {
	
	// 가지고 있는 인자가 없으니까 받아서 써야합니다! 그래서 static!
	public static List<File> fileUpload(FileItem[] items, String uploadPath) throws Exception{
		
		List<File> uploadFileList = new ArrayList<File>();
		
		File file = new File(uploadPath);
		file.mkdirs();
		
		//비어있는건 상관없음. 있는데 없으면 터짐.
		if (items != null) for (FileItem item : items) {
			String fileName = new File(item.getName()).getName(); // item.getName = File. 근데 왜 File을 씌웠냐? 경로명까지 나와서. 저렇게하면 파일명만 딱 빼주니까!
			//파일명을 구분할 필요가 없다면 위 작업을 하지않고  밑에 "","" 로 하면 UUID.확장자가 만들어진다. 
			fileName = MakeFileName.toUUIDFileName(fileName, "$$"); // 구분자 $$로해서 만들겠다. UUID$$파일명.확장자
			
			String filePath = uploadPath + File.separator + fileName;
			File storeFile = new File(filePath);
			
			// local HDD에 저장
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
