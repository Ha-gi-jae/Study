package com.spring.compass.vo;

import java.util.Date;

public class AttachVO {
	private String atchNo;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private String noticeNo;
	private String mberNo;
	private Date regDate;
	private String type="A";
	private String instNo;
	
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getInstNo() {
		return instNo;
	}
	public void setInstNo(String instNo) {
		this.instNo = instNo;
	}
	public String getAtchNo() {
		return atchNo;
	}
	public void setAtchNo(String atchNo) {
		this.atchNo = atchNo;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
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
	
	@Override
	public String toString() {
		return "AttachVO [atchNo=" + atchNo + ", uploadPath=" + uploadPath + ", fileName=" + fileName + ", fileType="
				+ fileType + ", noticeNo=" + noticeNo + ", mberNo=" + mberNo + "]";
	}
	
	
}
