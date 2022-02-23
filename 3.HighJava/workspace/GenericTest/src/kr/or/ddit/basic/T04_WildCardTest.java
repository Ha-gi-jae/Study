package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.List;

public class T04_WildCardTest {
	/*
	 * 와일드 카드에 대하여...
	 * 
	 * 와일드 카드(?)는 제너릭 타입을 이용한 타입 안전한 코드를 위해 사용되는 특별한 종류의 인수로서, 변수선언, 객체생성 및 메서드 정의할
	 * 때 사용된다. (제너릭 타입 선언시에는 사용할 수 없다.)
	 * 
	 * <? extends T> => 와일드카드의 상한 제한. T와 그 자손들만 가능 // 하위의 하위 다 가능 Number 하면 byte,short, integer .. 다 가능 
	 * <? super T> => 와일드카드의 하한 제한. T와 그 조상들만 가능
	 * <?> => 모든 타입가능. <? extends Object>와 동일.
	 */

	public static void main(String[] args) {
		
		FruitBox<Fruit> fruitBox = new FruitBox(); // 과일상자
		FruitBox<Apple> appleBox = new FruitBox<>(); // 사과상자
		
		fruitBox.add(new Apple());
		fruitBox.add(new Grape());
		
		appleBox.add(new Apple());
		appleBox.add(new Apple());
//		appleBox.add(new Grape()); // 사과 타입인데 왜 포도 타입을 넣냐! 
		
		Juicer.makeJuice(fruitBox); // fruitBox의 타입이 Fruit이기 때문에 잘 된다.
		Juicer.makeJuice(appleBox); // Box의 타입이 Apple이기 때문에 불가능
	}
}

class Juicer {// 유틸기능이니 static으로 정의하겠음.
	// 제한된 타입 파라미터
//	static <T extends Fruit> void makeJuice(FruitBox<T> box) { // 사용하는 시점이므로 <>에 기술. Fruit 타입의 과일만 올 수 있다.
	//안에 사과든 포도든 쓰레기든 뭐든지 다 들어감. 과일만 들어가게 하고 싶다면?
	// 이렇게 T extends Fruit 을 해주면 Fruit 타입의 과일만 들어 올 수 있다.
	
	static  void makeJuice(FruitBox<? extends Fruit> box) { // 사용하는 시점이므로 <>에 기술. Fruit 타입의 과일만 올 수 있다.
		// 제너릭타입메서드가 아니여도  와일드카드를 써서 Fruit 타입만 오게 할 수 있다.
		// 와일드카드 => 타입모를때 ??
		String fruitListStr = ""; // 과일 목록

		int cnt = 0;

		for (Fruit f : box.getFruitList()) { 
			if (cnt == 0) {
				fruitListStr += f;
			} else {
				fruitListStr += "," + f;
			}
			cnt++;
		}
		
		System.out.println(fruitListStr + " = > 쥬스완성!!!");

	}
}
// 과일
class Fruit {

	private String name; // 과일이름

	public Fruit(String name) {
		super();
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "과일(" + name + ")";
	}

}

class Apple extends Fruit {

	public Apple() {
		super("사과");
	}

}

class Grape extends Fruit {
	public Grape() {
		super("포도");
	}
}

class FruitBox<T> {
	private List<T> fruitList;

	public FruitBox() {
		fruitList = new ArrayList<>();
	}

	public List<T> getFruitList() {
		return fruitList;
	}

	public void setFruitList(List<T> fruitList) {
		this.fruitList = fruitList;
	}

	public void add(T fruit) {
		fruitList.add(fruit);
	}

}