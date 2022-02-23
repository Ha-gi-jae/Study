package d_array;

import java.util.Arrays;

public class MultiDimensionalArray {

	public static void main(String[] args) {
		
//		/*
//		 * 다차원 배열
//		 *  - 배열안에 배열이 저장되어 있는 형태이다.
//		 */
//		
//		//2차원 배열
//		int[][] array2;
//		
//		//3차원 배열
//		int[][][] array3;
//		
//		int[][] arr = new int[2][3]; //3개의 배열을 저장할수 있는게 2개 생기는 것임.
//		/*
//		 * 변수 = 100번지(주소)
//		 * 
//		 * 100번지
//		 * {200번지, 300번지}
//		 * 
//		 * 200번지
//		 * {0, 0, 0}
//		 * 
//		 * 300번지
//		 * {0, 0, 0}
//		*/
//		int arr2[][] = new int[][]{{1, 2, 3}, {4, 5, 6}}; // 직접 넣는 방법. 
//		//길이 지정을 하던지 아니면 값을 넣어주던지 둘중 하나만해야한다.
//		int[] arr3[] = {{1, 2, 3}
//					  , {4, 5, 6}
//					  , {7, 8, 9} };
//		//위 의 방법은 선언과 초기화를 같이해줘야함.
//		
//		//대괄호 갯수가 2개면 된다. 어디에 있든 상관없다 보통은 타입 뒤에 붙힘 int[][] 변수명 = ...
//		
//		int[][] arr4 = new int[3][]; // 가변배열 - 일부만 길이를 정해줌(1차원) 2차원은 아예 만들어 진 상태가 아님. 필요하면 그때그때 만들어서 쓰는 형태.
//		arr4[0] = new int[3]; //2차원이니까 배열로 초기화.
//		arr4[1] = new int[5];
//		arr4[2] = new int[10]; // [[3][5][10]] 
//		
//		System.out.println(arr[0][1]);      // 0번에 1번있는 값을 출력
//		
//		arr[0] = 10; // 값을 저장할 수 없다.
//		arr[0] = new int[5]; //배열을 저장해야 한다.
//		arr[0][0] = 10;
//		arr[0][1] = 20;
//		arr[1][0] = 100;
//		System.out.println(arr[1][0]);
//		
//		System.out.println(arr.length); //1차원 배열의 길이
//		System.out.println(arr[0].length); //1차원까지 인덱스 지정후 length를 써야 2차원 배열의 길이
//		
//		for(int i = 0; i < arr.length; i++){
//			for(int j = 0; j < arr[i].length; j++){
//				System.out.println(arr[i][j]);
//			}
//		}
		
		
		int[][] scores = new int[3][5]; //int[학생수][과목수]
		int[] sum = new int[scores.length]; //합계
		double[] avg = new double[scores.length]; //평균
		
		//int random = (int)(Math.random()*100) +1;
		
		for(int i = 0; i < scores.length; i++){
			for(int j = 0; j < scores[i].length; j++){
				scores[i][j] = (int)(Math.random()* 101);
			}
			System.out.println(Arrays.toString(scores[i]));
		}
		
		for(int i = 0; i < scores.length; i++){
			for(int j = 0; j < scores[i].length; j++){
				sum[i] += scores[i][j]; 
			}
			avg[i] = (double)sum[i] / scores[i].length; 
//			System.out.println("합계 : " + sum[i] + " / 평균 : " + avg[i]);
		}
		System.out.println("합 : " + Arrays.toString(sum));
		System.out.println("평균 : " + Arrays.toString(avg));
		
		
		
		
		
		
		
		
		
		
		
	}

}
