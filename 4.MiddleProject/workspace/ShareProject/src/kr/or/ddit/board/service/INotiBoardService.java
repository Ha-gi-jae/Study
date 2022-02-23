package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.board.vo.PagingVO;

public interface INotiBoardService {

	public int insertNotice(NoticeVO nv);
	
	//공지사항 총 사이즈
	public int noticeSize();
	
	//공지사항 상세조회
	public NoticeVO selectNotiBoard(int adminboard_id);
	
	//공지사항 수정
	public int noticeUpdate(NoticeVO nv);
	
	//공지사항 삭제
	public int NoticeDelete(int adminboard_id);
	
	//제목검색
	public List<NoticeVO> findTitle(PagingVO pv);
	
	public int findtitleCount(String notice_title);
	
	
	//내용검색
	public List<NoticeVO> findContent(PagingVO pv);
	public int findcontentCount(String notice_content);
	
}
