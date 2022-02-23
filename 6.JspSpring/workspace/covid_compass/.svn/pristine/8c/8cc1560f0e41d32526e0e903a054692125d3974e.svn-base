package com.spring.compass.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.web.servlet.View;

public class downloadSampleInspFileDownloadView implements View{
	
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
		Workbook workbook = new SXSSFWorkbook();
		
		Sheet sheet = workbook.createSheet("검사소");
		sheet.setColumnWidth((short)0, (short)5000);
		sheet.setColumnWidth((short)1, (short)5000);
		sheet.setColumnWidth((short)2, (short)7000);
		sheet.setColumnWidth((short)3, (short)7000);
		sheet.setColumnWidth((short)4, (short)15000);
		sheet.setColumnWidth((short)5, (short)7000);
		sheet.setColumnWidth((short)6, (short)10000);
		sheet.setColumnWidth((short)7, (short)10000);
		
		
		int rowIndex = 0;
		Row headerRow = sheet.createRow(rowIndex++);

		Cell headerCell1 = headerRow.createCell(0);
		headerCell1.setCellValue("기준일");
		
		Cell headerCell2 = headerRow.createCell(1);
		headerCell2.setCellValue("시도");
		
		Cell headerCell3 = headerRow.createCell(2);
		headerCell3.setCellValue("시군구");
		
		Cell headerCell4 = headerRow.createCell(3);
		headerCell4.setCellValue("의룍기관명");
		
		Cell headerCell5 = headerRow.createCell(4);
		headerCell5.setCellValue("주소");
		
		Cell headerCell6 = headerRow.createCell(5);
		headerCell6.setCellValue("대표전화번호");
		
		Cell headerCell7 = headerRow.createCell(6);
		headerCell7.setCellValue("관할보건소");
		
		Cell headerCell8 = headerRow.createCell(7);
		headerCell8.setCellValue("관할보건소전화번호");
		
		for(int i=0; i<10; i++) {
			Row bodyRow = sheet.createRow(rowIndex++);
			
			Cell bodyCell1 = bodyRow.createCell(0);
			bodyCell1.setCellValue("2021년 12월 27일 18시");
			
			Cell bodyCell2 = bodyRow.createCell(1);
			bodyCell2.setCellValue("서울");
			
			Cell bodyCell3 = bodyRow.createCell(2);
			bodyCell3.setCellValue("강남구");
			
			
			Cell bodyCell4 = bodyRow.createCell(3);
			bodyCell4.setCellValue("샘플강남구검사소");
			
			Cell bodyCell5 = bodyRow.createCell(4);
			bodyCell5.setCellValue("서울특별시 강남구 삼성동(삼성2동) 8 강남구보건소");
			
			Cell bodyCell6 = bodyRow.createCell(5);
			bodyCell6.setCellValue("02-3423-5555");
			
			Cell bodyCell7 = bodyRow.createCell(6);
			bodyCell7.setCellValue("강남구보건소");
			
			Cell bodyCell8 = bodyRow.createCell(7);
			bodyCell8.setCellValue("02-3423-7138");
		}
		
		
		
		response.setContentType(contentType);
		response.setHeader("Content-Disposition", "attachment;filename=inspSampleFile.xlsx");
		
		workbook.write(response.getOutputStream());
		workbook.close();
	}

}
