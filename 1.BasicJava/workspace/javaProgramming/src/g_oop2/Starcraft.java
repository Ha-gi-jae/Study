package g_oop2;

public class Starcraft {

	public static void main(String[] args) {
		Marine marine = new Marine();
		Tank tank = new Tank();
		Dropship dropship = new Dropship();
		SCV scv = new SCV();
		
//		scv.repair(marine); -- 상속을 받지 않아서  repair 파라미터에 들어가지 못함. 
		scv.repair(tank);
		scv.repair(dropship);
		scv.repair(scv);
		
		System.out.println(SampleInterface.NUM1);
		//인터페이스를 쓸때는 이렇게 이름을 통해서 쓰는게 좋은방법.
	}

}

class Unit{
	int hp;
	final int MAX_HP;
	
	Unit(int hp){
		MAX_HP = hp;
		this.hp = MAX_HP;
	}
	
}

class Marine extends Unit {//유닛클래스만 이용가능
	Marine() {
		super(40);
	}
}

class Tank extends Unit implements Repairable{//유닛클래스와 리페어러블인터페이스 둘다 이용가능
	Tank() {
		super(150);
	}
}

class Dropship extends Unit implements Repairable{
	Dropship() {
		super(125);
	}
}

class SCV extends Unit implements Repairable{// scv는 기계만 수리할 수 있음 탱크랑 드랍쉽만 수리 할 수있게 하려면? 유닛을 타입으로 쓰면 마린까지된다.
	SCV() {									//이럴때!! 인터페이스를 사용!
		super(60);
	}
	void repair(Repairable r){//이제 Repairable을 상속 받은 얘들만 수리가 가능하다.
		if(r instanceof Unit){//Unit으로 형변환이 가능한지 확인.
			Unit u = (Unit) r;//리페어러블 타입의 유닛을 유닛타입으로 형변환 시켜서 유닛 타입으로 저장해줌. 그걸 수리함.
			
			while(u.hp< u.MAX_HP){
				u.hp++;// hp가 max가 될때 까지 증가.
			}
		}
	}
}

interface Repairable {
	
}