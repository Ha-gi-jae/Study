package study;

public class Threadstudy {
	public static void main(String[] args) {
	// 멀티스레드
	
	// 방법1 : Thread 클래스를 상속한 클래스의 인스턴스를 생성한 후,
	//		 이 인스턴스의 start()메서드를 호출한다.
		
	MyThread1 th1 = new MyThread1(); // MyThread1 클래스의 th1 인스턴스 생성
	th1.start(); // Thread 객체의 메서드인 start로 실행
	
	// 방법2 : Runnable인터페이스를 구현한 class의 인스턴스를 생성한 후
	// 이 인스턴스를 Thread객체의 인스턴스를 생성할 때 생성자의
	// 매개변수로 넘겨준다. 이때, 생성된 Thread객체의 인스턴스의 start()메서드를 호출.
	Runnable r1 = new MyThread2(); //
	//MyThread2 r1 = new MyThread2(); 와 같다.
	Thread th2 = new Thread(r1);
	//객체안에 Runnable 객체를 넣어줄 수 있다.
	th2.start(); // 마찬가지로 Thread객체의 메서드인 start메서드를 호출해서 실행
	
	// 방법3 : 익명클래스 이용하는 방법
	// Runnable 인터페이스를 구현한 익명클래스를 Thread인스턴스를 생성할때 매개변수로 넣어준다.
	// 바로 만들어줌.
	Thread th3 = new Thread(new Runnable() {
		
		@Override
		public void run() {
			for(int i = 1; i <= 200; i++) {
				System.out.println("*");
				
				
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
	});
	
	
	}
}

class MyThread1 extends Thread {

	@Override
	public void run() { // run은 Thread에 있는 메서드이며, 메인역할을 한다
		for (int i = 1; i <= 200; i++) {
			System.out.println("#");

			try {
				Thread.sleep(1000);
				//Thread.sleep(시간) => 주어진 시간동안 쓰레드를 멈춘다.
				//밀리세컨드 단위이며, 1000에 1초이다.
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

		}

	}

}

class MyThread2 extends Thread {

	@Override
	public void run() {
		for (int i = 1; i <= 200; i++) {
			System.out.println("$");
			
			
			
			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}

	}
}