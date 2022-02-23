package com.spring.compass.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.compass.vo.NoticeVO;

public class NoticeRegistCommand {
	
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private MultipartFile noticeFile;
	private String startDate;
	private String endDate;
	private Date startYmd;
	private Date endYmd;
	private String popUp;
	
	public String getPopUp() {
		return popUp;
	}

	public void setPopUp(String popUp) {
		this.popUp = popUp;
	}

	public Date getStartYmd() {
		return startYmd;
	}
	
	public Date getEndYmd() {
		return endYmd;
	}
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) throws Exception{
		this.startDate = startDate;
		String startDateformat = startDate.replaceAll("-", "");
		SimpleDateFormat dateChange = new SimpleDateFormat("yyyyMMdd");
		this.startYmd = dateChange.parse(startDateformat);
		
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) throws Exception{
		this.endDate = endDate;
		String endDateformat = endDate.replaceAll("-", "");
		SimpleDateFormat endDateChange = new SimpleDateFormat("yyyyMMdd");
		this.endYmd = endDateChange.parse(endDateformat);
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public MultipartFile getNoticeFile() {
		return noticeFile;
	}
	public void setNoticeFile(MultipartFile noticeFile) {
		this.noticeFile = noticeFile;
	}
	
	public NoticeVO toNoticeVo(String noticeNo, String mberNo) {
		NoticeVO notice = new NoticeVO();
		
		if(mberNo.equals("MBER259999999")) {
			notice.setWriter("시스템관리자");
		}else {
			notice.setWriter(noticeWriter);
		}
		
		if(this.popUp==null) {
			this.popUp="N";
		}
		
		notice.setNoticeNo(noticeNo);
		notice.setMberNo(mberNo);
		notice.setTitle(this.noticeTitle);
		notice.setContent(this.noticeContent);
		notice.setStartYmd(this.startYmd);
		notice.setEndYmd(this.endYmd);
		notice.setPopUp(this.popUp);
		return notice;
	}
	
	
}
