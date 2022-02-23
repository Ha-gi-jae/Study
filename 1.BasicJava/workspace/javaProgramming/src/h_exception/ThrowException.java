package h_exception;

import java.io.IOException;
import java.util.Scanner;

public class ThrowException {

	public static void main(String[] args) {
		/*
		 * 메서드에 예외 선언하기
		 *  - 메서드 호출시 발생할 수 있는 예외를 선언해줄 수 있다.
		 *  - void method() throws IOException {}
		 *  - 메서드의 구현부 끝에 throws 예약어와 클래스명으로 예외를 선언할 수 있다.
		 *  - 예외를 선언하면 예외처리를 하지 않고 자신을 호출한 메서드로 예외처리를 넘겨준다.		 
		 */
		
		Scanner s = new Scanner(System.in);
		public static int nextInt(){
			int num = 0;
			while(true){
				try{
					num = Integer.parseInt(s.nextLine());
				}catch(Exception e){
					System.out.println("잘못입력하셨습니다. 다시 입력해주세요.");
					continue;
				}
				break;
			}
			return num;
		}
		
		
		
		try {
			method(); 				//main에서 method()를 불렀으니 main에서 예외처리.
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
		private static void method() throws IOException {
			throw new IOException();
		}
		
	


}