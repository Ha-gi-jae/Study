package b_operator;

public class ComparingOperator {

	public static void main(String[] args) {
		/*
		 *비교연산자
		 *- <, >, <=, >=, ==, != 부등호가 반드시 앞에와야함. ! 부정의 의미.
		 *- 문자열 비교 : equals()
		 */
		
		int x = 10;
		int y = 20;
		boolean b = x < y; //비교연산자의 연산결과는 boolean이다.
		System.out.println(b);
		b = x <= y - 15;
		System.out.println(b);
		//연산식 안에 비교와 산술이 있음.
		//산술 먼저 한 후, 비교를 함.
		// y - 15를 한 후 그 결과 값이 x 와 값을 비교하게 된다.
		System.out.println("====");
		String str1 = "abc";
		String str2 = "ABC";
		String str3 = "ABC";
		b = str1 == str2; //문자열의 내용이 아닌 주소를 비교한 것이다.
		System.out.println(b);
		
		boolean c;
		c = str2 == str3;
		System.out.println(c);
		//String 클래스를 쓰면 참조형이므로 내용이 아닌 해당 내용의 주소를 저장하는것.
		//즉 현재 주소를 비교하는 것임.
		//자바는 문자열이 같으면 주소가 똑같다. 원래 서로 각각 다른 곳에 저장되서 주소가 달라야하는데 자바에서 편리하게? 메모리아낄겸 주소를 같게함.
		
		//주소가아닌 문자열을 비교하려면?
		//String의 내용을 비교하기 위해서는 equals()메서드를 사용한다.
		b = str1.equals(str2);
		System.out.println(b);
		//equals는 string 클래스에 있는 하나의 메서드.
		//
		//String str1 = "abc";
		//String str2 = "abc"; //
		//String str2 = new String("abc"); //로 하면 abc가 다른 주소로 저장이 됨.
		
		
		//★ 다시 해보기!!
		//다음의 문장을 코드로 작성해주세요.
		//x는 y보다 작거나 같다.
		// 
		//x + 5와 y는 같다.
		//
		//y는 홀수이다.
		// 
		//"기본형"과 "참조형"은 다르다.
		//
		// b = x <= y;
		// b = x+5 == y;
		// b = y % 2 == 1; 나머지가 2로나눴을때 나머지 1 이여야 홀수이기 때문에.
		 b = !"기본형".equals("참조형");
		System.out.println("===" + b);
		// b = x <= y;
		// b = x + 5 == y; 
		// b = y % 2 == 1;
//		 b = !"기본형",equals("참조형");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
