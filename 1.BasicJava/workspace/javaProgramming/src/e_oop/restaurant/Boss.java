package e_oop.restaurant;

import java.util.Arrays;

public class Boss {

	public static void main(String[] args) {
		Alba alba = new Alba();
		
		String[] order = alba.order(); //리턴값이 배열이므로 String[](음식) 이 들어감.
		System.out.println(Arrays.toString(order));
		
		System.out.println("요리를 만드는 중..... 완성!!");
		String[] foods = {"완성된 짜장면", "완성된 탕수육"};
		
		alba.serving(foods);
		
		alba.pay(order);
		
		
		
		
		
	}

}
