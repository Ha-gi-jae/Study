package b_operator;

import java.util.Scanner;

public class SimpleCalculator {

	public static void main(String[] args) {
		//두개의 숫자와 연산자를 입력받아 연산결과를 알려주는 프로그램을 만들어주세요.
		
		int res;
		
		Scanner s = new Scanner(System.in);
		System.out.print("첫번째 숫자 입력> ");
		int a = Integer.parseInt(s.nextLine());
		System.out.print("연산자 입력> ");
		String b = s.nextLine();
		System.out.print("두번째 숫자 입력> ");
		int c = Integer.parseInt(s.nextLine());
		
		/*if (b.equals("+")){
			res = a + c;
			System.out.println("결과값은 : " + res + " 입니다.");
		}
		else if (b.equals("-")){
			res = a - c;
			System.out.println("결과값은 : " + res + " 입니다.");
		}
		else if (b.equals("*")){
			res = a * c;
			System.out.println("결과값은 : " + res + " 입니다.");
		}
		else if (b.equals("/")){
			res = a / c ;
			System.out.println("결과값은 : " + res + " 입니다.");
		}
		else System.out.println("연산자를 잘못 입력하였습니다.");
		*/
		//삼항연산자..
		int result = b.equals("+") ? a + c
					   :b.equals("-") ? a - c
					   :b.equals("*") ? a * c
					   :b.equals("/") ? a / c
					   : a % c;
					   System.out.println(a + " " + b + " " + c + " = " + result);
	
		
	}

}
