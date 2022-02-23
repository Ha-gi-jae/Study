package com.spring.compass.command;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.spring.compass.util.CommonCodeUtil;
import com.spring.compass.vo.CnfmVO;
import com.spring.compass.vo.DgnssResultVO;
import com.spring.compass.vo.InptntVO;

public class InptntDetailCommand extends DgnssDetailCommand implements Serializable{
	
	private String jobCode;
	private Date inYmd;
	private String critCode;
	private String ngtvCnt;
	
	private String disabled;
	
	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	public String getCritCode() {
		return critCode;
	}

	public void setCritCode(String critCode) {
		this.critCode = critCode;
	}

	public String getNgtvCnt() {
		return ngtvCnt;
	}

	public void setNgtvCnt(String ngtvCnt) {
		this.ngtvCnt = ngtvCnt;
	}

	public InptntDetailCommand() {}
	
	@Override
	public void setData(VPstiCommand psti) {
		if(psti == null) return;
		super.setData(psti);
		this.jobCode = CommonCodeUtil.getCodeName(psti.getJobCode());
	}
	
	public void setData(InptntVO inptnt) {
		if(inptnt == null) return;
		this.inYmd = inptnt.getInYmd();
	}
	
	public void setData(CnfmVO cnfm) {
		
		this.ngtvCnt = "0";
		if(cnfm != null) {
			this.ngtvCnt = cnfm.getNgtvCnt();
		}
	}
	
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = CommonCodeUtil.getCodeName(jobCode);
	}
	public Date getInYmd() {
		return inYmd;
	}
	public void setInYmd(Date inYmd) {
		this.inYmd = inYmd;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);		
	}
	
}
