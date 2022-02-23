package utill;

import java.util.Scanner;

public class ScanUtil {

    private static Scanner s= new Scanner(System.in);
	
	//자주 사용되는 메서드는 객체생성을 하지 않기 위해 static을 붙이다.
	
	public static String nextLine(){
		return s.nextLine();
	}
	
	public static int nextInt(){
		return Integer.parseInt(s.nextLine());
	
	}
	
}
 