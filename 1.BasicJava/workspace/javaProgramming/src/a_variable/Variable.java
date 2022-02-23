package a_variable; //패키지 : 클래스의 위치

//import : 다른 패키지에 있는 클래스의 위치를 알려주는 것. import는 반드시 패키지와 클래스 사이에 위치하여야함.
//Ctrl + Shift + o 알파벳 o 임.

import java.util.Scanner;

// #java util에 있는 scanner위치를 가져옴.

public class Variable { //클래스 : 데이터의 기능의 집합

	public static void main(String[] args) { //메서드 : 명령문의 집합
		//main메서드 : 프로그램의 시작과 끝
		
		//주석 : 프로그램 코드로 인식하지 않는 문장(주로 코드를 설명하는데 사용)
		//        한줄주석 : Ctrl + shift + c
		
		  /*  범위주석 : Ctrl + Shift + /(해제 : \) 블럭지정을 해줘야함.*/
		//프로그래밍: 컴퓨터에게 일을 시키는것. 데이터와 조작을 통해 그 과정을 전달.
		
		/*
		데이터 
		
		1. 기본형
		-  숫자
		-  문자
		-  논리
		  
		2. 참조형(데이터가 위치한 주소를 저장) 크기가 고정 X
		-  배열(형태가 같은 여러개의 데이터를 묶어서 사용) ex 숫자를 모아서, 문자를 모아서, 논리를 모아서 사용
		-  클래스(형태가 다른 여러개의 데이터와 기능을 묶어서 사용)
		
		변수 = 데이터를 저장할 공간을 만드는 것
		종류와 이름만 정해주면 컴퓨터가 만들어줌*/
		
/*	기본형 타입
        - 정수 : byte(1), short(2), *int(4/약20억), long(8/약900경)
        - 실수 : float(4/7자리), *double(8/15자리)  정확한 수치가 아닌 근사치 (7자리, 15자리) 까지 정확하다는의미
        - 문자 : char(2) 문자 한글자 표현가능
        - 논리 : boolean(1) 참과 거짓    true or false
        
        참조형 타입
       - 문자열 : String(4)  모든 참조형 타입은 4바이트 크기를 가짐.
        
        위 9가지는 외우기. 크기까지.
        
        명명규칙
        - 영문자 대소문자, 한글, 숫자, 특수문자('_', '$')를 사용할 수 있다.      웬만하면 한글 사용안하니 사용ㄴㄴ
        - 숫자로 시작할 수 없다.
        - 예약어는 사용할 수 없다.   예약어 : 이미 자바에서 기능으로 쓰고있는 단어 [package, public class, public static void 같은 것이 예약어(보라색)]
        - [낙타식 표기법을 사용한다.(mySampleVariable)] 단어가 바뀔때, 앞글자를 대문자로 쓰는것을 낙타식 표기법 이라고함.
        - [클래스명의 첫글자는 대문자로 한다.(MySampleClass)]  []해놓은 것은 프로그래머 끼리 암묵적인 약속이라 지켜주는게 좋음.
        이것도 무조건 외우기.
*/		
		//변수 선언 = 변수를 만든다.(값을 저장할 공간을 만드는 것)
	int x; //;(세미콜론) : 문장의 마침표
	long y;
	float z;
	char abc;
	boolean boolean$;
	String name123;
	
//같은[]중괄호 안에서 이름이 중복되지 않아야함.
		
		//9가지 타입을 모두 사용해 9개의 변수를 선언해주세요.
	byte a;
	short b;
	int c;
	long d;
	float e;
	double f;
	char g;
	boolean h;
	String i;
		
		// 빨간물결은 컴파일을 할 수 없다고 이클립스가 알려주는 것임.
		
		//초기화(변수에 처음으로 값을 저장하는 것)
		//=(대입연산자) : 오른쪽의 값을 왼쪽의 변수에 저장한다.
		//변수를 선언한 이후에는 변수의 이름을 가지고 변수를 사용한다.
	x = 10; //타입에 맞는 값을 저장해야 한다. 현재 x는 int로 되어있으므로 정수로 된 데이터를 주어야함.
	y = 20L; //접미사 L을 붙여야 long타입이 된다. L을 붙히지 않으면 int타입을 저장하게됨.
	z = 3.14f; //접미사 f를 붙여야 float타입이 된다.	
	abc = '가'; //따옴표안에 반드시 한글자를 넣어야 한다.	
	boolean$ = true; // true, false
	name123 = "가나다라 abcd 1234"; //쌍따옴표로 문자열을 표현한다.
	
	//뒤에서 선언한 9개의 변수들을 초기화 해주세요.
	a = 1;
	b = 2;
	c = 3;
	d = 4L;
	e = 1.5f;
	f = 1.5d;
	g = '가';
	h = false;
	i = "자바프로그래밍 javaProgramming";
		
	int aa = 10;
	aa = 20; // 변수에는 하나의 데이터만  저장 되므로 20만 저장됨.
	
	//형변환(데이터의 타입을 다른 타입으로 변경하는 것)
	
	int _int = 10;
	long _long = 20L;
	
	_int = (int)_long;
	// _int = ()_long; ()괄호안에 바꾸고 싶은 데이터의 타입을 작성해주면 된다.
	_long = _int; // 표현범위가 작은 타입에서 큰 타입으로의 형변환은 생략할 수 있다. #byte가 아닌 표현 범위. 
	// long(8) float(7) 와 비교 했을때 float가 표현 범위가 더 넓음. byte로 생각 절대 ㄴㄴ 
	_int = _int + (int)_long;
	// _int = _int + _long;// 서로 다른 타입은 연산할 수 없다.
	
	//변수 3개를 선언해 변수와 타입과 다른 타입의 값으로 초기화 해주세요.

	
	int bb = (int)3.14;
	float ff = (float)5.5;
	char cc = (char)_int;
	
	//출력(콘솔)
	System.out.println("출력");
	System.out.println(x);
	//실행 단축키: Ctrl + F11
	System.out.print("출력 후 줄바꿈을 안함");
	System.out.print("출력 후 줄바꿈을 안함");
	System.out.printf("출력 포멧 지정");
	//println 줄바꿈 print 줄바꿈 안함. printf 출력 포멧 지정
	
	//탈출 문자(Escape 문자)
	System.out.println("탭은 \t4칸에 맞춰 띄워줍니다."); // \t4이 tab으로 바뀜 
	System.out.println("줄바꿈을 \n해줍니다."); // 줄바꿈으로 바뀜
	System.out.println("\"쌍따옴표를 넣어줍니다.\""); // 쌍따옴표 넣어주는걸로 바뀜
	System.out.println("\\역슬래시를 넣어줍니다."); // 역슬래시를 표시할때 쓰임.
	// \를 탈출 문자라고 함. 원래 역할에서 탈출하게 해줌. \ 뒤에 있어야함.
	
	//입력
	Scanner sc = new Scanner(System.in); //입력받기 위한 클래스 외우기. 문장 쓰려면 외워야함..
	//Scanner 가 어떤 패키지에 있는지 알려줘야함. 맨위로!
	
//	System.out.println("아무거나 입력해주세요>");
//	String str = sc.nextLine();
//	// str에 입력받는 것은 문자이므로 String으로 변수를 생성함.
//	System.out.println("입력받은 내용 : " + str);
	
//	System.out.println("숫자를 입력해주세요>");
//	int nextInt = sc.nextInt();
//	// nextInt에 입력 받는 것이 숫자이므로 int로 변수를 생성함.
//	System.out.println("입력받은 숫자 : " + nextInt);
//	System.out.println("문자열 다시 입력>");
//	String nextLine = sc.nextLine();
//	System.out.println("입력받은 문자열: "+ nextLine);
//	System.out.println("입력 끝!!");
	//nextint를 쓴 후 nextline을 쓰면nextLine은 그냥 넘어감. 그러니 nextint는 쓰면 안됨.
	
//	System.out.println("숫자 입력>");
//	int number = Integer.parseInt(sc.nextLine());
//	System.out.println("입력받은 숫자: " + number);
//	double d = Double.parseDouble(sc.nextLine());
	
	//integer.parseInt 문자 타입을 인트 타입으로 형변환 시켜주는 메서드
	//Double.parseDouble("123") 문자 타입을 더블 타입으로 형변환 시켜주는 메서드
	
	//자신의 이름을 저장할 변수를 선언하고 Scanner를 사용해 이름을 저장해주세요.
	
//	System.out.println("이름을 입력해주세요>");
//	String myname = sc.nextLine();
//	System.out.println("저의 이름은 : " + myname +" 입니다.");
	
	//자신의 나이를 저장할 변수를 선언하고 Scanner를 사용해 나이를 저장해주세요.
//	System.out.println("나이를 입력해주세요>");
//	int myage = sc.nextInt();
	//String myage = "1"; 숫자는 int 로 변경이 되는데 문자가 들어가면 오류남.
	//
	//	System.out.println("저의 나이는 :" + myage +" 입니다." );
	
	//이름과 나이를 출력해 주세요.
	String myname = sc.nextLine();
	int myage = sc.nextInt();
	System.out. println ("이름: "+ myname +" / 나이:" + myage);
	
	System.out.println();
	
	}
}

