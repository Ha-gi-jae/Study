package com.spring.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.MailRequestCommand;
import com.spring.mail.MimeAttachNotifier;

@Controller
@RequestMapping("/mail")
public class MailController {

	@Autowired
	private MimeAttachNotifier notifier;
	
	@RequestMapping(value="/form", method=RequestMethod.GET)
	public void mailGet() throws Exception{}
	
	// ModelAttribute - success 했을때 jsp 포워딩 하는데 화면에 뿌리려고 
	@RequestMapping(value="/send", method=RequestMethod.POST)
	public ModelAndView mailPost(MailRequestCommand mailReq, HttpServletRequest request, ModelAndView mnv) throws Exception{
		
		String url="mail/mail_success";
		
		MultipartFile attach = mailReq.getFile();
		
		String uploadPath = request.getServletContext().getRealPath("resources/mail_attach");
		
		//파일유무
		if(attach!=null && !attach.isEmpty()) {
			//파일의 크기
			if(attach.getSize()<1024 * 1024 * 5) {
				//파일 저장
				File file = new File(uploadPath, attach.getOriginalFilename());
				file.mkdirs();
				
				attach.transferTo(file);
				
				// 메일 메세지 보내기
				try {
					notifier.sendMail(mailReq, uploadPath);
				}catch (Exception e) { // 아이디 또는 비밀번호 틀리면 터짐.
					e.printStackTrace();
					url = "mail/mail_fail";
					mnv.addObject("message", "메일 보내기를 실패했습니다..");
				}
			}else {
				url="mail/mail_fail";
				mnv.addObject("message","첨부파일이 용량쵸과 입니다.");
			}
		}
		mnv.addObject("mailRequest", mailReq);
		
		//화면설정
		mnv.setViewName(url);
		return mnv;
	}
}
