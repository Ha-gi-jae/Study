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

public class downloadSampleLtctFileDownloadView implements View{
	
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
		Sheet sheet4 = workbook.createSheet("생활치료센터");
		sheet4.setColumnWidth((short)6, (short)10000);
		sheet4.setColumnWidth((short)0, (short)5000);
		sheet4.setColumnWidth((short)1, (short)5000);
		sheet4.setColumnWidth((short)2, (short)5000);
		sheet4.setColumnWidth((short)3, (short)7000);
		sheet4.setColumnWidth((short)4, (short)15000);
		sheet4.setColumnWidth((short)5, (short)10000);
		
		int rowIndex4 = 0;
		Row headerRow4 = sheet4.createRow(rowIndex4++);

		Cell headerCell41 = headerRow4.createCell(0);
		headerCell41.setCellValue("기준일");
		
		Cell headerCell42 = headerRow4.createCell(1);
		headerCell42.setCellValue("시도");
		
		Cell headerCell43 = headerRow4.createCell(2);
		headerCell43.setCellValue("시군구");
		
		Cell headerCell44 = headerRow4.createCell(3);
		headerCell44.setCellValue("의룍기관명");
		
		Cell headerCell45 = headerRow4.createCell(4);
		headerCell45.setCellValue("주소");
		
		Cell headerCell46 = headerRow4.createCell(5);
		headerCell46.setCellValue("대표전화번호");
		
		for(int i=0; i<10; i++) {
			Row bodyRow = sheet4.createRow(rowIndex4++);
			
			Cell bodyCell1 = bodyRow.createCell(0);
			bodyCell1.setCellValue("2021년 12월 27일 18시");
			
			Cell bodyCell2 = bodyRow.createCell(1);
			bodyCell2.setCellValue("서울");
			
			Cell bodyCell3 = bodyRow.createCell(2);
			bodyCell3.setCellValue("강남구");
			
			
			Cell bodyCell4 = bodyRow.createCell(3);
			bodyCell4.setCellValue("샘플강남구생활치료센터");
			
			Cell bodyCell5 = bodyRow.createCell(4);
			bodyCell5.setCellValue("서울 강남구 삼성동(삼성2동) 8 강남구생활치료센터");
			
			Cell bodyCell6 = bodyRow.createCell(5);
			bodyCell6.setCellValue("02-3423-5555");
			
		}
		
		response.setContentType(contentType);
		response.setHeader("Content-Disposition", "attachment;filename=ltctSampleFile.xlsx");
		
		workbook.write(response.getOutputStream());
		workbook.close();
	}

}
