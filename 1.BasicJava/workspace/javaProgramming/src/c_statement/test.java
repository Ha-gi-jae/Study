package c_statement;

import java.util.Scanner;

public class test {

	public static void main(String[] args) {
		
		Scanner s = new Scanner(System.in);
		
		int count = 0 ;
		String answer = null;
		
		System.out.println("=====자가진단=====");
		
		System.out.println("질문내용 (Y/N)");
		answer = s.nextLine();
		if(answer.equals("Y")) count++;
		//한 문장일 경우 블럭{} 생략가능
		System.out.println("====진단결과=====");
		if(count <= 3){
			System.out.println("주위!");}
		else if( 4 <= count && count <=6){
				System.out.println("위험!!");
			}else{
				System.out.println("중독!!!");
			}
		
	}

}
