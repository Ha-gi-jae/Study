package com.spring.sub;

public class DivideImpl2 extends DivideImpl {

	@Override
	public int divide(int a, int b) {
		return super.divide(a, b)/10;
	}

	@Override
	public int divide(int a, int b, int c) {
		return super.divide(a, b, c)/10;
	}
}
