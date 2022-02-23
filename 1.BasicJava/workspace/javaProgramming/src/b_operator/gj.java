package b_operator;

import java.util.Scanner;

public class gj {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		System.out.print("1번째 숫자입력>");
		int a = Integer.parseInt(s.nextLine());
		System.out.print("연산자입력>");
		String b = s.nextLine();
		System.out.print("2번째 숫자입력>");
		int c = Integer.parseInt(s.nextLine());

		int res = b.equals("+") ? a + c
			: b.equals("-") ? a - c
			: b.equals("*") ? a * c
			: b.equals("/") ? a / c
			: a % c;
		System.out.println(a + " " + b + " " + c + " = "+ res + "입니다.");

	}

}
