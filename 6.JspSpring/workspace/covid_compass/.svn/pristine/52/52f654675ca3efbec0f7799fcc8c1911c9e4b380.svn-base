package com.spring.compass.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.compass.service.PbhtServiceLKH;
import com.spring.compass.util.MakeStatisticsLogByPbht;
import com.spring.compass.vo.PbhtVO;

@Controller
public class TestController {

	@RequestMapping("/test/main")
	public void main() {}

	@RequestMapping("/test/asdf")
	public void asdf() {

	}
	
	@Autowired
	private MakeStatisticsLogByPbht makeStatisticsByPbht;
	
	@Autowired
	private PbhtServiceLKH pbhtServiceLKH;	
	
	@RequestMapping("/pbhlth/smpls-confirmed-test")
	public ModelAndView smplsConfirmed(ModelAndView mnv, String smplNo, String manageNo, String sttusCode, HttpSession session)throws Exception {
		String url = "pbhlth/smple-list";
		PbhtVO pbht = (PbhtVO)(session.getAttribute("loginInst"));
		
		String[] smpls = smplNo.split(",");
		String[] manages = manageNo.split(",");
		
		
		for(int i = 0; i < smpls.length; i++) {
			
			Map<String, Object> data = new HashMap<String, Object>();
			
			data.put("smplNo", smpls[i]);
			data.put("manageNo", manages[i]);
			data.put("sttusCode", sttusCode);
			data.put("pbhtNo", pbht.getPbhtNo());
			
			int result = pbhtServiceLKH.setCheckSmplRegist(data);
			makeStatisticsByPbht.makePbhtStatisticsSmpleCnt(pbht.getPbhtNo());
			if(sttusCode.equals("A102")) {
				makeStatisticsByPbht.makePbhtStatisticsPstvGender(manages[i], pbht.getPbhtNo());
				makeStatisticsByPbht.makePbhtStatisticsPstvAge(manages[i], pbht.getPbhtNo());
			}
			if(sttusCode.equals("A103")) {
				makeStatisticsByPbht.makePbhtStatisticsNgtvGender(manages[i], pbht.getPbhtNo());
				makeStatisticsByPbht.makePbhtStatisticsNgtvAge(manages[i], pbht.getPbhtNo());
			}
		}
		
		
		
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping("/pbhlth/smpl-confirmed-test")
	public ModelAndView smplConfirmed(ModelAndView mnv, String smplNo, String manageNo, String sttusCode, HttpSession session)throws Exception {
		String url = "pbhlth/smple-list";
		PbhtVO pbht = (PbhtVO)(session.getAttribute("loginInst"));
		Map<String, Object> data = new HashMap<String, Object>();
		
		data.put("smplNo", smplNo);
		data.put("manageNo", manageNo);
		data.put("sttusCode", sttusCode);
		data.put("pbhtNo", pbht.getPbhtNo());
		
		int result = pbhtServiceLKH.setCheckSmplRegist(data);
		
		makeStatisticsByPbht.makePbhtStatisticsSmpleCnt(pbht.getPbhtNo());
		if(sttusCode.equals("A102")) {
			makeStatisticsByPbht.makePbhtStatisticsPstvGender(manageNo, pbht.getPbhtNo());
			makeStatisticsByPbht.makePbhtStatisticsPstvAge(manageNo, pbht.getPbhtNo());
		}
		if(sttusCode.equals("A103")) {
			makeStatisticsByPbht.makePbhtStatisticsNgtvGender(manageNo, pbht.getPbhtNo());
			makeStatisticsByPbht.makePbhtStatisticsNgtvAge(manageNo, pbht.getPbhtNo());
		}
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
}
