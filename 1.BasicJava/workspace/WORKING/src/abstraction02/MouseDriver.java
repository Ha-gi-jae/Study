package abstraction02;

public class MouseDriver {
	public static void main(String[] args) {
		Mouse Jerry = new Mouse();
		Jerry.name = "제리";
		Jerry.age = 74;
		Jerry.countOfTail += 1;
		
		System.out.println(Jerry.name+ " "  + Jerry.age+ " " + Jerry.countOfTail);
		Jerry.sing();
		
		Mouse Mickey = new Mouse();
		Mickey.name = "미키";
		Mickey.age = 85;
		
		System.out.println(Mickey.name+ " "  + Mickey.age+ " " + Mickey.countOfTail);
		Mickey.sing();
	}
}
