package com.spring.compass.vo;

import java.util.Date;

public class NoticeVO {
	private String noticeNo;
	private String mberNo;
	private String instNo;
	private String title;
	private String content;
	private String useYn;
	private Date startYmd=new Date();
	private Date endYmd = new Date();
	private String writer;
	private Date wrtYmd;
	private String popUp;
	
	
	
	
	
	
	public String getPopUp() {
		return popUp;
	}
	public void setPopUp(String popUp) {
		this.popUp = popUp;
	}
	public Date getWrtYmd() {
		return wrtYmd;
	}
	public void setWrtYmd(Date wrtYmd) {
		this.wrtYmd = wrtYmd;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getMberNo() {
		return mberNo;
	}
	public void setMberNo(String mberNo) {
		this.mberNo = mberNo;
	}
	public String getInstNo() {
		return instNo;
	}
	public void setInstNo(String instNo) {
		this.instNo = instNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public Date getStartYmd() {
		return startYmd;
	}
	public void setStartYmd(Date startYmd) {
		this.startYmd = startYmd;
	}
	public Date getEndYmd() {
		return endYmd;
	}
	public void setEndYmd(Date endYmd) {
		this.endYmd = endYmd;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", mberNo=" + mberNo + ", instNo=" + instNo + ", title=" + title
				+ ", content=" + content + ", useYn=" + useYn + ", startYmd=" + startYmd + ", endYmd=" + endYmd + "]";
	}
	
	
	
	
	
	
}
