package study;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeSet;

public class Lotto {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		
		boolean flag = true;
		while(flag) {
			System.out.println("==========================");
			System.out.println("Lotto 프로그램");
			System.out.println("--------------------------");
			System.out.println(" 1. Lotto 구입");
			System.out.println(" 2. 프로그램 종료");
			System.out.println("==========================");
			System.out.print("메뉴선택 : ");
			int input = Integer.parseInt(s.nextLine()); 
			
			switch (input) {
			case 1:
				buylotto();
				break;
			case 2:
				System.out.println("\n감사합니다.");
				flag = false;
				break;
			}
		}
	}
	
	
	
	
	
	
	
	
	private static void buylotto() {
		int cnt = 0;
		Scanner s = new Scanner(System.in);

		System.out.println("\n Lotto 구입 시작\n");

		System.out.println("(1000원에 로또번호 하나입니다.)");
		System.out.print("금액 입력 : ");
		int input = Integer.parseInt(s.nextLine());
		// 로또 주는 장수
		int line = input / 1000;
		// 거스름돈
		int tip = input % 1000;
		System.out.println("\n행운의 로또번호는 아래와 같습니다.");
		while (cnt != line) {
			Set<Integer> lottonum = new TreeSet<>();
			while (lottonum.size() < 6) {
				int num = (int) (Math.random() * 45) + 1;
				lottonum.add(num);
			}
			List<Integer> rndlottonumList = new ArrayList<Integer>(lottonum);
			cnt++;
			System.out.print("로또 번호" + cnt + " : ");
			for (int i = 0; i < rndlottonumList.size(); i++) {
				System.out.print(rndlottonumList.get(i));
				if (i < rndlottonumList.size() - 1) {
					System.out.print(", ");
				}
			}

			System.out.println();

		}

		System.out.println("\n받은 금액은 " + input + "원이고 거스름돈은 " + tip + "원입니다.\n");

	}
}