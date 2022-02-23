package kr.or.ddit.util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

//SqlMapClient객체를 제공하는 팩토리 클래스
public class SqlMapClientFactory {
	
	private static SqlMapClient smc; //SqlMapClient객체 변수 선언
	
	private SqlMapClientFactory() {	}
	
	public static SqlMapClient getInstance() {
		
		if(smc == null) {
			
			try {
				// 1-1. xml 설정문서 읽어오기
				//설정파일의 인코딩 설정
				Charset charset = Charset.forName("UTF-8");
				Resources.setCharset(charset);
				
				Reader rd = Resources.getResourceAsReader("kr/or/ddit/ibatis/config/SqlMapConfig.xml");
				
				// 1-2. 위에서 읽어온 Reader객체를 이용하여 실제 작업을 진행할 객체를 생성하기
				smc = SqlMapClientBuilder.buildSqlMapClient(rd);
				
				rd.close(); //Reader 객체 닫기
				
			} catch (IOException ex) {
				ex.printStackTrace();
			}
			
		}
		return smc;
	}

}
