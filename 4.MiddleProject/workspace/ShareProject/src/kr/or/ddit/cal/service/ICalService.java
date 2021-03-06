package kr.or.ddit.cal.service;

import java.util.List;

import kr.or.ddit.cal.vo.CalVO;
import kr.or.ddit.cal.vo.TtVO;

public interface ICalService {
	// 일정 조회
	public List<CalVO> calenList();
	
	// 일정 리스트 조회
	public List<CalVO> calenListDetail(String day);
	
	// 시간표 리스트 조회
	public List<TtVO> selectTt();
	
	// 일정등록
	public int calInsert(CalVO vo);
	
	// 시간표 등록
	public int ttInsert(TtVO vo);
	
	// 일정 삭제
	public int calDelete(int id);
	
	// 시간표 삭제
	public int ttDelete(int id);
	
	// 일정 수정
	public int calUpdate(CalVO vo);
	
	// 시간표 수정
	public int ttUpdate(TtVO vo);
	
	// tt_id 조회
	public int ttIdSelect(TtVO vo);
	
	// 멤버 그룹 조회
	public String mem_group(String mem_id);
}
