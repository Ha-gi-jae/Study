package e_oop;

import java.util.Scanner;

public class Test {
	
Scanner sc = new Scanner(System.in);
	
	void a(){
		System.out.println("나는 금사빠다");
		System.out.println("*금방 사랑에 빠진다");
		String scanner = sc.nextLine();
		if(scanner.equals("Y")) { a1(); }
		else { b(); }
	}
	
	void a1(){
		System.out.println("연애할 때 끌려다니는 타입이다.");
		String scanner = sc.nextLine();
		if(scanner.equals("Y")) { return a2(); }
		else { return c(); }
	}
	void c(){
		System.out.println("데이트 코스는 미리 짜는게 편하다.");
		String scanner = sc.nextLine();
		if(scanner.equals("Y")){ return c1();}
		else{ return a2();}
	}
	void b(){
		System.out.println("감정기복이 크지 않다.");
		String scanner = sc.nextLine();
		if(scanner.equals("Y")){ return b1();}
		else{ return a3();}
	}
	void a2(){
		System.out.println("감정 표현에 솔직한 편이다.");
		String scanner = sc.nextLine();
		if(scanner.equals("Y")){ return a3(); }
		else{ return B(); }
	}
	void c1(){
		System.out.println("활동적인 데이트가 좋다.");
		String scanner = sc.nextLine();
		if(scanner.equals("Y")){}
	}
	
	
	
	
	
	
	void A(){
		System.out.println("A타입");
		System.out.println("서로에 대한 신뢰감이 깊고 존중해주는\n어른스러운 연애를 하는 타입!");
	}
	
	void B(){
		System.out.println("B타입");
		System.out.println("구속을 하는 것도, 받는 것도 싫은\n자유로운 연애를 하는 타입!");
	}
	
	
	String A3(String scanner){
		if(scanner == N){ C();}
		else return Test.A4(); 
	}
	
	String A4(String scanner){
		if(scanner == Y){ D();}
		else if(scanner == N){C();}
		
	}
	
	
	
	void C(){
		System.out.println("C타입");
		System.out.println("이것은 의리인가 사랑인가...\n친구같이 편안한 연애를 하는 타입!");
	}
	
	void D(){
		System.out.println("D타입");
		System.out.println("무조건 잘해주고, 무조건 맞춰주는\n다 퍼주는 연애를 하는 타입!");
	}
	
}
