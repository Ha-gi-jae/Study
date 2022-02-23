package kr.or.ddit.basic;

import javax.swing.JOptionPane;

/**
 * 멀티스레드를 활용한 카운트다운 처리
 */
public class T06_ThreadTest {
	// 입력여부 확인하기 위한 변수 선언
	// 모든 스레드에서 공통으로 사용할 변수
	public static boolean inputCheck = false;

	public static void main(String[] args) { // 메인 , DataInput, CountDown 3개 스레드 도는거임
		DataInput input = new DataInput();
		input.start();
		
		CountDown count = new CountDown();
		count.start();
		//main 쓰레드가 먼저 죽고 그 후에 사용자의 입력에 따라 input 이나 count 가 죽는다.
	}// main
}

/**
 * 데이터를 입력받기 위한 스레드
 */
class DataInput extends Thread {
	@Override
	public void run() {
		String str = JOptionPane.showInputDialog("아무거나 입력하세요.");
		// 입력이 완료되면 inputCheck변수를 true로 변경한다.
		T06_ThreadTest.inputCheck = true;

		System.out.println("입력한 값은 " + str + "입니다.");
	}
}

/**
 * 카운트 다운 처리를 위한 스레드
 * 
 * @author PC-06
 *
 */
class CountDown extends Thread {

	@Override
	public void run() {
		for (int i = 10; i >= 1; i--) {
			// 입력이 완료되었는지 여부를 검사하고 입력이 완료되면
			// run()메서드를 종료시킨다. 즉, 현재스레드를 종료시킨다.
			if (T06_ThreadTest.inputCheck == true) { // 사용자가 입력 작업을 마쳤다.
				return; // run 메서드가 종료되면 스레드도 종료된다.
				// run을 빠져나감.
			}

			System.out.println(i);

			try {
				Thread.sleep(1000);
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
		}
		// 10초가 경과되었는데도 입력이 없으면 프로그램을 종료한다.
		System.out.println("10초가 지났습니다. 프로그램을 종료합니다.");
		System.exit(0); // 프로그램을 종료시키는 명령
		// 무서운 명령어임 ㅠㅠ 쓰레드가 열심히 일하고 있는데 그냥 꺼버림..
	}
}