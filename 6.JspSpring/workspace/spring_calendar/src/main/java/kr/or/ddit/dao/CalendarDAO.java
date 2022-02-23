package kr.or.ddit.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import kr.or.ddit.dto.FullCalendarVO;

@Repository
public interface CalendarDAO {
	public ArrayList<FullCalendarVO> calendarList();
}
