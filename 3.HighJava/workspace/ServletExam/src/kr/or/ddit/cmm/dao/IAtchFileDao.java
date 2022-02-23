package kr.or.ddit.cmm.dao;

import java.util.List;

import kr.or.ddit.cmm.vo.AtchFileVO;

public interface IAtchFileDao {
	
	/**
	 * 첨부파일 저장
	 * @param atchFileVO
	 * @return 
	 */
	public int insertAtchFile(AtchFileVO atchFileVO);
	
	/**
	 * 첨부파일 세부정보 저장
	 * @param atchFileVO
	 * @return
	 */
	public int insertAtchFileDetail(AtchFileVO atchFileVO);
	
	/**
	 * 첨부파일 목록 조회하기
	 * @param atchFileVO
	 * @return 첨부파일 목록
	 */
	public List<AtchFileVO> getAtchFileList(AtchFileVO atchFileVO);
	
	/**
	 * 첨부파일 세부정보 조회하기
	 * @param atcgFileVO
	 * @return 해당 첨부파일의 세부 정보
	 */
	public AtchFileVO getAtchFileDetail(AtchFileVO atchFileVO);
}
