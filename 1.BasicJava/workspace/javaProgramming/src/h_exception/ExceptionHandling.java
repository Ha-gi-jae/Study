package h_exception;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class ExceptionHandling {

	public static void main(String[] args) {
		/*
		 * 런타임 에러
		 *   - 런타임 에러 발생시 발생한 위치에서 프로그램이 비정상적으로 종료된다.
		 *   - 에러 : 프로그램 코드에 의해 수습될 수 없는 심각한 오류(처리 불가)
		 *   - 예외 : 프로그램 코드에 의해서 수습될 수 있는 다소 미약한 오류(처리 가능)
		 *   
		 *  예외
		 *   - 모든 예외는 Exception 클래스의 자식 클래스이다.
		 *   - RuntimeException 클래스와 그 자식들은 예외처리가 강제되지 않는다.
		 *   - [RuntimeException 클래스와 그 자식들을 제외한] Exception 클래스의 자식들은 예외처리가 강제된다.
		 *   
		 *  예외처리(try-catch)
		 *   - 예외처리를 통해 프로그램이 비정상적으로 종료되는 것을 방지할 수 있다.
		 *   - try () catch(Exception e) {} <-예외처리하는내용이 들어옴. 동일한 타입의 파라미터여야한다. catch가 2개이상일때는 이어서 쓰면된다.
		 *   - try 블럭 안의 내용을 실행 중 예외가 발생하면 catch로 넘어간다.
		 *   - catch의 ()안에는 처리할 예외를 지정해줄 수 있다.
		 *   - 여러 종류의 예외를 처리할 수 있도록 catch는 하나 이상 올 수 있다.
		 *   - 발생한 예외와 일치하는 catch 블럭안의 내용이 수행된 후 try-catch를 빠져나간다.
		 *   - 발생한 예외와 일치하는 catch가 없을 경우 예외는 처리되지 않는다.
		 */
		
		try{
			int result = 10 / 0;
			System.out.println(result);			
		}catch(ArithmeticException | IndexOutOfBoundsException e){ //ArithmeticException라는 예외가 발생 했을 때[해당하는 예외를 적어주면된다.] [java.lang. ...]
			e.printStackTrace();
		}catch(NullPointerException e){
			//catch를 추가하거나 위 처럼 IndexOutOfBoundsException 쓰면 된다.
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("abcd");
			//모든 예외 처리가능.
			//Exception 이 모든 예외의 부모 이기 때문에. #다형성.		
//		예외가 발생한 이유를 해석하는게 중요함.
//		java.lang.ArithmeticException: / by zero << 발생한 이유
//			at h_exception.ExceptionHandling.main(ExceptionHandling.java:28) < 이걸 누르면 해당 에러로 이동해준다. 
//			 h_exception패키지.ExceptionHandling클래스.main.(ExceptionHandling.java:28) << 에러가 난곳의 위치.
//		Thread : CPU의 경우 싱글(1) 듀얼(2) 쿼드(4)..코어  일할 사람 늘어남. Thread도 마찬가지..
		
		/*
		 * CallStack : 데이터가 위로만 들어오고 위로만 나갈 수 있음.
		 * |____________| 들어온 순서대로 나갈 수 있음.
		 * |____________| 만약 위에 데이터가 쌓여있다면 밑에 데이터는 나갈 수가 없음.
		 * |____________| 호출된 메서드가 차곡 차곡 쌓인다.
		 * |___test(2)__| -3 
		 * |___test(1)__| -2
		 * |___main()___| -1
		*/
	
		test1();	
		
	private static void test1() {
		test2();	
	}
	private static void test2() {
//		System.out.println(10 / 0);	
	}
		try{
			new FileInputStream("");
		}   catch(FileNotFoundException e){
			e.printStackTrace();
			}
	
	
			
	
	}
}
