package com.java.main;

import java.util.Scanner;

public class EchoMain {

	public static void main(String[] args) {
		
		// 콘솔에서 받은거 콘솔에 그대로 출력
		Scanner scan = new Scanner(System.in);
		
		String inputStr = scan.nextLine();
		
		System.out.println(inputStr);

	}

}
