package kr.or.ddit.at.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.apache.log4j.Logger;

import kr.or.ddit.at.dao.AtchFileDaoImpl;
import kr.or.ddit.at.dao.IAtchFileDao;
import kr.or.ddit.at.vo.AtVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class AtchFileServiceImpl implements IAtchFileService{

	private static Logger logger = Logger.getLogger(AtchFileServiceImpl.class);
	
	private static IAtchFileService fileservice;
	private IAtchFileDao filedao;
	
	private AtchFileServiceImpl() {
		filedao = AtchFileDaoImpl.getInstnace();
	}
	
	public static IAtchFileService getInstance() {
		if(fileservice == null) {
			fileservice = new AtchFileServiceImpl();
		}
		return fileservice;
	}
	
	@Override
	public AtVO saveAtchFileList(Map<String, FileItem[]> fileItemMap) throws Exception {
		AtVO vo = new AtVO();
		
		long atchId = filedao.insertAtchFile(vo);
		
		System.out.println("여기는 atchservice =>" + atchId);
		
		for(FileItem[] itemArr : fileItemMap.values()) {
			for(FileItem item : itemArr) {
				File uploadDir = new File(FileUploadRequestWrapper.UPLOAD_DIRECTORY);
				
				if(!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				
				logger.info("item.getName() => " + item.getName());
				
				String originFileName = item.getName();
				long fileSize = item.getSize();
				String saveFileName = "";
				File storeFile = null;
				String saveFilePath = "";
				
				do {
					saveFileName = UUID.randomUUID().toString().replace("-", "");
					saveFilePath = FileUploadRequestWrapper.UPLOAD_DIRECTORY
							+ File.separator + saveFileName;
					storeFile = new File(saveFilePath);
				} while (storeFile.exists()); // 저장파일이 중복되지 않을때까지
				
				// 확장명 추출
				String fileExtension = originFileName.lastIndexOf(".") < 0 ? 
						"" : originFileName.substring(originFileName.lastIndexOf(".") + 1);
				
				item.write(storeFile); // 업로드 파일 저장
				
				vo.setStre_file_nm(saveFileName);
				vo.setFile_size(fileSize);
				vo.setOrignl_file_nm(originFileName);
				vo.setFile_extsn(fileExtension);
				vo.setFile_stre_cours(saveFilePath);
				// 파일상세 정보 저장
				filedao.insertAtchFileDetail(vo);
				
				// 임시 업로드 파일 삭제하기
				item.delete();
			}
		}
		
		return vo; // atchFileId를 나중에 쓸일이 있을 수 있기 때문에 리턴해줌
	}
	
	@Override
	public AtVO saveAtchFileList(Map<String, FileItem[]> fileItemMap, AtVO atVO) throws Exception {
		AtVO vo = atVO;

		long atchId = filedao.insertAtchFile(vo);
		
		System.out.println("여기는 atchservice =>" + atchId);
		
		for(FileItem[] itemArr : fileItemMap.values()) {
			for(FileItem item : itemArr) {
				File uploadDir = new File(FileUploadRequestWrapper.UPLOAD_DIRECTORY);
				
				if(!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				
				logger.info("item.getName() => " + item.getName());
				
				String originFileName = item.getName();
				long fileSize = item.getSize();
				String saveFileName = "";
				File storeFile = null;
				String saveFilePath = "";
				
				do {
					saveFileName = UUID.randomUUID().toString().replace("-", "");
					saveFilePath = FileUploadRequestWrapper.UPLOAD_DIRECTORY
							+ File.separator + saveFileName;
					storeFile = new File(saveFilePath);
				} while (storeFile.exists()); // 저장파일이 중복되지 않을때까지
				
				// 확장명 추출
				String fileExtension = originFileName.lastIndexOf(".") < 0 ? 
						"" : originFileName.substring(originFileName.lastIndexOf(".") + 1);
				
				item.write(storeFile); // 업로드 파일 저장
				vo.setStre_file_nm(saveFileName);
				vo.setFile_size(fileSize);
				vo.setOrignl_file_nm(originFileName);
				vo.setFile_extsn(fileExtension);
				vo.setFile_stre_cours(saveFilePath);
				// 파일상세 정보 저장
				filedao.insertAtchFileDetail(vo);

				// 임시 업로드 파일 삭제하기
				item.delete();
			}
		}
		
		return vo; // atchFileId를 나중에 쓸일이 있을 수 있기 때문에 리턴해줌
	}

	@Override
	public List<AtVO> getAtchFileList(AtVO atVO) {
		return filedao.getAtchFileList(atVO);
	}

	@Override
	public AtVO getAtchFileDetail(AtVO atVO) {
		
		return filedao.getAtchFileDetail(atVO);
	}

	@Override
	public int selectAtchId(int adminId) {
		if(filedao.chkAtch(adminId) > 0)
			return filedao.selectAtchId(adminId);
		return -1;
	}

	@Override
	public AtVO updateAtchFileList(Map<String, FileItem[]> fileItemMap, AtVO atVO) throws Exception {
		for(FileItem[] itemArr : fileItemMap.values()) {
			for(FileItem item : itemArr) {
				File uploadDir = new File(FileUploadRequestWrapper.UPLOAD_DIRECTORY);
				
				if(!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				
				logger.info("item.getName() => " + item.getName());
				
				String originFileName = item.getName();
				long fileSize = item.getSize();
				String saveFileName = "";
				File storeFile = null;
				String saveFilePath = "";
				
				do {
					saveFileName = UUID.randomUUID().toString().replace("-", "");
					saveFilePath = FileUploadRequestWrapper.UPLOAD_DIRECTORY
							+ File.separator + saveFileName;
					storeFile = new File(saveFilePath);
				} while (storeFile.exists()); // 저장파일이 중복되지 않을때까지
				
				// 확장명 추출
				String fileExtension = originFileName.lastIndexOf(".") < 0 ? 
						"" : originFileName.substring(originFileName.lastIndexOf(".") + 1);
				
				item.write(storeFile); // 업로드 파일 저장
				
				atVO.setStre_file_nm(saveFileName);
				atVO.setFile_size(fileSize);
				atVO.setOrignl_file_nm(originFileName);
				atVO.setFile_extsn(fileExtension);
				atVO.setFile_stre_cours(saveFilePath);
				
				atVO.setAtch_file_id(filedao.selectAtchId(atVO.getAdminboard_id()));
				// 파일상세 정보 저장
				filedao.updateAtchFileDetail(atVO);
				
				// 임시 업로드 파일 삭제하기
				item.delete();
			}
		}
		
		return atVO; // atchFileId를 나중에 쓸일이 있을 수 있기 때문에 리턴해줌
	}

	@Override
	public AtVO uploadFile(Map<String, FileItem[]> fileItemMap, AtVO atVO) throws Exception {
		for(FileItem[] itemArr : fileItemMap.values()) {
			for(FileItem item : itemArr) {
				File uploadDir = new File(FileUploadRequestWrapper.UPLOAD_DIRECTORY);
				
				if(!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				
				logger.info("item.getName() => " + item.getName());
				
				String originFileName = item.getName();
				long fileSize = item.getSize();
				String saveFileName = "";
				File storeFile = null;
				String saveFilePath = "";
				
				do {
					saveFileName = UUID.randomUUID().toString().replace("-", "");
					saveFilePath = FileUploadRequestWrapper.UPLOAD_DIRECTORY
							+ File.separator + saveFileName;
					storeFile = new File(saveFilePath);
				} while (storeFile.exists()); // 저장파일이 중복되지 않을때까지
				
				// 확장명 추출
				String fileExtension = originFileName.lastIndexOf(".") < 0 ? 
						"" : originFileName.substring(originFileName.lastIndexOf(".") + 1);
				
				item.write(storeFile); // 업로드 파일 저장
				
				atVO.setStre_file_nm(saveFileName);
				atVO.setFile_size(fileSize);
				atVO.setOrignl_file_nm(originFileName);
				atVO.setFile_extsn(fileExtension);
				atVO.setFile_stre_cours(saveFilePath);
				
				// 파일상세 정보 저장
				System.out.println(atVO);
				int num = filedao.uploadHWFile(atVO);
				
				// 임시 업로드 파일 삭제하기
				item.delete();
			}
		}
		
		return atVO; // atchFileId를 나중에 쓸일이 있을 수 있기 때문에 리턴해줌
	}

	@Override
	public int insertAtchId(int adminboard_id) {
		AtVO vo = new AtVO();
		vo.setAdminboard_id(adminboard_id);
		int atchId = filedao.inserAtchHWFile(vo);
		return atchId;
	}

}
