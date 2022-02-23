package com.spring.sub;

public class SummationImpl2 extends SummationImpl {

	@Override
	public int sum(int a, int b) {
		return super.sum(a, b)+10;
	}

	@Override
	public int sum(int a, int b, int c) {
		return super.sum(a, b, c)+10;
	}

	// 부모에서 구현한거 가져와서 + 10 더 해줌.
}
