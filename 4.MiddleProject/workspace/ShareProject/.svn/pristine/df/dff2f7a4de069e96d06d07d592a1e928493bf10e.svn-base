package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.board.vo.PagingVO;

public interface INotiBoardDao {
	
	public int insertNotice(NoticeVO nv) throws SQLException;
	
	//공지사항 총 사이즈 
	public int noticeSize() throws SQLException;
	
	public NoticeVO selectNotiBoard(int adminboard_id) throws SQLException;
	
	public int noticeUpdate(NoticeVO nv) throws SQLException;
	
	public int NoticeDelete(int adminboard_id) throws SQLException;
	
	//제목검색
	public List<NoticeVO> findTitle(PagingVO pv) throws SQLException;
	
	public int findtitleCount(String notice_title) throws SQLException;
	
	
	////////////////////////////////////////
	
	//내용검색
	public List<NoticeVO> findContent(PagingVO pv) throws SQLException;
	public int findcontentCount(String notice_content) throws SQLException;
	//notice_title 가져오기
	

}
