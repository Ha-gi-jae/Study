package com.spring.compass.view;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.web.servlet.View;

import com.spring.compass.vo.PstiVO;

public class PstiBackupFileDownloadView implements View{
	
	private String contentType ="ms-vnd/excel";
	
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	
	@Override
	public String getContentType() {
		return this.contentType;
	}


	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		List<PstiVO> pstiBackupList = (List<PstiVO>) model.get("pstiBackupList");
		
		Workbook workbook = new SXSSFWorkbook();
		
		Sheet sheet = workbook.createSheet();
		
		int rowIndex = 0;
		Row headerRow = sheet.createRow(rowIndex++);

		Cell headerCell1 = headerRow.createCell(0);
		headerCell1.setCellValue("피검자번호");
		
		Cell headerCell2 = headerRow.createCell(1);
		headerCell2.setCellValue("검사소번호");
		
		Cell headerCell3 = headerRow.createCell(2);
		headerCell3.setCellValue("이름");
		
		Cell headerCell4 = headerRow.createCell(3);
		headerCell4.setCellValue("성별");
		
		Cell headerCell5 = headerRow.createCell(4);
		headerCell5.setCellValue("연락처");
		
		Cell headerCell6 = headerRow.createCell(5);
		headerCell6.setCellValue("주소");
		
		
		for(PstiVO psti : pstiBackupList) {
			Row bodyRow = sheet.createRow(rowIndex++);
			
			Cell bodyCell1 = bodyRow.createCell(0);
			bodyCell1.setCellValue(psti.getPstiNo());
			
			Cell bodyCell2 = bodyRow.createCell(1);
			bodyCell2.setCellValue(psti.getInspNo());
			
			Cell bodyCell3 = bodyRow.createCell(2);
			bodyCell3.setCellValue(psti.getPstiNm());
			
			
			Cell bodyCell4 = bodyRow.createCell(3);
			bodyCell4.setCellValue(psti.getGender());
			
			Cell bodyCell5 = bodyRow.createCell(4);
			bodyCell5.setCellValue(psti.getPstiTelno());
			
			Cell bodyCell6 = bodyRow.createCell(5);
			bodyCell6.setCellValue(psti.getPstiAdres());
			
		}
		
		response.setContentType(contentType);
		response.setHeader("Content-Disposition", "attachment;filename=pstiBackup.xlsx");
		
		workbook.write(response.getOutputStream());
		workbook.close();
		
		
	}
	
	
}
