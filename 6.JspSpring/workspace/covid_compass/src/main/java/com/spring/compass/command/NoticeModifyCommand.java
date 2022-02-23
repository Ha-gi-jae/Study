package com.spring.compass.command;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.spring.compass.vo.NoticeVO;

public class NoticeModifyCommand {
	
	private String noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private MultipartFile noticeModifyFile;
	private String startDate;
	private String endDate;
	private Date startYmd;
	private Date endYmd;
	private String popUp;
	private String deleteFileCheck;
	private String deleteFileName;
	private String hiddenModifyFile;
	
	
	
	
	public String getHiddenModifyFile() {
		return hiddenModifyFile;
	}

	public void setHiddenModifyFile(String hiddenModifyFile) {
		this.hiddenModifyFile = hiddenModifyFile;
	}

	public String getDeleteFileCheck() {
		return deleteFileCheck;
	}

	public void setDeleteFileCheck(String deleteFileCheck) {
		this.deleteFileCheck = deleteFileCheck;
	}

	public String getDeleteFileName() {
		return deleteFileName;
	}

	public void setDeleteFileName(String deleteFileName) {
		this.deleteFileName = deleteFileName;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getPopUp() {
		return popUp;
	}

	public void setPopUp(String popUp) {
		if(popUp.equals("YE")) {
			popUp="Y";
		}
		if(popUp.equals("NE")) {
			popUp="N";
		}
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
	
	public MultipartFile getNoticeModifyFile() {
		return noticeModifyFile;
	}

	public void setNoticeModifyFile(MultipartFile noticeModifyFile) {
		this.noticeModifyFile = noticeModifyFile;
	}

	public NoticeVO toNoticeVo(String mberNo) {
		NoticeVO notice = new NoticeVO();
		
		if(mberNo.equals("MBER259999999")) {
			notice.setWriter("시스템관리자");
		}else {
			notice.setWriter(noticeWriter);
		}
		
		if(this.popUp==null) {
			this.popUp="N";
		}
		notice.setNoticeNo(this.noticeNo);
		notice.setMberNo(mberNo);
		notice.setTitle(this.noticeTitle);
		notice.setContent(this.noticeContent);
		notice.setStartYmd(this.startYmd);
		notice.setEndYmd(this.endYmd);
		notice.setPopUp(this.popUp);
		return notice;
	}
	
}
