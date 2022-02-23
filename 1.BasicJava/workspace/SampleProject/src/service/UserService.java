package service;

import java.util.HashMap;
import java.util.Map;

import util.ScanUtil;
import util.View;
import controller.Controller;
import dao.UserDao;

public class UserService {
	
	//싱글톤 패턴 (여러개 일 필요 없으니까.)
	private UserService(){}
	private static UserService instance;
	public static UserService getInstance(){
		if(instance == null){
			instance = new UserService();
		}
		return instance;
	}
	
	private UserDao userDao = UserDao.getInstance();
			
	
	public int join(){
		System.out.println("=========== 회원가입 ===========");
		System.out.print("아이디>");
		String userId = ScanUtil.nextLine();
		System.out.print("비밀번호>");
		String password = ScanUtil.nextLine();
		System.out.print("비밀번호 확인>");
		String password2 = ScanUtil.nextLine();
		if(password.equals(password2)){
			System.out.println("비밀번호 확인 완료");
		}else{
			System.out.println("회원가입 실패");
			System.out.println("비밀번호가 일치하지 않습니다.");
			System.out.println("다시 회원가입을 진행하십시오.");
			return View.JOIN;
		}
		
		System.out.print("이름>");
		String userName = ScanUtil.nextLine();
		//아이디 중복 확인 생략
		//비밀번호 확인 생략 - 2번입력
		//유효성 검사(정규표현식) 생략 실제로 할때는 해야함.
		
		Map<String, Object> param = new HashMap<>();
		param.put("USER_ID", userId);
		param.put("PASSWORD", password);
		param.put("USER_NAME", userName);
		
		int result = userDao.insertUser(param);
		
		if(0 < result){
			System.out.println("회원가입 성공");
		}		else{
			System.out.println("회원가입 실패");
		}
		
		return View.HOME;
		
	}

	public int login() {
		System.out.println("=========== 로그인 ============");
		System.out.print("아이디>");
		String userId = ScanUtil.nextLine();
		System.out.println("비밀번호>");
		String password = ScanUtil.nextLine();
		
		Map<String, Object> user = userDao.selectUser(userId, password);
		
		if(user == null){
			System.out.println("아이디 혹은 비밀번호를 잘못 입력하셨습니다.");
		}else{
			System.out.println("로그인 성공");
			Controller.LoginUser = user;
			return View.BOARD_LIST; //로그인성공했으니 게시판 목록으로 감.
		}
		
		return View.LOGIN;
	}
	
}
