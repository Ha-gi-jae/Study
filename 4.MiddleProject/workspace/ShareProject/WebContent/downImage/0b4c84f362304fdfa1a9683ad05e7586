package kr.or.ddit.basic;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class Tulips {
	public static void main(String[] args) throws IOException {
		String path="d:/D_Other/가구1.jpg";
		String path2="d:/D_Other/복사본_가구1.jpg";
		
		File inputs = new File(path);
		File outputs = new File(path2);
		
		try {
			FileInputStream fis = new FileInputStream(inputs);
			FileOutputStream fos = new FileOutputStream(outputs);
			
			int check;
			
			try {
				while((check=fis.read())!=-1){
					fos.write(check);
				}
				System.out.println("파일복사 완료!!!");
			} catch (IOException e) {
				e.printStackTrace();
			}finally {
				fis.close();
				fos.close();
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
	}
}
