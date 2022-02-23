package study;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Generic {
	public static void main(String[] args) {
		Zoo<Animal> gijaeZoo = new Zoo<>("기재네동물원", 5);
		gijaeZoo.add(new Animal("코끼리"));
		gijaeZoo.add(new Fox("사막여우"));
		gijaeZoo.add(new Tiger("빨간호랑이"));
		gijaeZoo.add(new Dog("냐옹냐옹"));
		listCourseInfo(gijaeZoo);
		listCourseInfo(new Zoo<>("사막여우", 3));
	}

	private static void listCourseInfo(Zoo<?> gijaeZoo) {
		System.out.println(gijaeZoo.getName() + " 동물 : " + Arrays.toString(gijaeZoo.getCount()));
	}
}

class Animal{
	String name;
	
	public Animal(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "이름:" +name;
	}
}

class Cat extends Animal{
	
	public Cat(String name) {
		super(name);
	}
}

class Dog extends Animal{
	
	public Dog(String name) {
		super("바둑이");
	}
}

class Tiger extends Animal {
	public Tiger(String name) {
		super(name);
	}
}


class Fox extends Animal {
	public Fox(String name) {
		super(name);
	}
}

class Zoo<T>{
	private String name;
	private T[] count;
	
	public Zoo(String name, int capacity) {
		super();
		this.name = name;
		count =(T[])(new Object[capacity]);
	}
	
	public String getName(){
		return name;
	}
	public T[] getCount() {
		return count;
	}
	
	public void add(T t) {
		for(int i = 0; i < count.length; i++) {
			if(count[i] == null) {
				count[i] = t;
				break;
			}
		}
	}
	
	
}