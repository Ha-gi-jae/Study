package com.spring.compass.parse;

import java.io.IOException;
import java.net.URL;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class ParsingCovidData {
	
	
	public static Map<String, String> covidInoculation() throws ParserConfigurationException, SAXException, IOException{
		NumberFormat numberformat = NumberFormat.getInstance();
		Map<String, String> inoculationMap = new HashMap<String,String>();
		Double koreaPeople = 51620000.0;
		String url="https://nip.kdca.go.kr/irgd/cov19stats.do?list=all";
		DocumentBuilder builder =
				DocumentBuilderFactory.newInstance().newDocumentBuilder();
		URL url2 = new URL(url);
		
		Document document = builder.parse(url2.toString());
		
		Element root = document.getDocumentElement();
		
		NodeList rowNodeList = root.getElementsByTagName("item");
		
		Element element =(Element) rowNodeList.item(2);
		//1차접종률
		String firstCnt = element.getElementsByTagName("firstCnt").item(0).getTextContent();
		Double firstCntDB = Double.parseDouble(firstCnt);
		String comaFirstCnt = numberformat.format(firstCntDB);
		Double firstCntPrst = firstCntDB/koreaPeople*100;
		String firstCntPrStr = String.format("%.2f", firstCntPrst);
		inoculationMap.put("firstCnt",comaFirstCnt);
		inoculationMap.put("firstCntPrStr",firstCntPrStr);
		//2차접종률
		String secondCnt = element.getElementsByTagName("secondCnt").item(0).getTextContent();
		Double secondCntDB = Double.parseDouble(secondCnt);
		String comaSecondCnt = numberformat.format(secondCntDB);
		Double secondCntPrst =secondCntDB/koreaPeople*100;
		String secondCntPrStr = String.format("%.2f", secondCntPrst);
		inoculationMap.put("secondCnt", comaSecondCnt);
		inoculationMap.put("secondCntPrStr",secondCntPrStr);
		//3차접종률
		String thirdCnt = element.getElementsByTagName("thirdCnt").item(0).getTextContent();
		Double thirdCntDB = Double.parseDouble(thirdCnt);
		String comaThirdCnt = numberformat.format(thirdCntDB);
		Double thirdCntPrst =thirdCntDB/koreaPeople*100;
		String thirdCntPrStr = String.format("%.2f", thirdCntPrst);
		inoculationMap.put("thirdCnt", comaThirdCnt);
		inoculationMap.put("thirdCntPrStr", thirdCntPrStr);
		
		return inoculationMap;
	}
	
	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException{
			new ParsingCovidData().covidInoculation();
		
	}	
	
}
