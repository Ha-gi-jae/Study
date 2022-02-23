package com.spring.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.command.ParamCommand;

@Controller
public class TestController { // 패키지는 servlet-context에서 작성한 대로 맞춰줘라!

	// URL 정의 , 방식 REQUEST의 GET

	@RequestMapping(value="/http",method=RequestMethod.GET)
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.printf("%s : %s : %d\n", id, pwd, num);
	}
	
	//param
	@RequestMapping(value="/param",method=RequestMethod.GET)
	public void getParam(@RequestParam(value="id", defaultValue="nana")String idd, String pwd, int num) throws IOException, ServletException{
		System.out.printf("%s : %s : %d\n", idd, pwd, num);
	}
	
	//command
	@RequestMapping(value="/command",method=RequestMethod.GET)
	public void getCommand(ParamCommand cmd) throws IOException, ServletException{
		System.out.printf("%s : %s : %d\n", cmd.getId(), cmd.getPwd(), cmd.getNum());
		System.out.println(cmd);
	}
}
