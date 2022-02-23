package com.spring.compass.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.compass.command.PageMaker;
import com.spring.compass.command.SearchCriteria;
import com.spring.compass.vo.LoginVO;


public class LogReadingUtil {
	
	public static Map<String, Object> getLogList(String savePath, String fileName, SearchCriteria cri) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<LoginVO> storeList = new ArrayList<LoginVO>();
		String filePath = savePath +File.separator + fileName;
		
		File file = new File(filePath);
		
		if(!file.exists()) return dataMap; 
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		
		
		String line="";
		int count=0;
		while((line=in.readLine())!=null) {
			count++;
			LoginVO loginVO = new LoginVO();
			int num2=line.indexOf("]");
			String trans = line.substring(num2+1, line.length());
			String[] store = trans.split(",");
			loginVO.setInstNo(store[1]);
			loginVO.setMberNo(store[0]);
			loginVO.setUserIp(store[3]);
			loginVO.setUserLogTime(store[2]);
			loginVO.setMberNm(store[4]);
			
			storeList.add(loginVO);
		}
		
		List<LoginVO> tempList = new ArrayList<LoginVO>();
		int len = storeList.size();
		for(int i = 0; i < len; i++) {
			tempList.add(storeList.get(len-i-1));
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		List<LoginVO> loginList = new ArrayList<LoginVO>();
		int startNum = (cri.getPage()-1)*cri.getPerPageNum();
		int endNum = (cri.getPage()*cri.getPerPageNum())-1;
		
		endNum = Math.min(count - 1, endNum);
		
		
		for(int i = startNum; i <= endNum; i++) {
			loginList.add(tempList.get(i));
		}
		
		in.close();
		dataMap.put("loginList", loginList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	
	public static List<LoginVO> getMainLoginList(String filePath, String fileName) throws Exception{
		List<LoginVO> mainLogList = new ArrayList<LoginVO>();
		List<LoginVO> storeLogList = new ArrayList<LoginVO>();
		String logfilePath = filePath +File.separator + fileName;
		
		File file = new File(logfilePath);
		
		if(!file.exists()) return mainLogList;
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		
		String line="";
		while((line=in.readLine())!=null) {
			LoginVO loginVO = new LoginVO();
			int num2=line.indexOf("]");
			String trans = line.substring(num2+1, line.length());
			String[] store = trans.split(",");
			loginVO.setInstNo(store[1]);
			loginVO.setMberNo(store[0]);
			loginVO.setUserIp(store[3]);
			loginVO.setUserLogTime(store[2]);
			loginVO.setMberNm(store[4]);
			
			storeLogList.add(loginVO);
			
		}
		
		for(int i=storeLogList.size()-1; i>=storeLogList.size()-6; i--) {
			if(i<0) break;
			mainLogList.add(storeLogList.get(i));
		}
		
		return mainLogList;
	}
	
	public static List<LoginVO> getMainLoginFailList(String saveFailPath, String loginFailFileName) throws Exception{
		List<LoginVO> mainFailLogList = new ArrayList<LoginVO>();
		List<LoginVO> storeFailList = new ArrayList<LoginVO>();
		String logfilePath = saveFailPath + File.separator + loginFailFileName;
		
		File file = new File(logfilePath);
		
		if(!file.exists()) return mainFailLogList;
		
		BufferedReader in = new BufferedReader(new FileReader(file));
		
		String line ="";
		while((line=in.readLine())!=null) {
			LoginVO loginVO = new LoginVO();
			int num2=line.indexOf("]");
			String trans = line.substring(num2+1, line.length());
			String[] store = trans.split(",");
			loginVO.setMberNo(store[0]);
			loginVO.setInstNo(store[1]);
			loginVO.setUserLogTime(store[2]);
			loginVO.setUserIp(store[3]);
			loginVO.setMberNm(store[4]);
			
			storeFailList.add(loginVO);
		}
		for(int i=storeFailList.size()-1; i>=storeFailList.size()-6; i--) {
			if(i<0) break;
			mainFailLogList.add(storeFailList.get(i));
		}
		
		return mainFailLogList;
	}
	
}
