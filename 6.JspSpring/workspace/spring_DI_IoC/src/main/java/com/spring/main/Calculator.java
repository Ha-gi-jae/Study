package com.spring.main;

import com.spring.sub.Divide;
import com.spring.sub.Minus;
import com.spring.sub.Multiplex;
import com.spring.sub.Summation;

public class Calculator {

	private Summation summation;
	private Minus minus;
	private Multiplex multiplex;
	private Divide divide;
	
	public void setSummation(Summation summation) {
		this.summation = summation;
	}
	public void setMinus(Minus minus) {
		this.minus = minus;
	}
	public void setMultiplex(Multiplex multiplex) {
		this.multiplex = multiplex;
	}
	public void setDivide(Divide divide) {
		this.divide = divide;
	}
	
	public int sum(int a, int b) {
		return summation.sum(a, b);
	}
	
	public int sum(int a, int b, int c) {
		return summation.sum(a, b, c);
	}
	
	public int minus(int a, int b) {
		return minus.minus(a, b);
	}
	
	public int minus(int a, int b, int c) {
		return minus.minus(a, b, c);
	}
	
	public int multiplex(int a, int b) {
		return multiplex.multi(a, b);
	}
	
	public int multiplex(int a, int b, int c) {
		return multiplex.multi(a, b, c);
	}
	
	public int divide(int a, int b) {
		return divide.divide(a, b);
	}
	
	public int divide(int a, int b, int c) {
		return divide.divide(a, b, c);
	}
}
