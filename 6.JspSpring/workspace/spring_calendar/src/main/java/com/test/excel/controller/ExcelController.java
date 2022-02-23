package com.test.excel.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.excel.service.ExcelService;
import com.test.excel.vo.Fruit;

@Controller
public class ExcelController {
	
	private ExcelService excelService;
	
	public void setExcelService (ExcelService excelService) {
		this.excelService = excelService;
	}

	@RequestMapping(value = "/downloadExcelFile", method = RequestMethod.POST)
	public String downloadExcelFile(Model model) {
		String[] names = {"자몽", "애플망고", "멜론", "오렌지", "딸기"};
		long[] prices = {5000, 10000, 7000, 6000, 15000};
		int[] quantities = {50,50,40,40, 30};
		List<Fruit> list = excelService.makeFruitList(names, prices, quantities);
		
		SXSSFWorkbook workbook = excelService.excelFileDownloadProcess(list);
		
		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "과일표");
		
		return "excelDownloadView";
	}
	
	@RequestMapping(value = "/uploadExcelFile", method = RequestMethod.POST)
	public String uploadExcelFile(MultipartHttpServletRequest request, Model model) {
		MultipartFile file = null;
		Iterator<String> iterator = request.getFileNames();
		if(iterator.hasNext()) {
			file = request.getFile(iterator.next());
		}
		List<Fruit> list = excelService.uploadExcelFile(file);
		
		model.addAttribute("list", list);
		return "jsonView";
	}
}
