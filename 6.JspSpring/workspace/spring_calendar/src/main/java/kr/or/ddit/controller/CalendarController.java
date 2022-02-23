package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.CalendarService;

@Controller
@RequestMapping()
public class CalendarController {

	@Autowired(required = false)
	private CalendarService service;
	
	@GetMapping(params="method=list")
	public String list() {
		return "calendar.jsp";
	}
}
