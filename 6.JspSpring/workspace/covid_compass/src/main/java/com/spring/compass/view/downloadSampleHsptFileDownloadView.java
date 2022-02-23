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

public class downloadSampleHsptFileDownloadView implements View{
	
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

		Sheet sheet3 = workbook.createSheet("병원");
		sheet3.setColumnWidth((short)0, (short)5000);
		sheet3.setColumnWidth((short)1, (short)5000);
		sheet3.setColumnWidth((short)2, (short)5000);
		sheet3.setColumnWidth((short)3, (short)7000);
		sheet3.setColumnWidth((short)4, (short)15000);
		sheet3.setColumnWidth((short)5, (short)10000);
		
		int rowIndex3 = 0;
		Row headerRow3 = sheet3.createRow(rowIndex3++);

		Cell headerCell31 = headerRow3.createCell(0);
		headerCell31.setCellValue("기준일");
		
		Cell headerCell32 = headerRow3.createCell(1);
		headerCell32.setCellValue("시도");
		
		Cell headerCell33 = headerRow3.createCell(2);
		headerCell33.setCellValue("시군구");
		
		Cell headerCell34 = headerRow3.createCell(3);
		headerCell34.setCellValue("의룍기관명");
		
		Cell headerCell35 = headerRow3.createCell(4);
		headerCell35.setCellValue("주소");
		
		Cell headerCell36 = headerRow3.createCell(5);
		headerCell36.setCellValue("대표전화번호");
		
		for(int i=0; i<10; i++) {
			Row bodyRow = sheet3.createRow(rowIndex3++);
			
			Cell bodyCell1 = bodyRow.createCell(0);
			bodyCell1.setCellValue("2021년 12월 27일 18시");
			
			Cell bodyCell2 = bodyRow.createCell(1);
			bodyCell2.setCellValue("서울");
			
			Cell bodyCell3 = bodyRow.createCell(2);
			bodyCell3.setCellValue("강남구");
			
			
			Cell bodyCell4 = bodyRow.createCell(3);
			bodyCell4.setCellValue("샘플연세대학교강남세브란스병원");
			
			Cell bodyCell5 = bodyRow.createCell(4);
			bodyCell5.setCellValue("서울 강남구 언주로211");
			
			Cell bodyCell6 = bodyRow.createCell(5);
			bodyCell6.setCellValue("02-2019-2114");
			
		}
		
		response.setContentType(contentType);
		response.setHeader("Content-Disposition", "attachment;filename=hsptSampleFile.xlsx");
		
		workbook.write(response.getOutputStream());
		workbook.close();
	}

}
