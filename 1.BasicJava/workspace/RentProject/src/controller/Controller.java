package controller;

import java.util.Map;

import service.BoardService;
import service.CarService;
import service.MasterService;
import service.UserService;
import utill.ScanUtil;
import utill.View;

public class Controller {

	public static void main(String[] args) {
		new Controller().start();

	}
	public static Map<String, Object> LoginUser;
	
	public static Map<String, Object> LoginMaster;
	
	private UserService userservice = UserService.getInstance();
	private MasterService masterservice = MasterService.getInstance();
	private CarService carservice =CarService.getInstance();
	private BoardService boardservice=BoardService.getInstance();
	public void start() {
		int view=View.HOME;
		
		while(true){
			switch(view){
			//비회원
			case View.HOME: view =home(); break;
			case View.LOGIN: view =userservice.login(); break;
			case View.JOIN: view = userservice.join(); break; 
			case View.CAR_LIST:view = carservice.carselect(); break; 
			case View.BOARD:view=boardservice.unuser();break;
			case View.UNFAQ:view=boardservice.unfaqli();break;
			case View.UNNOTICE:view=boardservice.unnotice();break;
			case View.SCAR_LIST: view=carservice.unusersclist();break;
			case View.MCAR_LIST: view=carservice.unusermclist();break;
			case View.LCAR_LIST: view=carservice.unuserlclist();break;
			case View.XLCAR_LIST: view=carservice.unuserxlclist();break;
			
			//사용자메인화면
			case View.USER_MAIN:view=userservice.usermain();break;
			//사용자개인정보화면
			case View.USERINFO: view = userservice.userinfo(); break;
			//사용자qna화면
			case View.USERQNA: view=userservice.userqna(); break;
			//사용자faq화면
			case View.USERFAQ: view=userservice.userfaq(); break;
			//사용자게시판화면
			case View.USERBOARD: view=userservice.userboard();break;
			//사용자공지사항화면
			case View.USERNOTICE: view=userservice.usernotice();break;
			//사용자정보수정화면
			case View.USERUPDATE: view=userservice.userupdate();break;
			//사용자 예약 메인화면
			case View.USERRESERV: view=userservice.userReserv();break;
			//사용자소형차예약
			case View.USERSCRESERV: view=userservice.screserv();break;
			//사용자준중형차예약
			case View.USERMCRESERV: view=userservice.mcreserv();break;
			//사용차준대형차예약
			case View.USERLCRESERV: view=userservice.lcreserv();break;
			//사용자대형차예약
			case View.USERXLCRESERV: view=userservice.xlcreserv();break;
			//사용자예약내역확인및반납
			case View.USERRESERVCHECK: view=userservice.userreservcheck();break;
			//사업자화면
			case View.MASTER_MAIN: view = masterservice.mastermain(); break;
			case View.MASTER_QNA: view = masterservice.mqna(); break;
			case View.MASTER_MBOARD: view= masterservice.mboard(); break;
			case View.MASTER_FAQ: view= masterservice.mfaq(); break;
			case View.MASTER_NOTICE: view=masterservice.mnotice(); break;
			case View.MASTER_MCARLIST: view=masterservice.mcarlist(); break;
			case View.MASTER_MCARSELECT: view=masterservice.carselect();break;
			case View.MASTER_SCARLIST: view=masterservice.masterscarlist();break;
			case View.MASTER_MIDCARLIST: view=masterservice.mastermidcarlist();break;
			case View.MASTER_LCARLIST: view=masterservice.masterlcarlist();break;
			case View.MASTER_XLCARLIST: view=masterservice.masterxlcarlist();break;
			case View.MASTER_CARDELETE: view=masterservice.cardelete();break;
			case View.MASTER_SCARDELETE: view=masterservice.scardelete();break;
			case View.MASTER_MCARDELETE: view=masterservice.mcardelete();break;
			case View.MASTER_LCARDELETE: view=masterservice.lcardelete();break;
			case View.MASTER_XLCARDELETE: view=masterservice.xlcardelete();break;
			
			}
		}
		
	}

	private int home() {
		carservice.scarlist();
		System.out.println("-----------------------------------------------");
		System.out.println("1.차량조회  2.게시판조회  3.로그인  4.회원가입  0.프로그램종료");
		System.out.println("-----------------------------------------------");
		System.out.print("번호입력>");
		int input = ScanUtil.nextInt();
		switch (input) {
		case 1:
			return View.CAR_LIST;
		case 2:
			return View.BOARD;
		case 3:
			return View.LOGIN;
		case 4:
			return View.JOIN;

		case 0:
			System.out.println("프로그램을 종료합니다.");
			System.exit(0);
		}
		return View.HOME;
	}

}
