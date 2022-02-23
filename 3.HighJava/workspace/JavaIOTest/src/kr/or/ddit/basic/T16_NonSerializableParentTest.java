package kr.or.ddit.basic;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class T16_NonSerializableParentTest {
/*
	부모클래스가 Serializable 인터페이스를 구현하고 있지 않을 경우
	부모객체의 필드값 처리 방법 
	
	1. 부모클래스가 Serializable 인터페이스를 구현하도록 해야 한다.
	2. 자식 클래스에 writeObject()와 readObject()메서드를 이용하여 부모객체의 필드값을 처리할 수 있도록 직접 구현한다.
*/
	public static void main(String[] args) throws IOException, ClassNotFoundException {
		
		FileOutputStream fos = new FileOutputStream("d:/D_Other/nonSerializableTest.bin");
		
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		
		Child child = new Child();
		child.setParentName("부모");
		child.setChildName("자식");
		oos.writeObject(child); // 직렬화
		oos.flush(); // 생략가능
		oos.close();
		fos.close(); // 생략가능
		
		FileInputStream fis = new FileInputStream("d:/D_Other/nonSerializableTest.bin");
		
		ObjectInputStream ois = new ObjectInputStream(fis);
		Child child2 = (Child) ois.readObject(); // 역직렬화
		System.out.println("부모이름 : " + child2.getParentName());
		System.out.println("자식이름 : " + child2.getChildName());
		ois.close();
		fis.close();
		
	}
}

// 부모 클래스
class Parent{
	private String parentName;

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
}

// 자식 클래스

class Child extends Parent implements Serializable {
	private String childName;

	public String getChildName() {
		return childName;
	}

	public void setChildName(String childName) {
		this.childName = childName;
	}
	
	/**
	 * 직렬화 될 때 자동으로 호출됨.
	 * (접근제한자가 private이 아니면 자동 호출되지 않음.)
	 * @param oos
	 * @throws IOException
	 */
	
	private void writeObject(ObjectOutputStream oos) throws IOException {
		
		oos.writeUTF(getParentName()); // 부모객체 필드값 저장
		oos.defaultWriteObject();
	}
	
	/**
	 * 역직렬화 될 때 자동으로 호출됨.
	 * (접근 제한자가 private이 아니면 자동 호출되지 않음.)
	 * @param ois
	 * @throws IOException
	 * @throws ClassNotFoundException
	 */
	private void readObject(ObjectInputStream ois) throws IOException, ClassNotFoundException{
		
		setParentName(ois.readUTF()); // 부모객체 필드값 읽어서 설정
		// 부모 값 수정하려고.
		ois.defaultReadObject();
	}
}










