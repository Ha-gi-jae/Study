package b_operator;

import java.util.Scanner;

public class Etc {

	public static void main(String[] args) {
		/*
		 * 비트 연산자
		 * - |, &, ^, ~, <<, >>
		 * - 비트 단위로 연산한다.
		 * 
		 * 기타 연산자
		 * - .(참조연산자) : 특정 범위 내에 속해 있는 멤버를 지칭할 때 사용한다. 
		 * ex) math.round math라는 클래스에있는 round 메서드를 지칭
		 * - ?:(삼항연산자) : 조건식 ? 조건식이 참일 경우 수행할 문장 : 조건식이 거짓일 경우 수행할 문장
		 * 조건식이 true가 나오면 두번째 실행 false일때는 세번째 문장 실행.
		 */
		
		//비트 = 컴퓨터가 표현 할 수 있는 가장 작은 단위
		//1Byte : 01010101      0 혹은 1이 8개로 이루어짐 즉 8개의 비트로 나누어져 있다.
		//위의 숫자 하나하나가 비트임.
		System.out.println(10 | 15); // | : 둘다 0 인 경우 0 그외 1
		//0001010    8 + 2 = 10
		//0001111    8 + 4 + 2 + 1 = 15
		//0001111    8 + 4 + 2 + 1 = 15   둘다 0 이면 0 이고 그 외에는 1로 표시 왜냐 |는 or(또는) 이니까 1나만 만족해도 된다.
		System.out.println(11 & 15); // & 는 and(그리고) 니까 둘다 만족해야함.
		System.out.println("====");
		///0001011
		///0001111
		///0001011 11
		
		//비트는 2진수임.
		//10 : 00001010
		//15 : 00001111
		//     00001111 < 결과.
		// 왜 00001111이냐면?  같은자리 연산을 비교했을때 둘다 0일 때만 0이고 아닌 경우엔 다 1로 처리함.
		
		//비트단위는 거의 안씀. 이쪽이 필요하다면 공부해야함. 이런게 있다는 정도만 알고가면 좋을듯.
		
		
		int x = 10;
		int y = 20;
		int result = x < y ? x : y;
		System.out.println(result);
		// 조건식의 결과가 true면 x false면 y 를 실행!
		// 지금은 true니까 x 값이 result에 저장이된다.
		int xy = 15;
		int yz = 10;
		int res = xy < yz ? xy : yz ;
		System.out.println("=="+res);
		//거짓이니까 yz 를 출력.
		
		//주민등록번호 뒷자리의 첫번째 숫자가 1이면 남자 2면 여자
		int regNo = 2;
		String gender = regNo == 1 ? "남자" : "여자";
		System.out.println("당신의 성별은 " + gender + " 입니다.");
		//문제가 있음. 왜냐 1만 남자임. 1제외한 숫자는 여자임.
		// 그럼 1인지 2인지 확인하려면? 삼항연산자를 2번쓰면 된다.
		regNo = 3;
		System.out.println("===");
		gender = regNo == 1 ? "남자" : regNo == 2 ? "여자" : "확인불가";
		System.out.println("당신의 성별은 " + gender + " 입니다.");
		// 1이면 남자에서 끝남. 근데 2면 오른쪽으로 넘어가서 변수 값이 2인지 확인해서 맞으면 여자. 2가 아니면 확인불가.
		//1, 2 가 아니라 3이면 확인불가로 나옴.
		
		//2개의 숫자를 입력받고, 둘 중 더 큰 숫자를 출력해주세요.
		
	/*	Scanner s = new Scanner(System.in);
		System.out.print("첫번째 숫자를 입력하세요>");
		int num = Integer.parseInt(s.nextLine()); 
		System.out.print("두번째 숫자를 입력하세요>");
		int num2 = Integer.parseInt(s.nextLine());
		int res = num > num2 ? num : num2;
		System.out.println(res);
		*/
		
		// Scanner s = new Scanner(System.in);
		// System.out.print("첫번째 숫자>");
		// int num1 = Integer.ParseInt(s.nextLine());
		// System.out.print("두번째 숫자>");
		// int num2 = Integer.ParseInt(s.nextLine());
		// System.out.println(num1 < num2 ? num2 : num1);
		
		//#다시 해보기.
		//숫자를 입력받고, 그 숫자가 1이나 3이면 남자를 2나 4면 여자를 출력해주세요.
		//그 외의 숫자를 입력하면 확인불가를 출력해주세요.
		
		Scanner s = new Scanner(System.in);
		
		
		// System.out.println("숫자입력>");
		 int num = Integer.parseInt(s.nextLine());
		 gender = num == 1 || num == 3 ? "남자" : (num == 2 || num == 4 ? "여자" : "확인불가");
		// System.out.println("당신의 성별은" + gender + " 입니다.");
		
		
		
	}

}
