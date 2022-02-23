package d_array;

import java.util.Arrays;

public class Quiz {

	public static void main(String[] args) {
		
//		int money = (int)(Math.random()*500) * 10;
//		int[] coin = {500, 100, 50, 10 };
//		
//		int temp = 0;
//		int count = 0;
//		System.out.println("거스름돈 : " + money);
//		
//		
//		for(int i=0; i<coin.length; i++){
//			temp = money/coin[i];
//			System.out.println(coin[i]+"원 : " + temp + "개");
//			money = money - temp * coin[i];
//			count += temp;
//		}
//		System.out.println("동전의 총 갯수는 : " + count +"개");

		
		
//		for(int i=0; i<coin.length; i++){
//			int count = money / coin[i];
//			money %= coin[i];
//			System.out.println(coin[0] + "원 : "+ count + "개");
//		}
		
		/*
		 * 거스름돈에 동전의 단위마다 몇개의 동전이 필요한지 출력해주세요.
		 * 나눗셈이 아니라 나머지를 이용.
		 * 
		 * 거스름돈 2860원
		 * 500원 : 5개
		 * 100원 : 3개
		 * 50원 : 1개
		 * 10원 : 1개
		 */
		
		
//		int[] arr = new int[20];
//		for(int i = 0; i <arr.length; i++){
//			arr[i] = (int)(Math.random()* 5) + 1;
//		}
//		System.out.println(Arrays.toString(arr));
		
		
		/*
		 * 1~5사이의 숫자가 발생된 만큼 *을 사용해 그래프를 그려주세요.
		 * 
		 * 1 : *** 1이 3번나오면 별이 3개 
		 * 2 : **** 2가 4번 나오면 별이 4개
		 * 3 : ** 2개
		 * 4 : ***** 5개
		 * 5 : ****** 6개
		*/
		
			
			
		
		
//		int[] counts = new int[5];
//		for(int i = 0; i < arr.length; i++){
//			counts[arr[i] - 1]++;
//		}
//		for(int i = 0; i < counts.length;i++){
//			System.out.print(i + 1 + " : ");
//			for(int j = 0; j <counts[i]; j++){
//				System.out.print("*");
//			}
//			System.out.println(" " + counts[i]);
//		}
		
		/*
		 * 1~5사이의 랜덤한 값이 10개 저장된 배열에서 중복된 값이 제거된 배열을 만들어 주세요.
		 * [3, 5, 3, 2, 1, 3, 2, 1, 4, 1]
		 * [3, 5, 2, 1, 4]
		*/
		
		int[] arr = new int[10];
		for(int i = 0; i < arr.length; i++){
			arr[i] = (int)(Math.random()* 5) + 1;
		}
		System.out.println(Arrays.toString(arr));
//////////////////////////////////////////////////////////////////////////////////////////////////	
		
		int[] n_arr = new int[5];
		int count = 0;
		
		for(int i = 0; i < arr.length; i++){
			boolean flag = true;
			for(int j = 0; j < n_arr.length; j++){
				if(n_arr[j] == arr[i]){
					flag = false;
				}
			}
			if(flag) {
				n_arr[count] = arr[i];
				count++;
			}
				
		}System.out.println(Arrays.toString(n_arr));
		
		
//		int[] temp = new int[5];
//		int count = 0;
//		for(int i = 0; i < arr.length; i++){
//			boolean flag = true;
//			for(int j = 0; j < temp.length; j++){
//				if(arr[i] == temp[j]){
//					flag = false;
//				}
//			}
//			if(flag){
//				temp[count++] = arr[i];
//			}
//		}
//		int[] result = new int[count];
//		for(int i = 0; i < result.length; i++){
//			result[i] = temp[i];
//		}
//		System.out.println(Arrays.toString(result));
		 
		
		
		
		
		
		
	}

}
