package com.spring.compass.command;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.util.CommonCodeUtil;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InptntVO;
import com.spring.compass.vo.SckbdreqVO;

public class ReqInptntDetailCommand extends InptntDetailCommand implements Serializable {

	private String hsptNo;
	private Date cancleYmd;
	private String childNo;
	private Date sckbdreqYmd = new Date();
	private String sckbdreqCode;
	private String type;
	private String sckbdreqNo;

	private String instNo;
	private String instNm;
	private int empCnt = 0;
	private String instTelno;
	private int rmndSckbdCnt = 0;
	private int sckbdCnt = 0;
	private String instAdres;
	private String instCode = "C103";
	private String cityNo;
	private String areaNo;

	public String getInstNo() {
		return instNo;
	}

	public void setInstNo(String instNo) {
		this.instNo = instNo;
	}

	public String getInstNm() {
		return instNm;
	}

	public void setInstNm(String instNm) {
		this.instNm = instNm;
	}

	public int getEmpCnt() {
		return empCnt;
	}

	public void setEmpCnt(int empCnt) {
		this.empCnt = empCnt;
	}

	public String getInstTelno() {
		return instTelno;
	}

	public void setInstTelno(String instTelno) {
		this.instTelno = instTelno;
	}

	public int getRmndSckbdCnt() {
		return rmndSckbdCnt;
	}

	public void setRmndSckbdCnt(int rmndSckbdCnt) {
		this.rmndSckbdCnt = rmndSckbdCnt;
	}

	public int getSckbdCnt() {
		return sckbdCnt;
	}

	public void setSckbdCnt(int sckbdCnt) {
		this.sckbdCnt = sckbdCnt;
	}

	public String getInstAdres() {
		return instAdres;
	}

	public void setInstAdres(String instAdres) {
		this.instAdres = instAdres;
	}

	public String getInstCode() {
		return instCode;
	}

	public void setInstCode(String instCode) {
		this.instCode = CommonCodeUtil.getCodeName(instCode);
	}

	public String getCityNo() {
		return cityNo;
	}

	public void setCityNo(String cityNo) {
		this.cityNo = cityNo;
	}

	public String getAreaNo() {
		return areaNo;
	}

	public void setAreaNo(String areaNo) {
		this.areaNo = areaNo;
	}

	public String getHsptNo() {
		return hsptNo;
	}

	public void setHsptNo(String hsptNo) {
		this.hsptNo = hsptNo;
	}

	public Date getCancleYmd() {
		return cancleYmd;
	}

	public void setCancleYmd(Date cancleYmd) {
		this.cancleYmd = cancleYmd;
	}

	public String getChildNo() {
		return childNo;
	}

	public void setChildNo(String childNo) {
		this.childNo = childNo;
	}

	public Date getSckbdreqYmd() {
		return sckbdreqYmd;
	}

	public void setSckbdreqYmd(Date sckbdreqYmd) {
		this.sckbdreqYmd = sckbdreqYmd;
	}

	public String getSckbdreqCode() {
		return sckbdreqCode;
	}

	public void setSckbdreqCode(String sckbdreqCode) {
		this.sckbdreqCode = CommonCodeUtil.getCodeName(sckbdreqCode);
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSckbdreqNo() {
		return sckbdreqNo;
	}

	public void setSckbdreqNo(String sckbdreqNo) {
		this.sckbdreqNo = sckbdreqNo;
	}

	public ReqInptntDetailCommand() {
	}

	public void setData(SckbdreqVO sckbdreq) {
		if(sckbdreq == null) return;
		this.sckbdreqCode = CommonCodeUtil.getCodeName(sckbdreq.getSckbdreqCode());
		this.cancleYmd = sckbdreq.getCancleYmd();
		this.childNo = sckbdreq.getChildNo();
		this.hsptNo = sckbdreq.getHsptNo();
		this.sckbdreqNo = sckbdreq.getSckbdreqNo();
		this.sckbdreqYmd = sckbdreq.getSckbdreqYmd();
		this.type = sckbdreq.getType();
	}

	public void setData(HsptVO hspt) {
		if(hspt == null) return;
		this.instNo = hspt.getInstNo();
		this.instNm = hspt.getInstNm();
		this.empCnt = hspt.getEmpCnt();
		this.instTelno = hspt.getInstTelno();
		this.rmndSckbdCnt = hspt.getRmndSckbdCnt();
		this.sckbdCnt = hspt.getSckbdCnt();
		this.instAdres = hspt.getInstAdres();
		this.instCode = hspt.getInstCode();
		this.cityNo = hspt.getCityNo();
		this.areaNo = hspt.getAreaNo();

	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}

}
