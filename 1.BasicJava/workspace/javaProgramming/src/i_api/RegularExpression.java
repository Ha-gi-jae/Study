package i_api;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegularExpression {

	public static void main(String[] args) {
		/*
		 *  정규표현식 : 문자열의 패턴을 검사하는 표현식
		 *  
	캐럿	 * ^	뒷 문자로 시작
	달러	 * $	앞 문자로 종료
		 * .	임의의 문자(줄바꿈 제외)
		 * *	앞 문자가 0개 이상
		 * +	앞 문자가 1개 이상
		 * ?	앞 문자가 없거나 1개
		 * []	문자의 집합이나 범위([a-z]:a부터 z까지, [^a-z]:a부터 z가 아닌것) # 캐럿은 지금 부정을 의미.
		 * {}	앞 문자의 개수 ({2}:2개, {2,4}:2개이상 4개이하)
		 * ()	그룹화(1개의 문자처럼 인식)
		 * |	OR 연산
		 * \s	공백, 탭, 줄바꿈
		 * \S	공백, 탭, 줄바꿈이 아닌 문자
		 * \w	알파벳이나 숫자
		 * \W	알파벳이나 숫자가 아닌 문자
		 * \d	숫자
		 * \D	숫자가 아닌 문자
		 * (?i)	뒷 문자의 대소문자 구분 안함
		 * \	정규표현식에서 사용되는 특수문자 표현
		 */
		
		String str = "abc123";
//		String regex = "[a-z]{3}[0-9]{1,3}";//a-z 가 3개, 0-9 1개에서 3개
//		String regex = "[a-z0-9]+";			// a-z 0-9 소문자나 숫자가 1개 이상 온다.
		String regex = "\\w*"; 				// 알파벳이나 숫자인데 별표면 0개이상
		Pattern p = Pattern.compile(regex); //정규표현식을 해석해서 패턴으로 만들어줌.
		Matcher m = p.matcher(str);			//만들어진 패턴으로 문자열과 비교
		System.out.println(m.matches());
		
		//아이디, 전화번호, 이메일주소의 유효성을 검사하는 정규표현식을 만들어주세요.
		
		
		String re1 = "[a-z0-9_-]{5,20}";
		String re2 = "^0\\d[1,3}-\\d{3,4}-\\d{4}";
		String re3 = "[a-z0-9_-]{5,20}@[a-zA-Z]+\\.(?i)(com|net|org|([a-z]{2}\\.kr))$";
																	 // co.kr or.kr...
		
		
		
		
		

	}

}
