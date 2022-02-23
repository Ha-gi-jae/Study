package c_statement;

import java.util.Scanner;

public class SelfTest {

	public static void main(String[] args) {
		// '탄수화물 중독' 자가진단테스트를 할 수있는 프로그램을 만들어주세요.
		Scanner s = new Scanner(System.in);
		
		System.out.println("   \'탄수화물 중독\' 자가진단하기");
		System.out.println(" (자료: 식품의약품안전청)");
		System.out.println("①아침을 배불리 먹은 후 점심시간 전에 배가 고프다.");
		System.out.println("②밥, 빵, 과자 등의 음식을 먹기 시작하면 끝이 없다.");
		System.out.println("③음식을 금방 먹은 후에도 만족스럽지 못하고 더 먹는다.");
		System.out.println("④정말 배가 고프지 않더라도 먹을 때가 있다.");
		System.out.println("⑤저녁을 먹고 간식을 먹지 않으면 잠이 오지 않는다.");
		System.out.println("⑥스트레스를 받으면 자꾸 먹고 싶어진다.");
		System.out.println("⑦책상이나 식탁 위에 항상 과자, 초콜릿 등이 놓여있다.");
		System.out.println("⑧오후 5시가 되면 피곤함과 배고픔을 느끼고");
		System.out.println("  일이 손에 안 잡힌다.");
		System.out.println("⑨과자, 초콜릿 등의 단 음식은 상상만 해도 먹고 싶어진다.");
		System.out.println("⑩다이어트를 위해 식이 조절을 하는데 3일도 못 간다.");
		System.out.println("\n\n---------------------------------------------\n");
		System.out.print("위 내용을 읽고 해당되는 갯수의 수를 적어주세요.>");
		int a = Integer.parseInt(s.nextLine());
		switch(a){
			case 0: case 1: case 2:
				break;
			case 3:
				System.out.println("3개:주의! 위험한 수준은 아니지만 관리가 필요함.");
				break;
			case 4: case 5: case 6:
				System.out.println("4~6개:위험! 탄수화물 섭취를 줄이기 위한 식습관 개선이 필요함.");
				break;
			case 7: case 8: case 9: case 10:
				System.out.println("7개이상:중독! 전문의 상담이 필요함.");
				break;
			default:
				System.out.println("0~10의 숫자를 입력해주세요.");
		}
	}

}
