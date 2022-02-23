package z_game;

public class Stair {
	
	int stair = (int)(Math.random()*15)+5;
	int Max = stair;
	int Min = 0;
	int com_tem = 0;
	int user_tem = 0;
	
	void com_win(){//컴터 승리 패배
		com_tem++;
		if(com_tem < stair){
			System.out.println("컴퓨터가 " + com_tem + "/" + stair + "으로 올라갑니다." );
		}
		else{ com_tem = stair; System.out.println("컴퓨터가 게임에서 승리하였습니다."); Gamestart.flag = false;}
	}
	
	void com_lose(){
		com_tem--;
		if(com_tem >= Min){
			System.out.println("컴퓨터가" + com_tem + "/" + stair + "으로 내려갑니다.");
		}
		else { com_tem=0;}
	}
	
	void user_win(){//유저 승리 패배
		user_tem++;
		if(user_tem < stair){
			System.out.println("유저가 " + user_tem + "/" + stair + "으로 올라갑니다." );
		}
		else { user_tem = stair; System.out.println("유저가 게임에서 승리하였습니다.");  Gamestart.flag = false; }
	}
	
	void user_lose(){
		user_tem--;
		if(user_tem >= Min){
			System.out.println("유저가" + user_tem + "/" + stair + "으로 내려갑니다.");
		}
		else { user_tem=0; }
	}
}

