package z_game;

import java.util.Scanner;


public class RockPaperScissors {
	Computer computer = new Computer();
	User user = new User();
	Stair stair = new Stair();
	
	void rps(){
		int com_temp = computer.com_rps();
		int user_temp = user.user_rps();
		
		switch(user_temp){
		
			case 0:
				System.out.println("유저: 가위");
				if (com_temp == 1) {
				System.out.println("컴퓨터: 바위");
				System.out.println("컴퓨터 승!");
				stair.com_win();
				stair.user_lose();
			} else if (com_temp == 2) {
				System.out.println("컴퓨터: 보");
				System.out.println("유저 승!");
				stair.user_win();
				stair.com_lose();
			} else {
				System.out.println("컴퓨터: 가위");
				System.out.println("무승부");
			}
			break;

		case 1:
				System.out.println("유저: 바위");
				if (com_temp == 2) {
				System.out.println("컴퓨터: 보");
				System.out.println("컴퓨터 승!");
				stair.com_win();
				stair.user_lose();
			} else if (com_temp == 0) {
				System.out.println("컴퓨터: 가위");
				System.out.println("유저 승!");
				stair.user_win();
				stair.com_lose();
			} else {
				System.out.println("컴퓨터: 바위");
				System.out.println("무승부");
			}
			break;

		case 2:
				System.out.println("유저: 보");
				if (com_temp == 0) {
				System.out.println("컴퓨터: 가위");
				System.out.println("컴퓨터 승!");
				stair.com_win();
				stair.user_lose();
			} else if (com_temp == 1) {
				System.out.println("컴퓨터: 바위");
				System.out.println("유저 승!");
				stair.user_win();
				stair.com_lose();
			} else {
				System.out.println("컴퓨터: 보");
				System.out.println("무승부");
			}
			break;
		}
	}
	
}
