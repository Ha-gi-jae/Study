package study;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Tulips {
	public static void main(String[] args) {
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			fis = new FileInputStream("d:/D_Other/Tulips.jpg");
			fos = new FileOutputStream("d:/D_Other/복사본_Tulips.jpg");
			
			int c;
			
			while((c = fis.read()) != -1) {
				fos.write(c);
			}			
			
			fis.close();
			fos.close();
			
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		
	}
}
