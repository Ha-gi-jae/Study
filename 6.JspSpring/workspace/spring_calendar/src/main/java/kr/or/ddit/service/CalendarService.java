package kr.or.ddit.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.CalendarDAO;
import kr.or.ddit.dto.FullCalendarVO;

@Service
public class CalendarService {
	@Autowired(required = false)
	private CalendarDAO dao;
	
	public ArrayList<FullCalendarVO> calendarList(){
		return dao.calendarList();
	}
}
