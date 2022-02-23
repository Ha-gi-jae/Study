package d_array;

import java.util.Arrays;

public class Array {

	public static void main(String[] args) {
		/*
		 * 배열
		 * - 여러개의 값을 하나의 변수에 저장해서 사용하는 것이다.
		 * - 참조형 타입이다.
		 * - 인덱스로 값을 구분한다.
		 * - 길이를 변경 할 수 없다.
		 */
		int[] array; //int타입의 배열을 저장하겠다. 배열의 주소를 저장할 공간이 만들어진다.
		array = new int[5]; //배열이 생성되고 그 주소가 저장된다. // int타입 5개를 저장하겠다. 가장 많이 사용된다.
		//배열 초기화시 기본값이 저장된다. boolean false 참조형 null
		
		/*
		 * 변수 = 100번지(주소)
		 * 
		 * 100번지 찾아감.
		 * {0, 0, 0, 0, 0}
		 * 첫번째 0 부터 100번지 101번지 102번지 103번지 104번지
		 * 이렇게 연속해서 저장된다.
		*/
		
		array = new int[]{1, 2, 3, 4, 5}; // 저장할 만큼 작성
		// 5개를 적었으니 배열 값은 5
		
		//array = {1, 2, 3, 4, 5}; // new int[]가 생략된 것.
		//변수의 선언과 초기화를 같이해주어야 사용가능
		//				:
		int[] array2 = {1, 2, 3, 4, 5};
		
		System.out.println(array[0]);
		//1 출력 위에서 1을 저장했으므로.
		System.out.println(array[1]);
		System.out.println(array[2]);
		System.out.println(array[3]);
		System.out.println(array[4]);
		
		array[0] = 10;
		array[1] = 20;
		array[2] = 30;
		array[3] = 40;
		array[4] = 50;
		//배열은 주로 반복문과 같이 사용된다.
		
		// 0부터시작해서 4까지 돌게해야함. 5라는 숫자는 배열의 길이
		// array.length  배열의 길이를 나타내는 값
		for(int i = 0; i < array.length; i++){
			System.out.println(array[i]);
		}
		// for문으로 각 배열 프린트 한거.
		
		for(int i = 0; i < array.length; i++){
			array[i] = (i+ 1) * 10;
			System.out.println(array[i]);
		}
		System.out.println("\n");
		//10개의 정수를 저장할 수 있는 배열을 선언 및 초기화 해주세요.
		int[] array3 = new int[10];
		
		//배열의 모든 인덱스에 1~100사이의 랜덤한 값을 저장해주세요.
		for(int i = 0; i < 10; i++){
			array3[i] = (int)(Math.random() * 100) + 1;
			System.out.println(array3[i]);
		} 
		
		System.out.println(Arrays.toString(array3));
		
		//배열에 저장된 모든 값의 합계와 평균을 출력해주세요.
		int sum = 0;
		double avg = 0;
		
		for(int i = 0; i < array3.length; i++){
			array3[i] = (int)(Math.random() * 100) + 1;
			sum += array3[i];
		}
		avg = (double)sum / array3.length;
		System.out.println("합: " + sum + "평균: " + avg);
		
	
		
		//배열에 저장된 값들 중 최소값과 최대값을 출력해주세요.
		int[] array4 = new int[10];
		int min = array4[0];
		int max = array4[0];
		
		for(int i = 0; i < array4.length; i++){
			array4[i] = (int)(Math.random()* 100) + 1; // 10개 만듬
			
			if(max < array4[i]){
				max = array4[i];
			}
			if(array4[i] < min){	
				min = array4[i];
			}
		}
		
		
		System.out.println("최소값 :" + min + "최대값 : " + max);
		//정리하고 풀기★★★★
		//부등호 < 로 우선시 하기. 헷갈리지 않게.
		//배열 넘어가면서 조건이 작으면 min으로 저장 크면 max로 저장.
		System.out.println("\n");
		System.out.println("\n");
		
		int[] shuffle = new int[10];
		for(int i = 0; i < shuffle.length; i++){
			shuffle[i] = i + 1;
		}
		System.out.println(Arrays.toString(shuffle));
		
		//0부터 9사이에 랜덤한 값을 발생. 하나를 인덱스 만들어.  걸린얘랑 가장 처음에 있는얘랑 자리를 바꿔.
		// 또 랜덤발생시켜서 하나 찍어서 첫번째있는얘랑 바꿔.
		//0 1 2 3 4 5 6 7 8 9 순서대로 바꾸기
		//
		
		//배열의 값을 섞어주세요.
		
		/*int random = (int)(Math.random()*9) + 1;
		int[] shake = new int[10]; // 10개 인덱스가 생겼어.
		for(int i = 0; i < shake.length; i++){
			int temp = shake[i];
			shake[i] = random;
			shake[shake.length] = temp;
		}
		System.out.println(Arrays.toString(shake));*/
		//
		for(int i = 0; i < shuffle.length * 10; i++){ // 10은 많이 섞으려고 곱한거임.
		int random = (int)(Math.random()* shuffle.length);
		int temp = shuffle[0];
		shuffle[0] = shuffle[random];
		shuffle[random] = temp;
		}
		System.out.println(Arrays.toString(shuffle));
		
		System.out.println("\n");
		//1~10사이의 랜덤값을 500번 생성하고, 각 숫자가 생성된 횟수를 출력해주세요.
		// 1이 몇번 발생했는지 2가 몇번 발생했는지 각 숫자별 몇번이 발생했는지 횟수를 세면 된다.
		int count = 0;
		int[] co = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		int[] ar = new int[500];
				for(int i = 0; i < ar.length; i++){
				ar[i] = (int)(Math.random() * 10 ) + 1;
				if(ar[i] == co[0]){
					count++;}
				}System.out.println("1" + count);
				if(ar[i] == co[1]){
					count++;
				}
		
				//랜덤값 500개 발생했고 그걸 이제 세야함.
				
				
		//		
		
		//배열된 값 
		//co라는 배열에 지금 1 부터 10까지 순서대로있고 
		//ar라는 배열에는 지금 1~10까지가 500번 무작위로 있어
	

	
		//위 문제의 최소값, 최대값, 반복횟수를 입력받아 각 숫자가 생성된 횟수를 출력해주세요.
        // 발생시킬 범위   
		// 몇번 발생 시킬지  1000번 할지 입력 받아라 
		int[] counts = new int[10];
		for(int i = 0; i < 500; i++){
			int random = (int)(Math.random() * 10) +1;
			counts[random - 1]++;
		}
		System.out.println(Arrays.toString(counts));
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
