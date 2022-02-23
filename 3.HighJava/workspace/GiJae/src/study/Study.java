package study;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Study {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		Set hs1 = new HashSet<>();
		
		for(int i = 0 ; i < 6; i++) {
			hs1.add((int)(Math.random() * 45) + 1);
		}
		Iterator it = hs1.iterator();
		
		while(it.hasNext()) {
			System.out.print(it.next() +" ");
		}
	}

}
