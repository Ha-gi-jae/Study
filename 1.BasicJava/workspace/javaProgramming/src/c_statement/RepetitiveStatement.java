package c_statement;

import java.util.Scanner;

public class RepetitiveStatement {

	public static void main(String[] args) {
		/*
		 * 반복문
		 * - for문
		 * - while문
		 * - do-while문
		 * 
		 * for문
		 * - for(초기화: 조건식; 증강식){}
		 * - 포함하고 있는 문장들을 정해진 횟수만큼 반복하는 문장 
		*/
		
//		for(int i = 1; i <= 10; i++){
			//초기화: 조건식과 증감식에 사용할 변수 초기화
			//조건식: 연산결과가 true이면 블럭안의 내용을 수행
			//증감식: 변수를 증가/감소시켜 반복문을 제어
//			System.out.println(i + "번째 반복");
//		}
		
	/*	int sum = 0; //1부터 10까지 합계를 저장
		
		sum += 1;
		sum += 2;
		sum += 3;
		sum += 4;
		sum += 5;
		sum += 6;
		sum += 7;
		sum += 8;
		sum += 9;
		sum += 10;
		System.out.println(sum);
		
		sum = 0;
		for(int i = 1; i <= 100; i++){
			sum += i;
		}
		System.out.println(sum);
		
		sum = 0;
		for(int i = 100; i >= 1; i--){
			sum += i;
		}
		System.out.println(sum);
		
		
		//1부터 100까지 짝수의 합을 출력해주세요.
		
		sum = 0;
		for(int i = 1; 1 <= 100; i++){
			if(i % 2 == 0) {
				sum += i;
			}	
		}
		
		System.out.println(sum);
		
		// i를 2씩 늘려도 된다.
		 sum = 0;
		for(int i1 =2; i1 <=100; i1 +=2){
			sum += i1;
				}
		System.out.println(sum);
		
		//1부터 100까지 홀수의 합을 출력해주세요.
		
		sum = 0;
		for(int i1 = 1; i1 <= 100; i1 +=2){
			sum += i1;
		}
		System.out.println(sum);
		
		 sum = 0;
			for(int i2 = 1; i2 <= 100; i++){
				if(i2 % 2 == 1){
					sum += i;
				}
			}
		System.out.println(sum);
			*/
		
		
		//구구단 출력
		/*
		 * 2 * 1 = 2
		 * 2 * 2 = 4
		 * 2 * 3 = 6
		 * 2 * 4 = 8
		*/
		
		/*for(int i = 1; i <= 9; i++){
			System.out.println(2 + " * " + i + " = " + i * 2);
		}*/
		
		
		
		
		
		
	
		
		
		/*for(int a = 2; a <= 9; a++){
			for(int b = 1; b <= 9; b++){
				System.out.println(a + " * " + b + " = " + b * a);
			}
			System.out.println("");
		}*/
		
		//좌측을 a  a는 오른쪽으로 갈때마다 1씩 커져야함. 그래서 a가  a = 3
		
		
		 
		
		/*for(int a = 2; a <= 9; a++){
		for(int b = 1; b <= 9; b++){
			System.out.print("" + a + " * " + b + " = " + b * a);
		}
		System.out.println("");
	}*/
		
	/*	// 위와 비교했을때 a와 b의 for문 위치가 바뀜
	for(int b = 1; b <= 9; b++){
			System.out.println();
		for(int a = 2; a <= 9; a++){
			 System.out.print("  "+ a + " * " + b + " = " + a * b );
		}
		
	}*/
		

	//모범답안.
	/*for(int i = 1; i <= 9; i++){
	   for(int j = 2; j <= 9; j++){
		   System.out.print(j + " * " + i + " = " + i * j + "\t");
	}
	
	   System.out.println();
	}*/
		
		/*
	 	* while문
	 	* - while(조건식){}
	 	* - 포함하고 있는 문장들을 조건식이 만족하는 동안 반복하는 문장
	 	* - 반복횟수가 정확하지 않은 경우에 주로 사용한다.
	 	*/
	
		/*int a = 1; // for문 초기화
		//a에 2씩 곱해서 1000이상이 되려면 몇번을 곱해야 하는가?
		int count = 0;
		while(a < 1000){ //for문 조건식
			a *= 2 ; // for문 증감식 for문으로 가능한 경우있음.
			count++;
			System.out.println(count + " : " + a);*/
		
		
		/*
		 * do-while문
		 * - do{}while(조건식);
		 * - 최소한 한번의 수행을 보장한다.
		 * 무엇인가를 했을 때, 다시 해야하는지 안하는지 구분해야할때 사용		
		 */
		
		//숫자 맞추기 게임
//		int answer = (int)(Math.random()*100) + 1;
//		int input = 0;
//		Scanner s = new Scanner(System.in);
//		do{
//			System.out.println("1~100 사이의 수를 입력해주세요>");
//			input = Integer.parseInt(s.nextLine());
//			
//			if(answer < input){
//				System.out.println(input + " 보다 작습니다.");
//			}else if(input < answer){
//				System.out.println(input + "보다 큽니다.");
//			}else{
//				System.out.println("정답입니다!!");
//			}	
//		}while(input != answer);
		
		//이름붙은 반복문  .. outer(이름 뭘하든상관없음.) = 반복문을 구분하기 위한 구분자.
		outer : for(int i = 2; i <= 9; i++){
			System.out.println(i);
			for(int j = 1; j<=9; j++){
				System.out.println(j);
				if(j==3){
//	break;//가장 가까운 반복문 하나를 빠져나간다. => for문. 이걸로 아우터 옆 for문을 빠져나오진못함. 5일때 빠져나옴. 그래서 5 실행안함.
//break outer; //outer라는 이름의 반복문을 빠져나간다. 언급한 이름의 것을 나감. 마찬가지로 j가 5일때 빠져나감. 
//continue; //가장 가까운 반복문의 현재 반복회차를 빠져나간다. 조건의 값을 건너띄고함.
continue outer; //outer라는 이름의 현재 반복회차를 빠져나간다. 
//continue에서 바로 증감식으로 바로 넘어감.
				}
				System.out.println(i + " * " + j + " = " + i * j);
			}
			System.out.println("^"); //continue outer때문에 여기까지안오고 증감식다녀온후 내려옴. 결국엔 실행 절대 안된다.
		}
		
		
		/*System.out.println("*****");
		System.out.println("*****");
		System.out.println("*****");*/
		
		//for문 2개를 사용해서 위 의 별 출력
	/*	for(int i = 1; i <=3; i++){
			for(int j = 1; j<= 5; i++){
				System.out.print("*");
			}
			System.out.println();
		}*/
		// 밖의 i는 5줄을 실행할거임.
	
//		for(int i = 1; i <= 5; i++){
//			for(int j = 1; j <= i; j++){
//				System.out.print("*");
//				}
//			System.out.println();
//		}
//		
//		
//		for(int i = 5; i >= 1; i--){
//			for(int j = 1; j<=i;j++){
//				System.out.print("*");
//			}
//			System.out.println();
//			for(int k = 5; k >= i;k--){
//				System.out.print(" ");
//			}
//		}
//		
	}
}