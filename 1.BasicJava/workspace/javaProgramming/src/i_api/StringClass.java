package i_api;

import java.util.Arrays;

public class StringClass {

	public static void main(String[] args) {
//		API : 어떠한 기능을 위해 누군가가 만들어 놓은 프로그램 
//		라이브러리 : 어떠한 기능을 위해 누군가가 만들어 놓은 프로그램을 사용하는 방법		
		/*
		 * String
		 *  - 여러개의 문자를 사용하기 쉽게 만들어 놓은 클래스
		 *  
		 *  String의 주요 메서드
		 *  - equals() : 문자열의 내용이 같은지 반환한다.
		 *  - length() : 문자열의 길이를 반환한다. (int 타입)
		 *  - charAt() : 특정 인덱스에 위치한 문자를 반환한다. (String이 아닌 char 타입으로 반환)
		 *  - substring() : 문자열의 특정 부분을 잘라서 반환한다.
		 *  - indexOf() : 문자열 내의 특정 문자의 인덱스를 반환한다.
		 *  - contains() : 문자열이 특정 문자열을 포함하고 있는지 여부를 반환한다. (T or F)
		 *  - split() : 문자열을 특정 문자를 기준으로 나누어 배열형태로 반환한다.
		 *  - trim() : 문자열 앞뒤의 공백을 제거해 반환한다.
		 *  - valueOf() : 다른 타입의 데이터를 문자열로 변환해 반환한다.
		*/
		
		
		boolean equals = "문자열".equals("문자열");
		System.out.println(equals);
		
		String str1 = "문자열";
		String str2 = null;
		System.out.println(str1.equals(str2));
//		System.out.println(str2.equals(str1)); equals : 문자열 String 객체에만 존재하기 때문에 null 에서는 호출 불가능.
		
		String str = "12345";
		int length = str.length();
		for(int i = 0; i < length; i++){
			char charAt = str.charAt(i);
			System.out.println(charAt);
		}
		
		//문자열 뒤집기
		String rev = "";
		for(int i = str.length() - 1; 0 <= i; i--){
			rev += str.charAt(i);
		}
		System.out.println(rev);
		
		str = "0123456789";
		String sub1 = str.substring(3);
		System.out.println(sub1);
		String sub2 = str.substring(5, 8); // (시작, 끝)  8번째 전까지짤라서 567만 나옴
		System.out.println(sub2);
		
		str = "수박 오렌지 귤 블루베리";
		System.out.println("뇨뇨");
		int index = str.indexOf(" "); // 공백도 포함. [수0/박1/공백2/오 3]
		System.out.println(index);
		
		//substring과 indexOf를 조합해서 문자열 자르기
		String[] menu = {
			"수박 20000원",
			"오렌지 100000원",
			"귤 500원",
			"블루베리 3000원"   //글자수가 다름 ㅠ 
		};
		
		for(int i = 0; i < menu.length; i++){
			String name = menu[i].substring(0, menu[i].indexOf(" ")); //공백의 인덱스를 찾아서 substring 한테 넘겨줌. 그럼 시작과 끝의 인덱스를 알 수 있다.
			System.out.println(name);
		}
		//숫자만 잘라서 인트타입 변수에 저장
		for(int i = 0; i < menu.length; i++){
			int price = Integer.parseInt(menu[i].substring(menu[i].indexOf(" ") + 1, menu[i].length()-1 ));
			System.out.println(price);
		}
		
		str = "abcd";
		boolean contains = str.contains("c");
		System.out.println(contains);
		
		for(int i = 0; i < menu.length; i++){
			if(menu[i].contains("오렌지")){
				System.out.println("오렌지는" + i + "번 인덱스에 있습니다.");
			}
		}
		
		str = "a/b/c";
		String[] split = str.split("/");
		System.out.println(Arrays.toString(split));
		
		for(int i = 0; i < menu.length; i++){
			String[] s = menu[i].split(" ");
			System.out.println("이름: " + s[0] + " / 가격 : " + s[1]);
		}
		
		str = " 문 자 열  ";
		String trim = str.trim(); //문자 열 사이사이는 제거하지 못함 앞 뒤만 가능.
		System.out.println("[" + str + "] -> [" + trim + "]");
		//입력 실수 방지할때 주로 쓰임. ex) 아이디 비밀번호 설정할때 
		
		String id = " myid";
		String password = "mypassword ";
		System.out.println(id);
		System.out.println(password);
		System.out.println(id.trim());
		System.out.println(password.trim());
		
		int num = 10;
		str = num + ""; // 빈 문자열 넣으면 string 타입으로 형변환.... < 꼼수
		str = String.valueOf(num); //String 타입으로 변환~.... 좋은방법 
		
		String par = "\t";
		System.out.println(par.length());
		System.out.println(par);
		
		
	}

}
