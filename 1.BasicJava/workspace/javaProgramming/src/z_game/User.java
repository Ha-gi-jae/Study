package z_game;

import java.util.Scanner;

public class User {

	Scanner s = new Scanner(System.in);
	int user_rps(){
			System.out.println("가위: 0\t바위: 1\t보: 2  를 입력하시오.\n");
			int user = Integer.parseInt(s.nextLine());
			if(user < 0) { System.out.println("잘못 내셨습니다."); }
			if(user > 2) { System.out.println("잘못 내셨습니다."); }
		return user;
	}
}
