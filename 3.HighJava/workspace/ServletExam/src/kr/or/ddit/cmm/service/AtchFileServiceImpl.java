package kr.or.ddit.cmm.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.apache.log4j.Logger;

import kr.or.ddit.cmm.dao.AtchFileDaoImpl;
import kr.or.ddit.cmm.dao.IAtchFileDao;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class AtchFileServiceImpl implements IAtchFileService {
	
	private static Logger logger = Logger.getLogger(AtchFileServiceImpl.class); //Log4J 이용해서 로거 찍는거임.
	
	private static IAtchFileService fileService;
	private IAtchFileDao fileDao;
	
	//생성자
	private AtchFileServiceImpl() {
		fileDao = AtchFileDaoImpl.getInstance();
	}
	
	public static IAtchFileService getInstance() {
		if(fileService == null) fileService = new AtchFileServiceImpl();
		
		return fileService;
	}
	
	
	@Override
	public AtchFileVO saveAtchFileList(Map<String, FileItem[]> fileItemMap) throws Exception { // file upload할때 사용했었음. wrapper 이용한거!
		
		AtchFileVO atchFileVO = new AtchFileVO();
		
		fileDao.insertAtchFile(atchFileVO); // 기본 첨부파일 테이블에 저장. 위의 초기화 객체를 넣어준거임. 그런데 이게 이따가 사용하면 시퀀스 객체가 꽂아짐.
		
		for(FileItem[] itemArr : fileItemMap.values()) { // 키값은 필요없으니까 밸류만 가져오겠음.
			
			for(FileItem item : itemArr) { // 저장(업로드) 작업시작.
				
				File uploadDir = new File(FileUploadRequestWrapper.UPLOAD_DIRECTORY);
				
				if(!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				
				logger.info("item.getName() => " + item.getName()); // 현재 아이템값이 뭔지 보려고 찍은거임!
				
				String orignFileName = item.getName();	// 원본 파일명
				long fileSize = item.getSize();			// 파일크기
				String saveFileName = "";				// 저장파일명
				File storeFile = null;					// 저장파일객체
				String saveFilePath = "";				// 저장파일경로
				
				do {
					
					// 저장파일명 생성하기
					saveFileName = UUID.randomUUID().toString().replace("-", ""); 
					
					saveFilePath = FileUploadRequestWrapper.UPLOAD_DIRECTORY + File.separator + saveFileName;
					
					storeFile = new File(saveFilePath); // exists 쓰려고 한거임. 동일한게 있으면 다시 추출하려고.
					
					// 두개가 동일한 이름인걸 업로드 하더라도. 각각 업로드 시키고 싶은 상황임.
					// 그 두개를 구분하려면? 저장하는 시점에 파일명을 다르게 해서 구분시킬것이다.
					// 내부저장할때 그렇게 처리해주면된다.
					
				}while(storeFile.exists()); // 저장파일이 중복되지 않을때까지
				
				// 확장자명 추출
				String FileExtension = orignFileName.lastIndexOf(".") < 0 ? "" : orignFileName.substring(orignFileName.lastIndexOf(".") + 1);
				
				item.write(storeFile); // 업로드 파일 저장.
				
				atchFileVO.setStreFileNm(saveFileName);
				atchFileVO.setFileSize(fileSize);
				atchFileVO.setOrignlFileNm(orignFileName);
				atchFileVO.setFileExtsn(FileExtension);
				atchFileVO.setFileStreCours(saveFilePath); //저장경로!!!이걸 알아야 꺼내올 수 있음!!
				
				// 파일 상세정보 저장
				fileDao.insertAtchFileDetail(atchFileVO);
				
				item.delete(); // 임시 업로드 파일 삭제하기(임시저장소에 저장된게 쌓이면 디스크 용량 차지하니까 지우는거임.)
				
			}
			
		}
		
		return atchFileVO;
	}

	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO fileVO) {
		
		return fileDao.getAtchFileList(fileVO);
	}

	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO fileVO) {
		
		return fileDao.getAtchFileDetail(fileVO);
	}

}
