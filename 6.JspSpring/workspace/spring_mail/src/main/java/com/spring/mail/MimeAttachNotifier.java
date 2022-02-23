package com.spring.mail;

import java.io.File;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.spring.command.MailRequestCommand;

public class MimeAttachNotifier {

	// mailSender = bean등록한거
	private JavaMailSender mailSender;
	
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendMail(MailRequestCommand command, String uploadPath) throws Exception{
		
		// mime로 안하면 마크업이 나감 마크업 된게 나가는게아니라.
		// 마크업 + 이미지 + 첨부파일 가능
		// Message helper - springframework
		// 메시지 생성
		MimeMessage message = mailSender.createMimeMessage();
		
		// 메시지 작성 헬퍼
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
		
		// new InternetAddress 안하면 특수문자 다 깨진다.
		// 받는사람
		messageHelper.setTo(new InternetAddress(command.getReceiver()));
		// 보내는사람 + 이름
		messageHelper.setFrom(command.getSender(), "운영자");
		// 제목
		messageHelper.setSubject(command.getTitle());
		// 내용
		messageHelper.setText(command.getContent(), true);
		
		
		// 첨부파일
		if(command.getFile() != null && !command.getFile().isEmpty()) {
			String fileName = command.getFile().getOriginalFilename();
			DataSource dataSource = new FileDataSource(new File(uploadPath, fileName));
			
			messageHelper.addAttachment(MimeUtility.encodeText(fileName, "utf-8", "B"), dataSource);
		}
		
		mailSender.send(message);
		// request.getContextPath() 만주면   /ddit/ 가 됨.
		// https:/mail.naver.com/ddit/getImg?fileName=2oirjoiawejrv928$$apple.jpg
		// 그러므로 request.getContextPath()앞에  [(http://192.168.43.???) -IP] 풀 네임을 줘야함.
		
		
		
		//DataSource = 자바 메일에 있는 거임.
		//파일이 많으면 messageHelper.addAttachment가 여러번되는거.
	}
}
