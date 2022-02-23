package kr.or.ddit.basic;

public class T02_ThreadTest {
	public static void main(String[] args) {
		// 멀티 스레드 프로그램
		
		// 방법1 : Thread클래스를 상속한 클래스의 인스턴스를 생성한 후,
		//		   이 인스턴스의 start()메서드를 호출한다.
		
		MyThread1 th1 = new MyThread1(); // thread 객체에는 실행시키는 start() 메서드가 존재
		th1.start(); // start를 호출해야 그 Thread를 위한 콜 스택이 만들어짐.
//		th1.run();  별도의 콜스택이 만들어지지않고 main의 Call Stack이 실행함. 
		
		// 방법2 : Runnable인터페이스를 구현한 class의 인스턴스를 생성한 후
		//		   이 인스턴스를 Thread객체의 인스턴스를 생성할 때 생성자의
		//		   매개변수로 넘겨준다. 이때, 생성된 Thread객체의 인스턴스의
		//		  start()메서드를 호출한다.
		
		Runnable r1 = new MyThread2(); // MyThread2 r1 = new MyThread(); 는 똑같음.
		Thread th2 = new Thread(r1); // 객체안에 Runnable 객체를 넣어줄 수 있다.
		th2.start();
		
		// 방법3 : 익명클래스를 이용하는 방법
		//		  Runnable인터페이스를 구현한 익명클래스를 Thread인스턴스를
		//		   생성할때 매개변수로 넣어준다.
		
		Thread th3 = new Thread(new Runnable() {
			
			@Override
			public void run() {
				for(int i = 1; i <= 200; i++) {
					System.out.print("@");
					
					try {
						// Thread.sleep(시간) => 주어진 시간동안 작업을 잠시 멈춘다.
						// 시간은 밀리세컨드 단위를 사용한다.
						// 즉, 1000 밀리세컨드는 1초를 의미한다.
						Thread.sleep(100);
						
					}catch(InterruptedException ex) {
						ex.printStackTrace();
					}
				}
			}
		});
		th3.start();
		
		
		
		
		
	}//main Call Stack이 비워짐.  하지만 MyThread1, MyThread2 는 아직 run 중...> 끝나면 이 MyThread들도 Call Stack이 비워지면서 사라짐.
	
}


class MyThread1 extends Thread {
	
	@Override
	public void run() { // run()은 Thread에 있는 메서드
		// 일종의 run()은 Thread의 메인역할
		
		for(int i = 1; i <= 200; i++) {
			System.out.print("*");
			
			try {
				// Thread.sleep(시간) => 주어진 시간동안 작업을 잠시 멈춘다.
				// 시간은 밀리세컨드 단위를 사용한다.
				// 즉, 1000 밀리세컨드는 1초를 의미한다.
				Thread.sleep(100);
				
			}catch(InterruptedException ex) {
				ex.printStackTrace();
			}
		}
	}
}

class MyThread2 implements Runnable {

	@Override
	public void run() {
		
		for(int i = 1; i <= 200; i++) {
			System.out.print("$");
			
			try {
				// Thread.sleep(시간) => 주어진 시간동안 작업을 잠시 멈춘다.
				// 시간은 밀리세컨드 단위를 사용한다.
				// 즉, 1000 밀리세컨드는 1초를 의미한다.
				Thread.sleep(100);
				
			}catch(InterruptedException ex) {
				ex.printStackTrace();
			}
		}
		
	}
	
}