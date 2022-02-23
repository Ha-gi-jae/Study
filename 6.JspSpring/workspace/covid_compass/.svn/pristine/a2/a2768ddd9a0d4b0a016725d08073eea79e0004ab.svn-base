package com.spring.compass.parse;

import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.spring.compass.vo.CityVO;
import com.spring.compass.vo.CovidStatsAgeVO;
import com.spring.compass.vo.DailyCovidVO;
import com.spring.compass.vo.WholeCovidVO;

public class TestParsingExelCovidData {
	
	private Double wholeMillionPrsConfirm;
	private Double wholeMillionPrsDeath;
	private NumberFormat numberformat = NumberFormat.getInstance();
	//누적(발생별(국내발생+해외유입),사망)
	public WholeCovidVO excelParsingWholeCovid() throws Exception{
		String filePath ="c:\\covidData\\코로나현황.xlsx";
		WholeCovidVO wholeCovidVO = new WholeCovidVO();
		FileInputStream in = new FileInputStream(filePath);
		if(in!=null) {
			XSSFWorkbook workbook = new XSSFWorkbook(in);
			int rowNo = 0;
			int cellIndex = 0;
			
			XSSFSheet sheet0 = workbook.getSheetAt(0);
			//누적값구하는행
			XSSFRow rowFirst = sheet0.getRow(1);
			if(rowFirst!=null) {
				int cells = rowFirst.getPhysicalNumberOfCells();
				for(int i=0; i<cells; i++) {
					XSSFCell cell = rowFirst.getCell(i);
					if(cell==null) {
						continue;
					}else {
						switch (i) {
						case 0:
							//System.out.println("누적(글씨): "+rowFirst.getCell(i).toString());
							break;
						//누적(확진자)	
						case 1:
							int getIndex1 = rowFirst.getCell(i).toString().lastIndexOf(".");
							String wholeconfirm =rowFirst.getCell(i).toString().substring(0, getIndex1);
							wholeMillionPrsConfirm = Double.parseDouble(wholeconfirm);
							wholeCovidVO.setConfirm(wholeconfirm);
							//System.out.println("누적(확진자): "+wholeconfirm);
							break;
						//누적(국내발생현황)
						case 2:
							int getIndex2 = rowFirst.getCell(i).toString().lastIndexOf(".");
							String domestic =rowFirst.getCell(i).toString().substring(0, getIndex2);
							String comaDomestic = numberformat.format(Double.parseDouble(domestic));
							wholeCovidVO.setDomestic(comaDomestic);
							//System.out.println("누적(국내발생현황): "+domestic);
							break;
						//누적(해외유입현황)
						case 3:
							int getIndex3 = rowFirst.getCell(i).toString().lastIndexOf(".");
							String overseas =rowFirst.getCell(i).toString().substring(0, getIndex3);
							String comaOverseas = numberformat.format(Double.parseDouble(overseas));
							wholeCovidVO.setOverseas(comaOverseas);
							//System.out.println("누적(해외유입현황): "+overseas);
							break;
						//누적(사망자)
						case 4:
							int getIndex4 = rowFirst.getCell(i).toString().lastIndexOf(".");
							String wholedeath =rowFirst.getCell(i).toString().substring(0, getIndex4);
							wholeMillionPrsDeath = Double.parseDouble(wholedeath);
							wholeCovidVO.setWholedeath(wholedeath);
							//System.out.println("누적(사망): "+wholedeath);
							break;
						}
					}
				}
				
			}
			
		}
		return wholeCovidVO;
	}
	
	//일별(발생별(국내발생+해외유입),사망)
	public Map<String, DailyCovidVO> excelParsingDailyCovid() throws Exception{
		String filePath ="c:\\covidData\\코로나현황.xlsx";
		Map<String, DailyCovidVO> dailyCovidMap = new HashMap<String, DailyCovidVO>();
		//일별값 구하는행
		
		FileInputStream in = new FileInputStream(filePath);
		if(in !=null) {
			XSSFWorkbook workbook = new XSSFWorkbook(in);
			
			int rowNo = 0;
			int cellIndex = 0;
			
			XSSFSheet sheet0 = workbook.getSheetAt(0);
			
			int rows = sheet0.getPhysicalNumberOfRows();
			//System.out.println("rows:"+rows);
			int count=0;
			String dayStr="";
			for(rowNo=rows; rowNo>rows-8; rowNo--) {
				DailyCovidVO dailyCovidVO = new DailyCovidVO();
				count++;
				//System.out.println("count:"+count);
				switch (count) {
				case 2:
					dayStr="sevenDay";
					break;
				case 3:
					dayStr="sixDay";
					break;
				case 4:
					dayStr="fiveDay";
					break;
				case 5:
					dayStr="fourDay";
					break;
				case 6:
					dayStr="threeDay";
					break;
				case 7:
					dayStr="twoDay";
					break;
				case 8:
					dayStr="oneDay";
					break;
				}
				//System.out.println("rowNo:"+rowNo);
				XSSFRow row = sheet0.getRow(rowNo);
				if(row !=null) {
					int cells = row.getPhysicalNumberOfCells();
					//System.out.println("cells:"+cells);
					
					for(cellIndex=0; cellIndex<cells; cellIndex++) {
						XSSFCell cell = row.getCell(cellIndex);
						if(cell==null) {
							continue;
						}else {
							switch (cellIndex) {
							case 0:
								String day =row.getCell(cellIndex).toString();
								//System.out.println("일자:"+row.getCell(cellIndex).toString());
								dailyCovidVO.setBeforeday(day);
								break;
	
							case 1:
								int getIndex1 = row.getCell(cellIndex).toString().lastIndexOf(".");
								String confirm =row.getCell(cellIndex).toString().substring(0, getIndex1);
								dailyCovidVO.setConfirm(confirm);
								//System.out.println("확진자:"+confirm);
								break;
								
							case 2:
								int getIndex2 = row.getCell(cellIndex).toString().lastIndexOf(".");
								String domestic =row.getCell(cellIndex).toString().substring(0, getIndex2);
								dailyCovidVO.setDomestic(domestic);
								//System.out.println("국내발생:"+domestic);
								break;
								
							case 3:
								int getIndex3 = row.getCell(cellIndex).toString().lastIndexOf(".");
								String overseas =row.getCell(cellIndex).toString().substring(0, getIndex3);
								dailyCovidVO.setOverseas(overseas);
								//System.out.println("해외발생:"+overseas);
								break;
								
							case 4:
								int getIndex4 = row.getCell(cellIndex).toString().lastIndexOf(".");
								String death =row.getCell(cellIndex).toString().substring(0, getIndex4);
								dailyCovidVO.setDeath(death);
								//System.out.println("사망자:"+death);
								break;	
							}
							
						}
					}
					dailyCovidMap.put(dayStr, dailyCovidVO);
				}
			}
		}
		return dailyCovidMap;
	}
	
		//누적(연령별(확진자))
		public CovidStatsAgeVO excelParsingAgeCovid() throws Exception{
			String filePath ="c:\\covidData\\코로나현황.xlsx";
			CovidStatsAgeVO covidStatsAgeVO = new CovidStatsAgeVO();
			FileInputStream in = new FileInputStream(filePath);
			if(in!=null) {
				XSSFWorkbook workbook = new XSSFWorkbook(in);
				int rowNo = 0;
				int cellIndex = 0;
				
				XSSFSheet sheet1 = workbook.getSheetAt(1);
				//누적값구하는행
				XSSFRow rowFirst = sheet1.getRow(1);
				if(rowFirst!=null) {
					int cells = rowFirst.getPhysicalNumberOfCells();
					for(int i=0; i<cells; i++) {
						XSSFCell cell = rowFirst.getCell(i);
						if(cell==null) {
							continue;
						}else {
							switch (i) {
							//글씨
							case 0:
								//System.out.println("누적(글씨): "+rowFirst.getCell(i).toString());
								break;
							//총합계(확진자)	
							case 1:
								int getIndex1 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String wholeconfirm =rowFirst.getCell(i).toString().substring(0, getIndex1);
								//System.out.println("1: "+wholeconfirm);
								break;
							//0~9세
							case 2:
								int getIndex2 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String teenagerYounger =rowFirst.getCell(i).toString().substring(0, getIndex2);
								//System.out.println("2: "+teenagerYounger);
								covidStatsAgeVO.setTeenagerYounger(teenagerYounger);
								break;
							//10~19세
							case 3:
								int getIndex3 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String teenager =rowFirst.getCell(i).toString().substring(0, getIndex3);
								//System.out.println("3: "+teenager);
								covidStatsAgeVO.setTeenager(teenager);
								break;
							//20~29세
							case 4:
								int getIndex4 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String twenty =rowFirst.getCell(i).toString().substring(0, getIndex4);
								//System.out.println("4: "+twenty);
								covidStatsAgeVO.setTwenty(twenty);
								break;
							//30~39세
							case 5:
								int getIndex5 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String thirty =rowFirst.getCell(i).toString().substring(0, getIndex5);
								//System.out.println("5: "+thirty);
								covidStatsAgeVO.setThirty(thirty);
								break;
							//40~49세
							case 6:
								int getIndex6 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String forty =rowFirst.getCell(i).toString().substring(0, getIndex6);
								//System.out.println("6: "+forty);
								covidStatsAgeVO.setForty(forty);
								break;
							//50~59세
							case 7:
								int getIndex7 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String fifty =rowFirst.getCell(i).toString().substring(0, getIndex7);
								//System.out.println("7: "+fifty);
								covidStatsAgeVO.setFifty(fifty);
								break;
							//60~69세
							case 8:
								int getIndex8 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String sixty =rowFirst.getCell(i).toString().substring(0, getIndex8);
								//System.out.println("8: "+sixty);
								covidStatsAgeVO.setSixty(sixty);
							break;
							//70~79세
							case 9:
								int getIndex9 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String seventy =rowFirst.getCell(i).toString().substring(0, getIndex9);
								//System.out.println("9: "+seventy);
								covidStatsAgeVO.setSeventy(seventy);
							break;
							
							//80세 이상
							case 10:
								int getIndex10 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String eighty =rowFirst.getCell(i).toString().substring(0, getIndex10);
								//System.out.println("10: "+eighty);
								covidStatsAgeVO.setEighty(eighty);
							break;
							
							}
							
						}
					}
					
				}
				
			}
			return covidStatsAgeVO;
		}
		
		
		public Map<String, String> excelParsingGenderCovid()throws Exception{
			Map<String, String> genderMap = new HashMap<String, String>();
			String filePath ="c:\\covidData\\코로나현황.xlsx";
			FileInputStream in = new FileInputStream(filePath);
			if(in!=null) {
				XSSFWorkbook workbook = new XSSFWorkbook(in);
				int rowNo = 0;
				int cellIndex = 0;
				XSSFSheet sheet1 = workbook.getSheetAt(2);
				XSSFRow rowFirst = sheet1.getRow(1);
				if(rowFirst!=null) {
					int cells = rowFirst.getPhysicalNumberOfCells();
					for(int i=0; i<cells; i++) {
						XSSFCell cell = rowFirst.getCell(i);
						if(cell==null) {
							continue;
						}else {
							switch (i) {
							//남성
							case 2:
								int getIndex2 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String male =rowFirst.getCell(i).toString().substring(0, getIndex2);
								//System.out.println("2: "+male);
								genderMap.put("male", male);
								break;
							//여성
							case 3:
								int getIndex3 = rowFirst.getCell(i).toString().lastIndexOf(".");
								String female =rowFirst.getCell(i).toString().substring(0, getIndex3);
								//System.out.println("3: "+feMale);
								genderMap.put("female", female);
								break;
							}
						}
					}
				}
			}
			return genderMap;
		}
		
		public CityVO excelParsingCityCovid() throws Exception{
			CityVO city = new CityVO();
			String filePath ="c:\\covidData\\코로나현황.xlsx";
			FileInputStream in = new FileInputStream(filePath);
			
			if(in!=null) {
				XSSFWorkbook workbook = new XSSFWorkbook(in);
				int rowNo = 0;
				int cellIndex = 0;
				XSSFSheet sheet1 = workbook.getSheetAt(3);
				XSSFRow rowFirst = sheet1.getRow(1);
				if(rowFirst!=null) {
					int cells = rowFirst.getPhysicalNumberOfCells();
					for(int i=0; i<cells; i++) {
						XSSFCell cell = rowFirst.getCell(i);
						if(cell==null) {
							continue;
						}else {
							switch (i) {
								case 2:
									int getIndex2 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String seoul =rowFirst.getCell(i).toString().substring(0, getIndex2);
									city.setSeoul(seoul);
								break;
								
								case 3:
									int getIndex3 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String busan =rowFirst.getCell(i).toString().substring(0, getIndex3);
									city.setBusan(busan);
								break;
								
								case 4:
									int getIndex4 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String daegu =rowFirst.getCell(i).toString().substring(0, getIndex4);
									city.setDaegu(daegu);
								break;
								
								case 5:
									int getIndex5 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String incheon =rowFirst.getCell(i).toString().substring(0, getIndex5);
									city.setIncheon(incheon);
									break;
								
								case 6:
									int getIndex6 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String gwangju =rowFirst.getCell(i).toString().substring(0, getIndex6);
									city.setGwangju(gwangju);
									break;
								
								case 7:
									int getIndex7 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String daegeon =rowFirst.getCell(i).toString().substring(0, getIndex7);
									city.setDaegeon(daegeon);
									break;
								
								case 8:
									int getIndex8 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String ulsan =rowFirst.getCell(i).toString().substring(0, getIndex8);
									city.setUlsan(ulsan);
									break;
								
								case 9:
									int getIndex9 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String sejong =rowFirst.getCell(i).toString().substring(0, getIndex9);
									city.setSejong(sejong);
									break;
								case 10:
									int getIndex10 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String gyeonggi =rowFirst.getCell(i).toString().substring(0, getIndex10);
									city.setGyeonggi(gyeonggi);
									break;
								case 11:
									int getIndex11 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String gangwon =rowFirst.getCell(i).toString().substring(0, getIndex11);
									city.setGangwon(gangwon);
									break;
								case 12:
									int getIndex12 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String chungbuk =rowFirst.getCell(i).toString().substring(0, getIndex12);
									city.setChungbuk(chungbuk);
									break;
								case 13:
									int getIndex13 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String chungnam =rowFirst.getCell(i).toString().substring(0, getIndex13);
									city.setChungnam(chungnam);
									break;
								
								case 14:
									int getIndex14 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String jeonbuk =rowFirst.getCell(i).toString().substring(0, getIndex14);
									city.setJeonbuk(jeonbuk);
									break;
								
								case 15:
									int getIndex15 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String jeonnam =rowFirst.getCell(i).toString().substring(0, getIndex15);
									city.setJeonnam(jeonnam);
									break;
								
								case 16:
									int getIndex16 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String gyeongbuk =rowFirst.getCell(i).toString().substring(0, getIndex16);
									city.setGyeongbuk(gyeongbuk);
									break;
								
								case 17:
									int getIndex17 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String gyeongnam =rowFirst.getCell(i).toString().substring(0, getIndex17);
									city.setGyeongnam(gyeongnam);
									break;
								
								case 18:
									int getIndex18 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String jeju =rowFirst.getCell(i).toString().substring(0, getIndex18);
									city.setJeju(jeju);
									break;
								case 19:
									int getIndex19 = rowFirst.getCell(i).toString().lastIndexOf(".");
									String gumyeok =rowFirst.getCell(i).toString().substring(0, getIndex19);
									city.setGumyeok(gumyeok);
									break;
							}
						}
						
					}
				}
			}
			
			return city;
		}
	
}
