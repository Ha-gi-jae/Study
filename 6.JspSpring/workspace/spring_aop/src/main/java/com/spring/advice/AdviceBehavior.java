package com.spring.advice;

import org.aspectj.lang.ProceedingJoinPoint;

public class AdviceBehavior {

	public void chikachika() {
		System.out.println("열심히 양치질을 합니다.");
	}

	public void chikachikaAround(ProceedingJoinPoint joinPoint) throws Throwable{
		System.out.println("데이트 전 양치... 취카취카...");

		joinPoint.proceed();

		System.out.println("데이트 후 양치... 취카취카ㅋ.");
	}
}
