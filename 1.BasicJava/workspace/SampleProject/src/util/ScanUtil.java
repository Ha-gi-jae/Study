package util;

import java.util.Scanner;

public class ScanUtil {
	
	private static Scanner s = new Scanner(System.in);
	
	
	
	//Scanner s = new Scanner(System.in);
	// 위는 객체 생성을 해야만 쓸 수 있음.
	// 메모리가 없음.
	//자주 사용되는 메서드는 객체생성을 하지 않기 위해 static을 붙인다.
	
	public static String nextLine(){
		return s.nextLine();
	}
	// 객체 생성 안해도 쓸 수 있음. 아직 메모리에 객체가 없다.
	
	public static int nextInt(){
		return Integer.parseInt(s.nextLine());
	}
	
	public static double nextDouble(){
		return Double.parseDouble(s.nextLine());
	}
	
	
	
}
