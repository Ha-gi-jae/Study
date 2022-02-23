package com.spring.compass.controller;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.compass.service.AdminService;
import com.spring.compass.service.HsptService;
import com.spring.compass.service.InspService;
import com.spring.compass.service.LtctService;
import com.spring.compass.service.MberService;
import com.spring.compass.service.PbhtService;

public class registFileResolver {
	
	public List<Map<String,String>> registInstXlsxFile(String filePath) throws Exception{
		List<Map<String, String>> instList = new ArrayList<Map<String,String>>();
		
		FileInputStream in = new FileInputStream(filePath);
		
		if(in !=null) {
			XSSFWorkbook workbook = new XSSFWorkbook(in);

			int rowNo =0;
			int cellIndex=0;

			XSSFSheet sheet = workbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();

			for(rowNo=1; rowNo<rows; rowNo++) {
				Map<String, String> instDataMap = new HashMap<String, String>();
				XSSFRow row = sheet.getRow(rowNo);

				if(row !=null) {
					int cells = row.getPhysicalNumberOfCells();

					for(cellIndex=0; cellIndex<cells; cellIndex++) {
						XSSFCell cell = row.getCell(cellIndex);
						String value ="";
						if(cell==null) {
							continue;
						}else {
							value = cell.getStringCellValue();
							
							switch (cellIndex) {
							case 1:
								instDataMap.put("city", value);
								//System.out.println("city:"+value);
								break;
							case 3:
								instDataMap.put("instNm", value);
								//System.out.println("instNm:"+value);
								break;
							case 4:
								instDataMap.put("instAdres", value);
								//System.out.println("instAdres:"+value);
								break;
							case 5:
								instDataMap.put("instTelNo", value);
								//System.out.println("instTelNo:"+value);
								break;
							case 6:
								instDataMap.put("responsibleAgency", value);
								break;
							}
													
						}
					}
					instList.add(instDataMap);
				}
			}
				
		}
		
		
		
		
		in.close();
		
		return instList;
	}
	
	public List<Map<String,String>> registInstXlsFile(String filePath) throws Exception{
		List<Map<String, String>> instList = new ArrayList<Map<String,String>>();
		
		FileInputStream in = new FileInputStream(filePath);
		
		if(in !=null) {
			HSSFWorkbook workbook = new HSSFWorkbook(in);

			int rowNo =0;
			int cellIndex=0;

			HSSFSheet sheet = workbook.getSheetAt(0);
			int rows = sheet.getPhysicalNumberOfRows();

			for(rowNo=1; rowNo<rows; rowNo++) {
				Map<String, String> instDataMap = new HashMap<String, String>();
				HSSFRow row = sheet.getRow(rowNo);

				if(row !=null) {
					int cells = row.getPhysicalNumberOfCells();

					for(cellIndex=0; cellIndex<cells; cellIndex++) {
						HSSFCell cell = row.getCell(cellIndex);
						String value ="";
						if(cell==null) {
							continue;
						}else {
							value = cell.getStringCellValue();
							
							switch (cellIndex) {
							case 1:
								instDataMap.put("city", value);
								System.out.println("city:"+value);
								break;
							case 3:
								instDataMap.put("instNm", value);
								System.out.println("instNm:"+value);

							case 4:
								instDataMap.put("instAdres", value);
								System.out.println("instAdres:"+value);
								break;
							case 5:
								instDataMap.put("instTelNo", value);
								System.out.println("instTelNo:"+value);
							case 6:
								instDataMap.put("responsibleAgency", value);
								break;
							}
													
						}
					}
					instList.add(instDataMap);
				}
			}
				
		}
		
		in.close();
		
		return instList;
	}
	
	
	
	
}
