package d_array;

import java.util.Arrays;

public class pr {

	public static void main(String[] args) {
		int[] count = new int[10]; //배열 만듦 10개. 
		
		for(int i = 0; i < 500; i++){
		int random = (int)(Math.random()* 10) + 1;
		count[random - 1]++;
		}
		
		/*(random == 1) count[0] = count[0] + 1;
		 *(random == 2) count[1] = count[1] + 1; // 랜덤에서 1 뺀게 카운터 배열 순서니까
		 *  //겹칠때마다 커져야하니까   ++;
		 *count[random - 1]++;
		*/
		
		
		
		
	}

}