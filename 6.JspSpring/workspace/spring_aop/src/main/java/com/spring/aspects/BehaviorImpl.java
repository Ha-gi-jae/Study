package com.spring.aspects;

public class BehaviorImpl implements Behavior {

	@Override
	public void 잠자기() {
		System.out.println("쿨쿨~~ 잠을 잡니다.");
	}

	@Override
	public void 공부하기() {
		System.out.println("열심히 공부를 합니다.");
	}

	@Override
	public void 밥먹기() {
		System.out.println("냠냠..쩝쩝...다 흘리고 먹어요...");
	}

	@Override
	public void 데이트() {
		System.out.println("데이트 ~ 데이트~ 데이트~");
	}

	@Override
	public void 운동() {
		System.out.println("헉... 헉.. 하나만 더!!!!");
	}

	@Override
	public void 놀기() {
		System.out.println("노는중... 놀기 놀기 노는중....");
	}

	@Override
	public void 정신수양() {
		System.out.println("명상중.... 명상 명상 ... 명상중...");
	}

}
