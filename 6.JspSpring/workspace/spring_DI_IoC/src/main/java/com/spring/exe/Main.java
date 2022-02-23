package com.spring.exe;

import com.spring.main.Calculator;
import com.spring.sub.Divide;
import com.spring.sub.DivideImpl;
import com.spring.sub.Minus;
import com.spring.sub.MinusImpl;
import com.spring.sub.Multiplex;
import com.spring.sub.MultiplexImpl;
import com.spring.sub.Summation;
import com.spring.sub.SummationImpl;

public class Main {

	private Calculator cal = new Calculator();
	
	{
		Summation sum = new SummationImpl();
		Minus min = new MinusImpl();
		Multiplex multi = new MultiplexImpl();
		Divide div = new DivideImpl();
	
		
		// Spring은 이 부분을 없애고 싶어.
		cal.setSummation(sum);
		cal.setMinus(min);
		cal.setMultiplex(multi);
		cal.setDivide(div);
		
	}
	
	
	
	public static void main(String[] args) {
		
		Main main = new Main();
		
		int a=4, b=2, c=1;
		
		System.out.println(main.cal.sum(a,b));
		System.out.println(main.cal.minus(a,b));
		System.out.println(main.cal.multiplex(a, b));
		System.out.println(main.cal.divide(a,b));
	}

}
