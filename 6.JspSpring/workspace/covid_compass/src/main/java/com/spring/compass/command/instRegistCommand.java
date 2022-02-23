package com.spring.compass.command;

import org.springframework.web.multipart.MultipartFile;

import com.spring.compass.util.MakeFileName;
import com.spring.compass.util.XSSUtil;

public class instRegistCommand {
	private String writer;
	private String inst;
	private MultipartFile instFile;
	private String fileName;
	
	private String instAdres;
	private String instName;
	private String instCall;
	private String resAgency;
	private String resAgencyNo;
	
	
	
	
	public String getResAgencyNo() {
		return resAgencyNo;
	}
	public void setResAgencyNo(String resAgencyNo) {
		this.resAgencyNo = resAgencyNo;
	}
	public String getResAgency() {
		return resAgency;
	}
	public void setResAgency(String resAgency) {
		this.resAgency = XSSUtil.xssProcess(resAgency);
	}
	public String getInstAdres() {
		return instAdres;
	}
	public void setInstAdres(String instAdres) {
		this.instAdres = XSSUtil.xssProcess(instAdres);
	}
	public String getInstName() {
		return instName;
	}
	public void setInstName(String instName) {
		this.instName =  XSSUtil.xssProcess(instName);
	}
	public String getInstCall() {
		return instCall;
	}
	public void setInstCall(String instCall) {
		this.instCall = XSSUtil.xssProcess(instCall);
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getInst() {
		return inst;
	}
	public void setInst(String inst) {
		this.inst = inst;
	}
	public MultipartFile getInstFile() {
		return instFile;
	}
	public void setInstFile(MultipartFile instFile) {
		this.instFile = instFile;
		this.fileName = MakeFileName.toUUIDFileName(this.instFile.getOriginalFilename(), "$$");
	}

	public String getFileName() {
		return fileName;
	}
	
	
	


}
