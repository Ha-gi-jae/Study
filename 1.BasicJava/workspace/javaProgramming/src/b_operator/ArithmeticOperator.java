package b_operator;

public class ArithmeticOperator {

	public static void main(String[] args) {
		/*
		 * 산술 연산자
		 *  - 사칙연산자 : +, -, *, /, %(나머지)
		 *  - 복합연산자 : +=, -=, *=, /=, %=
		 *  - 증감연산자 : ++, --
		 */
		
		// 조건문       a = a + 1
		//         a +=1
		//         a++
//		for (int i = 0; i < 5; ++i)
//				{System.out.println(i);}
//		
		int i;
		for(i = 0; i <= 6; i++){
			System.out.println(i);
			System.out.println("==");
		}
			System.out.println(i);
			System.out.println("====================");
		int j;
			for(j =0; j <= 6; ++j){
				System.out.println(j);
				System.out.println("==");
			}
		System.out.println(j);
		System.out.println("====================");
		
		//		int result = 10 + 20 - 30 * 40 / 50 % 60;
//		// 프로그래밍에서도 마찬가지로 곱셈, 나눗셈, 나머지 순서로 실행된 후, 덧셈과 뺄셈이 실행된다.
//		
//		//나머지 연산
//		result = 10 / 3;
//		System.out.println(result);
//		//현재 result는 int 타입이기 때문에 3만 출력. 원래는 3.333333
//		result = 10 % 3;
//		System.out.println(result);
//		
//		//5개의 산술연살자를 사용해 5개의 연산을 수행 후 결과를 출력해주세요.
//		
//		int a = 10 + 20;
//		int b = 30 - 20;
//		double c = 1.5 * 6;
//		int d = 15 / 5;
//		int e = 16 % 3;
//		System.out.println(a);
//		System.out.println(b);
//		System.out.println(c);
//		System.out.println(d);
//		System.out.println(e);
//		
//		
//		
//	    //복합연산자
//		//변수에 저장되어 있는 값에 연산을 수행할 때 수행할 연산자와 대입연산자를 결합해 사용할 수 있다.
//		result = result + 3;
//		System.out.println(result);
//		
//		//위와 아래는 같다
//		
//		result += 3;
//		System.out.println(result);
//		
//		result -= 5;
//		System.out.println(result);
//		
//		result *= 2;
//		System.out.println(result);
//		
//		//아래의 문장을 복합연산자를 사용한 문장으로 만들어주세요.
//		//result = result + 10;
//		result += 10;
//		//result = result % 5;
//		result %= 5;
//		//result = result - 2 * 3;
//		result -= 6; 
//		//위를 아래로 바꿔야함.
//		result -= 2 * 3;
//		//조건식일때 이렇게 써야하기때문에 .
		
		// int a = 10/3  ;
		//System.out.println(a);
		// 소숫점까지 나오게하려면?
		// int 를 double로 바꿔준 후 
		// a = 10d/3
		// a = 10/3d
		// a =10./3
		// a = 10/3. 
		// 이렇게 해야지 소숫점도 나옴!
		
		
		//증감연산자
		//증가연산자(++) : 변수의 값을 1 증가시킨다.
		//감소연산자(--) : 변수의 값을 1 감소시킨다.
//		int i = 0;
		
//		++i; //전위형 : 변수의 값을 읽어오기 전에 1 증가된다. 증가 시킨후 변수의 값을 쓴다.
//		i++; //후위형 : 변수의 값을 읽어온 후에 1 증가된다. 값을 쓴 후 증가 시킨다.
//		i--;
//		--i;
//		//문장에 있을때 전위형과 후위형의 차이가 발생함.
//		
//		i = 0;
//		System.out.println("++i = " + ++i);
//		//0을 1로 증가시킨 후 출력.
//		i = 0;
//		System.out.println("i++ = " + i++);
//		//0을 그대로 사용해서 프린트한 후, 1을 증가
//		System.out.println(i);
//		//1이 증가되었음.
		
		
		//피연산자(연산의 대상이 되는 값)의 타입이 서로 같아야만 연산이 가능하다.
		// 1 + 2  여기 1, 2 둘다 피연산자임.
		int _int = 10;
		double _double = 3.14;
		double result2 = _int + _double; //표현범위가 더 큰 타입으로 형변환된다.
		System.out.println(result2);
		// int + int , double + double 이 되어야함. 근데 왜 int + double 이 되느냐? 형변환.
		// 작은 타입에서 큰 타입은 생략가능하기 때문에. int가 자동으로 double로 형변환이 된다.
		//double result2 = (double)_int + _double; 이렇게 자동으로 형변환이 되어있는 상태임 
		
		
		byte _byte = 5;
		short _short = 10;
		_int = _byte + _short; //int보다 작은 타입은 int로 형변환된다.
		System.out.println(_int);
		//_short = _byte + _short; 컴파일러난다.
		//컴퓨터는 기본적으로 연산할때 4byte 이상이 되어야 할 수있다. 그렇기 때문에 byte와 short는 자동적으로 int 타입으로 형변환이 된다.
		// 결국 _byte + _short 는 둘다 int 타입으로 변환 되어서 더해졌기 때문에 int 타입의 값이 나온다.
		
		char _char = 'a';
		char _char2 ='b';
		_int = _char + _char2;
		System.out.println(_int);
		// char 는 2 byte이기 때문에 4byte인 int로 형변환이 되어 계산이 된다.
		// UNICODE로 계산 된 것임. a = 97, b = 98 이 연결되어있음.
		//각 문자마다 숫자가 할당되어있음.
		
		
		//오버플로우, 언더플로우
		//표현범위를 벗어나는 값을 표현할 때 발생하는 현상
		byte b = 127;
		b++;
		System.out.println(b);
		// byte type 이 표현할수 있는 값은 -128 ~ 127 임.
		//표현 범위를 넘어가면 큰 값이 작은 값으로 변함.
		b--;
		System.out.println(b);
		//반대로 표현 범위가 넘어가면 작은 값이 큰 값으로 변함.
		
		//다음을 한줄씩 계산해서 최종 결과값을 출력해주세요.
		//1. 123456 + 654321
		//2. 1번의 결과값 * 123456
		//3. 2번의 결과값 / 123456
		//4. 3번의 결과값 - 654321
		//5. 4번의 결과값 % 123456
		
		int q = 123456 + 654321;
		System.out.println(q);  
		long w = q * 123456L; // L을 쓴 이유는 현재 q와 123456 가 int 값 임. 그래서 롱 값으로 하나를 바꿔줘야 다른 하나가 형변환이 자동으로 됨.
		System.out.println(w);
		long e = w / 123456;
		System.out.println(e);
		long r = e - 654321;
		System.out.println(r);
		long t = r % 123456;
		System.out.println(t);
		
		long res = 123456 + 654321;
		res *= 123456;
		res /= 123456;
		res %= 123456;
		System.out.println(res);
		
		//3개의 int형 변수를 선언 및 초기화 후 합계와 평균을 구해주세요.
		int hi = 10;
		int bye = 20;
		int hel = 30;
		int res_;
		double res_2;
		res_ = hi + bye + hel;
		System.out.println("합계 : " + res_);
		res_2 = hi/3;
		System.out.println("평균 : " + res_2);
		
		int num1 = 15;
		int num2 = 34;
		int num3 = 49;
		int sum = num1 + num2 + num3;
		double avg = sum / 3.0; // 나눗셈을 하다보면 소숫점이 발생하기 때문에 double로 써줌. 지금 sum 과 3은 int 임. 결과는 지금 int지만 double 타입이됨.
		System.out.println("sum : " + sum + " avg : " + avg);
		// #위의 3.0은 지금 3이였음.
		
		//반올림
		avg = Math.round(avg);
		System.out.println(avg);
		//math 클래스에 있는 round메서드는 첫째자리를 올림해줌.
		//avg = Math.round(avg * 10) / 10.0;
		// avg * 10 은 int 이기 때문에 10이 아닌 10.0으로 나눠서 double로 만들어줌.
		
		//String.format 문
		//https://interconnection.tistory.com/116 사이트 참고!
		//
		
		//랜덤
		int random = (int)(Math.random() * 100) + 1;
		System.out.println(random);
		// 1에서 100 사이에 랜덤을 발생시켜라.
		//math 클래스에 있는 random 메서드.
		//Math.random() : 0.0 ~ 1.0미만(0.999999999...)
		//random 자주 이용하니까 알아 두기.
		//math.random 의 출력값은 double 타입 임. 그것을 지금 int로 형변환시킨거.
		
		
		
		
		
	}

}
