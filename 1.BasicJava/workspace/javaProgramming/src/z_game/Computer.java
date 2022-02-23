package z_game;

public class Computer {
	int com_rps(){// 컴퓨터 주먹, 가위, 보 랜덤으로 정함. 
		int rps = (int)(Math.random()*3);
		return rps; 
	}
}
