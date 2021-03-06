package kr.or.ddit.at.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.at.vo.AtVO;

public interface IAtchFileDao {
	/**
	 * 첨부파일 저장 
	 * @param atchFileVO
	 * @return
	 */
	public int insertAtchFile(AtVO atVO);
	
	/**
	 * 첨부파일 세부정보 저장
	 * @param atchFileVO
	 * @return
	 */
	public int insertAtchFileDetail(AtVO atVO);
	
	/**
	 * 첨부파일 목록 조회하기
	 * @param atchFileVO
	 * @return 첨부파일 목록
	 */
	public List<AtVO> getAtchFileList(AtVO atVO);
	
	/**
	 * 첨부파일 세부정보 조회하기
	 * @param atchFileVO
	 * @return 해당첨부파일의 세부 정보
	 */
	public AtVO getAtchFileDetail(AtVO atVO);
	
	public int selectAtchId(int adminId);

	public int updateAtchFileDetail(AtVO vo);
	
	/**
	 * 첨부파일이 있는지 확인 여부
	 * @param adminboard_id
	 * @return
	 */
	public int chkAtch(int adminboard_id);

	/**
	 * 과제 파일 등록하는 메서드
	 * @param atVO
	 * @return
	 */
	public int uploadHWFile(AtVO atVO);
	
	public int inserAtchHWFile(AtVO atVO);
	
	
}
