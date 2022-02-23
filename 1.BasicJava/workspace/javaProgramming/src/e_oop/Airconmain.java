package e_oop;

import java.util.Scanner;

public class Airconmain {

	public static void main(String[] args) {
		Aircon aircon = new Aircon();
		Scanner sc = new Scanner(System.in);
		System.out.println("에어컨을 켜시겠습니까? (Y/N)");
		String a = sc.nextLine();
		if (a.equals("Y")){ aircon.power = true;}
		else if(a.equals("N")){ aircon.power = false; }
		
		//에어컨 전원
		aircon.power();
		
		//에어컨 온도 조절
		boolean flag = true;
		if (a.equals("Y")) {
			System.out.println("현재 에어컨의 온도는 " + aircon.tem + "도 입니다.");
			System.out.println("온도를 조절 하시겠습니까? (Y/N)");
			String b = sc.nextLine();

			if (b.equals("Y")) {
				System.out.println("온도 ↑ UP 입력");
				System.out.println("온도 ↓ DOWN 입력");
				String c = sc.nextLine();
				aircon.tem(c);
				System.out.println(aircon.tem + "도에 만족 하시면 Y를 아니면 N을 눌러주세요.");
				String d = sc.nextLine();

				if (d.equals("N")) {
					do {
						System.out.println("온도 ↑ UP 입력");
						System.out.println("온도 ↓ DOWN 입력");
						String e = sc.nextLine();
						aircon.tem(e);
						System.out.println(aircon.tem
								+ "도에 만족 하시면 Y를 아니면 N을 눌러주세요.");
						String f = sc.nextLine();
						if (f.equals("Y")) {
							flag = false;
						}
					} while (flag);
				}
			}
			

			System.out.println("에어컨을 끄시겠습니까? Y/N");
			String g = sc.nextLine();
			if (g.equals("Y")) {
				aircon.power = false;
			}
			aircon.power();
		}
	}
}