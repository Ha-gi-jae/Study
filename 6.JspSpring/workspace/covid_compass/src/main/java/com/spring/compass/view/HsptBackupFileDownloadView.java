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

import com.spring.compass.vo.HsptVO;
import com.spring.compass.vo.InspVO;

public class HsptBackupFileDownloadView implements View{
	
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

		List<HsptVO> hsptBackupList = (List<HsptVO>) model.get("hsptBackupList");
		
		Workbook workbook = new SXSSFWorkbook();
		
		Sheet sheet = workbook.createSheet();
		
		int rowIndex = 0;
		Row headerRow = sheet.createRow(rowIndex++);

		Cell headerCell1 = headerRow.createCell(0);
		headerCell1.setCellValue("기관번호");
		
		Cell headerCell2 = headerRow.createCell(1);
		headerCell2.setCellValue("기관명");
		
		Cell headerCell3 = headerRow.createCell(2);
		headerCell3.setCellValue("기관주소");
		
		Cell headerCell4 = headerRow.createCell(3);
		headerCell4.setCellValue("연락처");
		
		Cell headerCell5 = headerRow.createCell(4);
		headerCell5.setCellValue("직원수");
		
		
		for(HsptVO hspt : hsptBackupList) {
			Row bodyRow = sheet.createRow(rowIndex++);
			
			Cell bodyCell1 = bodyRow.createCell(0);
			bodyCell1.setCellValue(hspt.getHsptNo());
			
			Cell bodyCell2 = bodyRow.createCell(1);
			bodyCell2.setCellValue(hspt.getInstNm());
			
			Cell bodyCell3 = bodyRow.createCell(2);
			bodyCell3.setCellValue(hspt.getInstAdres());
			
			
			Cell bodyCell4 = bodyRow.createCell(3);
			bodyCell4.setCellValue(hspt.getInstTelno());
			
			Cell bodyCell5 = bodyRow.createCell(4);
			bodyCell5.setCellValue(hspt.getEmpCnt());
			
		}
		
		response.setContentType(contentType);
		response.setHeader("Content-Disposition", "attachment;filename=hsptBackup.xlsx");
		
		workbook.write(response.getOutputStream());
		workbook.close();
		
		
	}

	
}
