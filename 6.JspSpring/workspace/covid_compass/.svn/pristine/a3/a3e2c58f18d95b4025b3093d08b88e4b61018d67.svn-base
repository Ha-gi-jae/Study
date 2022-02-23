package com.spring.compass.controller;

import java.text.NumberFormat;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.compass.command.ConfirmationVO;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.command.SmplSearchCommand;
import com.spring.compass.parse.ParsingCovidData;
import com.spring.compass.parse.TestParsingExelCovidData;
import com.spring.compass.service.InspService;
import com.spring.compass.service.PstiService;
import com.spring.compass.util.MakeComma;
import com.spring.compass.util.MakeMillionCalc;
import com.spring.compass.vo.CityVO;
import com.spring.compass.vo.CovidStatsAgeVO;
import com.spring.compass.vo.DailyCovidVO;
import com.spring.compass.vo.PbhtVO;
import com.spring.compass.vo.PstiVO;
import com.spring.compass.vo.TestResultCheckVO;
import com.spring.compass.vo.WholeCovidVO;

@Controller
public class GuestController {
	
	@Autowired
	private PstiService pstiService;
	
	@Autowired
	private InspService inspService;
	
	@Autowired
	private TestParsingExelCovidData testParsingExcelCovidData;
	
	public void setPstiService(PstiService pstiService) {
		this.pstiService = pstiService;
	}
	private NumberFormat numberformat = NumberFormat.getInstance();
	@RequestMapping("/guest/guest-main")
	public ModelAndView guest(ModelAndView mnv) throws Exception{
		String url ="guest/guest-main";
		
		WholeCovidVO wholeCovidVO = testParsingExcelCovidData.excelParsingWholeCovid();
		CityVO cityVO = testParsingExcelCovidData.excelParsingCityCovid();
		double confirm = Double.parseDouble(wholeCovidVO.getConfirm());
		String comaConfirm = numberformat.format(confirm);
		double death = Double.parseDouble(wholeCovidVO.getWholedeath());
		String comaDeath = numberformat.format(death);
		double lethality = death/confirm*100;
		wholeCovidVO.setLethality(String.format("%.2f", lethality));
		wholeCovidVO.setConfirm(comaConfirm);
		wholeCovidVO.setWholedeath(comaDeath);
		Map<String, String> covidInoculation = ParsingCovidData.covidInoculation();
		mnv.addObject("covidInoculation", covidInoculation);
		mnv.addObject("wholeCovidVO", wholeCovidVO);
		mnv.addObject("cityVO", cityVO);
		mnv.setViewName(url);
			
		return mnv;
	}
	@RequestMapping("/guest/question")
	public ModelAndView question(@RequestParam(defaultValue="")String inspNo, ModelAndView mnv)throws Exception {
		String url ="guest/question";
		
		if(!inspNo.equals("")) {
			String inspNm = inspService.getSelectInspNm(inspNo);
			mnv.addObject("inspNm", inspNm);
			mnv.addObject("inspNo", inspNo);
		}
		
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping("/guest/chart")
	public ModelAndView guestChart(ModelAndView mnv) throws Exception{
		String url="guest/guest-chart";
		mnv.setViewName(url);
		WholeCovidVO wholeCovidVO = testParsingExcelCovidData.excelParsingWholeCovid();
		Map<String, DailyCovidVO> beforedailyCovidMap = testParsingExcelCovidData.excelParsingDailyCovid();
		Map<String, DailyCovidVO> dailyCovidMap = MakeMillionCalc.calcDailyMillion(wholeCovidVO.getConfirm(), wholeCovidVO.getWholedeath(), beforedailyCovidMap);
		CovidStatsAgeVO covidStatsAgeVO = testParsingExcelCovidData.excelParsingAgeCovid();
		Map<String, String> genderMap = testParsingExcelCovidData.excelParsingGenderCovid();
		Map<String, String> commaDailyCovidMap = MakeComma.makeCommaDailyCovidVO(dailyCovidMap);
		mnv.addObject("commaDailyCovidMap", commaDailyCovidMap);
		mnv.addObject("wholeCovidVO", wholeCovidVO);
		mnv.addObject("dailyCovidMap", dailyCovidMap);
		mnv.addObject("covidStatsAgeVO", covidStatsAgeVO);
		mnv.addObject("genderMap", genderMap);
		
		return mnv;
	}
	
	
	@RequestMapping("/guest/insp-list")
	public ModelAndView inspList(ModelAndView mnv, @RequestParam(defaultValue="1")int page,
			 @RequestParam(defaultValue="15")int perPageNum,
			 @RequestParam(defaultValue="")String keyword,
			 @RequestParam(defaultValue="")String backPage)throws Exception {
		String url="guest/insp-list";
		String searchType = "";
		SearchCriteria cri = new SearchCriteria(page, perPageNum, searchType, keyword);
		
		System.out.println(cri);
		
		Map<String, Object> dataMap = pstiService.getinspList(cri);
		
		if(backPage.equals("question")) {
			mnv.addObject("question", "question");
		} 
		mnv.addObject("keyword", keyword);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/guest/gogo")
	public ModelAndView guestRegist(PstiVO psti, ModelAndView mnv ) throws Exception {
		String url="guest/question_success";
		
		String city = psti.getPstiAdres().split(" ")[0];
		
		String cityNo= pstiService.getPstiCityNo(city);
		psti.setAreaNo(cityNo);
		
		int checkResult = pstiService.getregistPstiCheck(psti);
		if(checkResult > 0) {
			
			int result = pstiService.registPstiUpdate(psti);
			
			mnv.addObject("result", result);
		
		}else {
			
			String pstiNo = pstiService.getPstiNextVal();
			
			psti.setPstiNo(pstiNo);
			
			int result = pstiService.registPsti(psti);
			mnv.addObject("result", result);
		}
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/guest/questionCheck")
	public ResponseEntity<Integer> questionCheck(PstiVO psti){
		
		ResponseEntity<Integer> entity = null;
		
		try {
			int result = pstiService.getQuestCheck(psti);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/guest/testResultCheckForm")
	public ModelAndView testResultCheckForm(ModelAndView mnv, String backPage) {
		String url = "guest/testResultCheckForm";
		
		mnv.addObject("backPage", backPage);
		mnv.setViewName(url);
		return mnv;
	}
	@RequestMapping("/guest/testResultCheck")
	public ModelAndView testResultCheck(TestResultCheckVO testResultCheckVO, ModelAndView mnv)throws Exception {
		String url = "guest/testResultCheck";
		
		
		TestResultCheckVO trcVO = pstiService.getTestResultCheck(testResultCheckVO);
		
		mnv.addObject("psti", testResultCheckVO);
		mnv.addObject("trcVO", trcVO);
		mnv.setViewName(url);
		
		return mnv;
	}
	@RequestMapping("/guest/confirmation")
	public ModelAndView confirmation(PstiVO psti, ModelAndView mnv)throws Exception {
		String url = "guest/confirmation";
		
		ConfirmationVO confirmation = pstiService.getConfirmation(psti);
		
		System.out.println(confirmation);
		mnv.addObject("confirmation", confirmation);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/guest/confirmationCheck")
	public ResponseEntity<Integer> confirmationCheck(PstiVO psti){
		
		ResponseEntity<Integer> entity = null;

		try {
			int result = pstiService.getConfirmationCheck(psti);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	    
	
}
