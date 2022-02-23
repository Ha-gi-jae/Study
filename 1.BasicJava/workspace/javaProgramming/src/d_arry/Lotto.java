package d_arry;

import java.util.Arrays;
import java.util.Scanner;

public class Lotto {

	public static void main(String[] args) {
			
		int[] number = new int[6];
		int[] temp = new int[6];
		Scanner sc = new Scanner(System.in);
		int[] scnum = new int[6];
		int[] scnumtemp = new int[6];
		int rank = 0;


		// 로또번호 뽑은 후, 수 정렬
		for (int i = 0; i < number.length; i++) {
			number[i] = (int) (Math.random() * 45) + 1;
			for (int j = 0; j < i; j++) {
				if (number[i] == number[j]) {
					i--;
					break;
				}
				else if (number[i] < number[j]) {
					temp[j] = number[j];
					number[j] = number[i];
					number[i] = temp[j];
				}
			}
		}	
		
		//
		
//		
		//자동 수동 선택
		System.out.println("자동구매는 r을 수동구매는 c를 입력해주세요.");
		String choice = (sc.nextLine());
		switch(choice){
			case "r":
//		
		//자동
		System.out.println("구매할 로또의 수를 입력해주세요.");
		int paper = Integer.parseInt(sc.nextLine());
		int[][] randomnumber = new int[paper][6];
		
		for (int i = 0; i < randomnumber.length; i++) {
			for (int j = 0; j < randomnumber[i].length; j++) {
				randomnumber[i][j] = (int) (Math.random() * 45) + 1;
			}
			for (int k = 0; k < randomnumber[i].length; k++) {
				for (int l = 0; l < k; l++) {
					if (randomnumber[i][k] == randomnumber[i][l]) {
						i--;
						break;
					}
				}
			}
		}
		for(int i = 0; i < randomnumber.length; i++){
		System.out.println(Arrays.toString(randomnumber[i]));
		}
		
		break;// 스위치케이스 break;
//
		//수동
			case "c":
		System.out.println("1부터 45까지 숫자입력>");
		
		for (int i = 0; i < number.length; i++) {
			boolean flag = false;

			
			// 입력받을 값
			scnum[i] = Integer.parseInt(sc.nextLine());
				

			// 숫자입력 1보다 작을시 재입력
			if (scnum[i] < 1)
				flag = true;
			if (flag) {
				System.out.println("1보다 작은 숫자를 입력하셨습니다. 다시 입력해주세요.");
				i--;
				continue;
			}


			// 숫자입력 45보다 클시 재입력
			if (45 < scnum[i])
				flag = true;
			if (flag) {
				System.out.println("45보다 큰 숫자를 입력하셨습니다. 다시 입력해주세요.");
				i--;
				continue;
			}

					

			// 숫자 중복 거르기.
			for (int j = 0; j < i; j++) {
				if (scnum[i] == scnum[j]) {
					i--;
					System.out.println("중복된 숫자를 입력하셨습니다. 다시 입력해주세요.");
					break;
				}
			}
			// 입력 숫자 정렬
			for (int j = 0; j < i; j++) {
				if (scnum[i] < scnum[j]) {
					scnumtemp[j] = scnum[j];
					scnum[j] = scnum[i];
					scnum[i] = scnumtemp[j];
				}
			}
			System.out.println(Arrays.toString(scnum));
		}
		System.out.println("입력번호\n" + Arrays.toString(scnum));
		break; // 수동 브레이크
		}//스위치 케이스 닫는거
		
		// 추첨번호 출력
		System.out.println("추첨번호\n" + Arrays.toString(number));

		
		// 정답 로또번호와 입력된 로또번호 비교
		for (int i = 0; i < number.length; i++) {
			if (number[i] == scnum[i])
				rank++;
		}

		
		// 당첨 여부

		switch (rank) {
		case 3:
			System.out.println("5등 입니다.");
			break;

		case 4:
			System.out.println("4등 입니다.");
			break;
			
		case 5:
			System.out.println("3등 입니다.");
			break;

		case 6:
			System.out.println("1등 입니다.");
			break;

		default:
			System.out.println("꽝 입니다.\t");
		}

			

		// 2등.. 추가해 말아..
		
			
			
			
			
			
			
	}
}
