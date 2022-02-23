package z_game;

public class istudy {

	public static void main(String[] args) {
		int i = 0, sum = 0;
		while(i<10){
			i++;
			if(i%2 == 1)
				continue;
			sum += i;
			System.out.println("i : " +i);
			System.out.println("sum : " +sum);
		}

	}

}
