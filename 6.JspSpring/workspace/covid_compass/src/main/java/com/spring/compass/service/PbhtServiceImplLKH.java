package com.spring.compass.service;

import java.util.Map;

import com.spring.compass.dao.HsptDAO;
import com.spring.compass.dao.LtctDAO;
import com.spring.compass.dao.PbhtDAO;
import com.spring.compass.dao.PstiDAO;
import com.spring.compass.util.MakeStatisticsLogByHspt;
import com.spring.compass.util.MakeStatisticsLogByLtct;
import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.LtctVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.SmplResultVO;

public class PbhtServiceImplLKH extends PbhtServiceImplLMY implements PbhtServiceLKH, PbhtServiceLMY{

	private PbhtDAO pbhtDAO;
	private PstiDAO pstiDAO;
	private HsptDAO hsptDAO;
	private LtctDAO ltctDAO;
	
	public void setHsptDAO(HsptDAO hsptDAO) {
		this.hsptDAO = hsptDAO;
	}

	public void setLtctDAO(LtctDAO ltctDAO) {
		this.ltctDAO = ltctDAO;
	}

	public void setPstiDAO(PstiDAO pstiDAO) {
		this.pstiDAO = pstiDAO;
	}

	public void setPbhtDAO(PbhtDAO pbhtDAO) {
		this.pbhtDAO = pbhtDAO;
	}
	
	
	@Override
	public PbhtVO getPbhtByPbhtNo(String pbhtNo) throws Exception {
		PbhtVO pbht = pbhtDAO.selectPbhtByPbhtNo(pbhtNo);
		return pbht;
	}
	
	@Override
	public int setCheckSmplRegist(Map<String, Object> checkData) throws Exception {
	
		int result = 0;

		String check = "success";
		
		int cnt = 0;
		
		cnt = pbhtDAO.selectCheckNewSmpl(checkData);
		if(cnt > 0) {
			if(checkData.get("sttusCode").equals("A102")) {
				checkData.put("pstvYn", "Y");
				checkData.put("chkdYn", "Y");
				checkData.put("smplResCode", "K102");
				if(pbhtDAO.newSmplResultRegist(checkData) == 0) check = "fail";
				if(pbhtDAO.smplUpdate(checkData) == 0)  check = "fail";
				if(pbhtDAO.cnfmUpdateY(checkData) == 0)  check = "fail";
			}else {
				checkData.put("pstvYn", "N");
				checkData.put("chkdYn", "Y");
				checkData.put("smplResCode", "K103");
				if(pbhtDAO.newSmplResultRegist(checkData) == 0) check = "fail";
				if(pbhtDAO.smplUpdate(checkData) == 0)  check = "fail";
				
				if(pbhtDAO.selectCnfmNgtv(checkData) < 2) {
					if(pbhtDAO.cnfmUpdateN(checkData) == 0)  check = "fail";
				}else {
					checkData.put("SttusCode", "A108");
					if(pbhtDAO.cnfmCureUpdate(checkData) == 0)  check = "fail";
					if(pbhtDAO.manageSttusCodeUpdate(checkData) == 0)  check = "fail";
					
					String instCode = pbhtDAO.selectInstCode(checkData);
					if(instCode.equals("C101")) {
						if(pbhtDAO.slfptntCureUpdate(checkData) == 0)	check = "fail";
					}else if(instCode.equals("C103")) {
						checkData.put("hsptlzCode", "E102");
						if(pbhtDAO.inptntCureUpdate(checkData) == 0) {
							check = "fail";
						}else {
							String smplNo = (String)checkData.get("smplNo");
							SmplResultVO smpl = pstiDAO.selectVSmplResultBySmplNo(smplNo);
							HsptVO hspt = hsptDAO.selectHsptByInstNo(smpl.getInstNo());
							String hsptNo = hspt.getHsptNo();
							MakeStatisticsLogByHspt.getInstance().makeHsptStatisticsRlsed(hsptNo);
						}
					}else {
						// isoptnt	{hsptlz_code : E102}
						checkData.put("hsptlzCode", "E102");
						if(pbhtDAO.isoptntCureUpdate(checkData) == 0) {
							check = "fail";
						}else {
							String smplNo = (String)checkData.get("smplNo");
							SmplResultVO smpl = pstiDAO.selectVSmplResultBySmplNo(smplNo);
							LtctVO ltct = ltctDAO.selectLtctByInstNo(smpl.getInstNo());
							String ltctNo = ltct.getLtctNo();
							MakeStatisticsLogByLtct.getInstance().makeLtctStatisticsRlsed(ltctNo);
						}
					}
				}
			}
		}else{	 // A102 = 양성, A103 = 음성
			if(checkData.get("sttusCode").equals("A102")) {
				int cnfmNo = pbhtDAO.selectCnfmNextVal();
				checkData.put("pstvYn", "Y");
				checkData.put("chkdYn", "Y");
				checkData.put("cnfmNo", cnfmNo);
				checkData.put("smplResCode", "K102");
				if(pbhtDAO.newSmplResultRegist(checkData) == 0) check = "fail";
				if(pbhtDAO.newCnfmResultRegist(checkData) == 0) check = "fail";
				if(pbhtDAO.smplUpdate(checkData) == 0)  check = "fail";
				if(pbhtDAO.manageSttusCodeUpdate(checkData) == 0)  check = "fail";
			}else{
				checkData.put("pstvYn", "N");
				checkData.put("chkdYn", "Y");
				checkData.put("smplResCode", "K103");
				if(pbhtDAO.newSmplResultRegist(checkData) == 0) check = "fail";
				if(pbhtDAO.smplUpdate(checkData) == 0)  check = "fail";
				if(pbhtDAO.manageSttusCodeUpdate(checkData) == 0)  check = "fail";
			}
			
		}
		
		if(check.equals("success")) {
			result = 1;
		}
		
		return result;
	}
	

}
