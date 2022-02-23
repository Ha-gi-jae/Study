package d_array;

import java.util.Arrays;

public class Sort {

	public static void main(String[] args) {
		/*
		 *  - 석차구하기 : 점수를 비교해 작은 점수의 등수를 증가시키는방식
		 *  - 선택정렬 : 가장 작은 숫자를 찾아서 앞으로 보내는 방식
		 *  - 버블정렬 : 바로 뒤의 숫자와 비교해서 큰 수를 뒤로 보내는 방식
		 *  - 삽입정렬 : 두번째 숫자부터 앞의 숫자들과 비교해서 큰수는 뒤로 밀고 중간에 삽입하는 방식
		 */
		
		int[] arr = new int[10];
		for(int i = 0; i < arr.length; i++){
			arr[i] = (int)(Math.random()*100) + 1;
		}
		System.out.println(Arrays.toString(arr));
		
		//석차구하기
//		int[] rank = new int[arr.length]; //석차 저장할 배열을 만든다.
//		for(int i = 0; i < rank.length; i++){
//			rank[i] = 1;
//		}
//		
//		//모든 사람과 비교
//		for(int i = 0; i < arr.length; i++){ //i 기준
//			for(int j=0; j<arr.length; j++){ //j 비교대상
//				if(arr[i] < arr[j]){
//					rank[i]++;
//				}
//			}
//		}
//		System.out.println(Arrays.toString(rank));
	
//		int[] temp = new int[arr.length];
//			
//		
//		for(int i = 0; i < arr.length; i++){
//			for(int j = 0; j < arr.length; j++){
//				
//				if(arr[i] < arr[j]){
//					temp[j] = arr[i];
//					arr[i] = arr[j];
//					arr[j] = temp[j];
//				}
//				
//			}
//		}
//		System.out.println(Arrays.toString(arr));
		
		
		//최솟값 저장할 위치랑
		//첫번째 위치 저장할거 배열 
		
//		선택정렬
//		for(int i = 0; i < arr.length - 1; i++){
//			int min = i; // 최소값의 위치를 알고 싶기때문에 i를 저장
//			for(int j = i + 1; j <arr.length; j++){
//				if(arr[j] < arr[min]){
//					min = j;
//				}
//			}
//			int temp = arr[i];
//			arr[i] = arr[min];
//			arr[min] = temp;
//			
//		}
		
		
		
//		for (int i = 0; i < arr.length - 1; i++) {
//			int temp = 0;
//
//			for (int j = i + 1; j < arr.length; j++) {
//				if (arr[i] < arr[j]) {
//					continue;
//				} else {
//					temp = arr[i];
//					arr[i] = arr[j];
//					arr[j] = temp;
//
//				}
//			}
//		}
		
		
//		버블정렬 : 바로 뒤의 숫자와 비교해서 큰 수를 뒤로 보내는 방식
//		for(int i = 0; i < arr.length - 1; i++){
//			boolean flag = true;
//			for(int j = 0; j < arr.length - i - 1; j++){
//				if(arr[j]>arr[j+1]){
//					int temp = arr[j];
//					arr[j] = arr[j+1];
//					arr[j+1] = temp;
//					flag = false;
//				}
//			}
//			if(flag)
//				break;
//		}
	

		
		
		
//		for(int i = 1; i < arr.length; i++){
//			int temp = 0;
//			
//			for(int j = i - 1; j >= 0 ;j--){
//				if(arr[j] < arr[i]){
//				}
//				else{ temp = arr[i];
//					  arr[i] = arr[j];
//					  arr[j] = temp;
//				}
//				if(arr[j - 1] <arr[j]){
//				}
//				System.out.println(Arrays.toString(arr));
//			}
//		}
//		System.out.println(Arrays.toString(arr));
		
		
		
		
		
		
		
		
//		 삽입정렬 : 두번째 숫자부터 앞의 숫자들과 비교해서 큰수는 뒤로 밀고 중간에 삽입하는 방식
		for(int i = 1; i < arr.length; i++){
			int temp = arr[i];
			int j = 0;
			for(j = i - 1; j >= 0; j--){
				if(temp < arr[j]){
					arr[j + 1] = arr[j];
				}else{
					break;
				}
			}
			arr[j+1] = temp; //빈칸 [j+1] j = -1 에서 끝남.
			System.out.println(Arrays.toString(arr));
		}
		System.out.println(Arrays.toString(arr));
		
		
		
		
		//quick 정렬 ㅜㅜ...
				

		
	}

}
