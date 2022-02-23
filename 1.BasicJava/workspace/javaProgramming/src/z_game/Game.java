package z_game;

public class Game {

	public static void main(String[] args) {//가위바위보 계단오르기.
		Gamestart gamestart = new Gamestart();
		gamestart.start();

	}

}




























class Gamestart{
	static boolean flag =true;
	RockPaperScissors rps = new RockPaperScissors();

	void start(){
		while(flag){
			rps.rps();
		}
	}
}