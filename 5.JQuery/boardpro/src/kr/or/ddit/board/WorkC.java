package kr.or.ddit.board;

public class WorkC {

	public static void main(String[] args) {
//		System.out.println("안녕");
		String id = "asdf";
		String encriptedPassword = Sha2Crypt.sha256Crypt(id.getBytes());
//		
		String ScriptedPassword = Sha2Crypt.sha256Crypt(id.getBytes(), "$5$" + id);
//	
		System.out.println(ScriptedPassword);
	}
	
}
