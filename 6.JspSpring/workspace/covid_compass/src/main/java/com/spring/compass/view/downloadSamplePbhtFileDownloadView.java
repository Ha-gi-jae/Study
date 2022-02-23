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

public class downloadSamplePbhtFileDownloadView implements View{
	
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
		Sheet sheet2 = workbook.createSheet("보건소");
		sheet2.setColumnWidth((short)0, (short)5000);
		sheet2.setColumnWidth((short)1, (short)5000);
		sheet2.setColumnWidth((short)2, (short)7000);
		sheet2.setColumnWidth((short)3, (short)7000);
		sheet2.setColumnWidth((short)4, (short)15000);
		sheet2.setColumnWidth((short)5, (short)7000);
		sheet2.setColumnWidth((short)6, (short)10000);
		sheet2.setColumnWidth((short)7, (short)10000);
		
		int rowIndex2 = 0;
		Row headerRow2 = sheet2.createRow(rowIndex2++);

		Cell headerCell21 = headerRow2.createCell(0);
		headerCell21.setCellValue("기준일");
		
		Cell headerCell22 = headerRow2.createCell(1);
		headerCell22.setCellValue("시도");
		
		Cell headerCell23 = headerRow2.createCell(2);
		headerCell23.setCellValue("시군구");
		
		Cell headerCell24 = headerRow2.createCell(3);
		headerCell24.setCellValue("의룍기관명");
		
		Cell headerCell25 = headerRow2.createCell(4);
		headerCell25.setCellValue("주소");
		
		Cell headerCell26 = headerRow2.createCell(5);
		headerCell26.setCellValue("대표전화번호");
		
		Cell headerCell27 = headerRow2.createCell(6);
		headerCell27.setCellValue("관할보건소");
		
		Cell headerCell28 = headerRow2.createCell(7);
		headerCell28.setCellValue("관할보건소전화번호");
		
		for(int i=0; i<10; i++) {
			Row bodyRow = sheet2.createRow(rowIndex2++);
			
			Cell bodyCell1 = bodyRow.createCell(0);
			bodyCell1.setCellValue("2021년 12월 27일 18시");
			
			Cell bodyCell2 = bodyRow.createCell(1);
			bodyCell2.setCellValue("서울");
			
			Cell bodyCell3 = bodyRow.createCell(2);
			bodyCell3.setCellValue("강남구");
			
			
			Cell bodyCell4 = bodyRow.createCell(3);
			bodyCell4.setCellValue("샘플강남구보건소");
			
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
		response.setHeader("Content-Disposition", "attachment;filename=pbhtSampleFile.xlsx");
		
		workbook.write(response.getOutputStream());
		workbook.close();
	}

}
