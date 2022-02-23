package kr.or.ddit.basic;

import java.util.Comparator;

import javax.swing.JOptionPane;

public class T07_ThreadGame {
	public static boolean inputCheck = false;
	
	public static void main(String[] args) {
		MyTurn mt = new MyTurn();
		mt.start();
		
		Count count = new Count();
		count.start();
		
		
	}
}

class MyTurn extends Thread{
	int computer = (int)(Math.random()*3);
	@Override
	public void run() {
		String str = JOptionPane.showInputDialog("0 : 가위 1 : 주먹 2 :  보 ");
		T07_ThreadGame.inputCheck = true;
		System.out.println("=== 결과 ===");
		switch (computer) {
		case 0:
			System.out.println("컴퓨터 : 가위");
			break;
		case 1:
			System.out.println("컴퓨터 : 주먹");
			break;
		case 2:
			System.out.println("컴퓨터 : 보");
			break;
		}
		
		switch (Integer.parseInt(str)) {
		case 0:
			System.out.println("유저 : 가위");
			break;
		case 1:
			System.out.println("유저 : 주먹");
			break;
		case 2:
			System.out.println("유저 : 보");
			break;
		}
		
		
		if(Integer.parseInt(str) < computer) {
			if(computer ==2 && Integer.parseInt(str) == 0) {
				System.out.println("유저 승");
			} else{
				System.out.println("컴퓨터 승");
				}
			
		} else if(computer < Integer.parseInt(str)) {
			if(Integer.parseInt(str) ==2 && computer ==0) {
				System.out.println("컴퓨터 승");
			}else {
			System.out.println("유저 승");
			}
		}else {
			System.out.println("무승부");
		}
		
	}
	
}

class Count extends Thread{
	@Override
	public void run() {
		for (int i = 5; i >= 1; i--) {
			if(T07_ThreadGame.inputCheck == true) {
				return;
			}
			
			System.out.println(i);
			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println("5초가 지났습니다. 패배하였습니다.");
		System.exit(0);
	}
}