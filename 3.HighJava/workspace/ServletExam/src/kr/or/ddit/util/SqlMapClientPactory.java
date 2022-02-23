package kr.or.ddit.util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

/**
 * SqlMapClient 객체를 제공하는 팩토리 클래스
 * @author PC-04
 *
 */

public class SqlMapClientPactory {

	private static SqlMapClient smc; //SqlMapClient 객체 변수 선언
	
	private SqlMapClientPactory() {
	}
	
	public static SqlMapClient getInstance() {
		if(smc==null) {
			try {
				//1-1. xml설정문서 읽어오기
				//설정파일의 인코딩 설정
				Charset charset = Charset.forName("UTF-8");//한글이 있을 수 있기 때문에 utf-8로처리
				Resources.setCharset(charset);
				
				Reader rd= Resources.getResourceAsReader("SqlMapConfig.xml");
				
				//1-2. 위에서 읽어온 Reader객체를 이용하여 실제 작업을 진행할 객체를
				//     생성하기
				//iBatis를 사용한다는 것은 sqlMapClient객체를 만들어서 사용한다는 것이다.
				//SqlMapClient(인터페이스)타입의 객체 만들기
				smc = SqlMapClientBuilder.buildSqlMapClient(rd);
				
				rd.close();//Reader 객체 닫기
		
	          }catch(IOException ex) {
		       ex.printStackTrace();
	          }
           }
		       return smc;
	        }
    }
