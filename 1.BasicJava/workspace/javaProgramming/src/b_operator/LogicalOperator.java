package b_operator;

public class LogicalOperator {

	public static void main(String[] args) {
		/*
		 * 논리연산자
		 * - &&(AND), ||(OR), !(NOT) 
		 * - 피연산자로 boolean만 허용한다.
		 */
		// ! 은 true를 false로 false를 true 반대로 바꿔줌.
		
		int x = 10;
		int y = 20;
		boolean b = 0 < x && x < 10 || x < y;
		System.out.println("== " + b);
		// 0< x 와 x < 10 를 연결해줌. 0 < x < 10 이여야함. 둘중 하나라도 false면 false.
		// ||(or) 둘다 false 일때만 false 결과를 얻고 둘 중 하나라도 true 면 true 임. 
		// && 와 || 같이 있으면 &&가 먼저 실행된다. 우선순위.
 		
		b = !(x < y);
		// 10 < 20이므로 TRUE가 맞다. 하지만 앞에 ! 가 있으니 TRUE가 아닌 false 임. !은 boolean 타입에 써야함.
		// 괄호를 안하면 ex) !x < y 이기 때문에 괄호로 boolean 타입을 만들어 준 후 !를 써야한다.
		System.out.println(b);
		
		//효율적 연산
		b = true && true; // true
		b = true && false; // false
		b = false && true; // false
		b = false && false; // false
		// 확인할때 왼쪽 먼저 확인함.
		// && = 왼쪽이 false면 오른쪽은 실행을 하지 않음.
		
		b = true || true; // true
		b = true || false; // true
		b = false || true; // true
		b = false || false; // false
		//왼쪽의 피연산자에서 결과가 정해지면 오른쪽은 수행하지 않는다.
		// || = 왼쪽이 하나라도 true면 바로 true false면 오른쪽 값 확인. 
		
		int a = 10;
		b = a < 5 && 0 < a++;
		System.out.println(a);
		// 지금 왼쪽이 a가 10이니까 false이다. 그래서  오른쪽은 실행을 하지않음.
		// 즉, a++은 실행되지 않았기 때문에 a 의 값은 10 이다.
		
		//다음의 문장들을 코드로 작성해주세요.
		//x가 y보다 크고 x가 10보다 작다.
		//b = x > y && x < 10;
		
		//x가 짝수이고 y보다 작거나 같다.
		//b = x % 2 == 0 && x <= y;
		
		//x가 3의 배수이거나 5의 배수이다.
		//b = x % 3 == 0 || x % 5 == 0;
		
		//b = x > y && x < 10;
		//b = x % 2 == 0 && x <= y;
		//b = x % 3 == 0 || x % 5 == 0;
		
		//홀수나 짝수를 확인할 때는 2로 나눴을때 나머지 0인지 1인지에  따라 짝수인지 홀수인지 가능.
		//배수 확인할때는 나머지를 활용하면된다.
	}

}
