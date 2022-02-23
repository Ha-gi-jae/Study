package service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import utill.ScanUtil;
import utill.View;
import controller.Controller;
import dao.CarDao;
import dao.FaqDao;
import dao.MasterDao;
import dao.NoticeDao;
import dao.QnaDao;
import dao.UserDao;

public class UserService {
	
	//싱글톤 패턴
		private UserService(){}
		private static UserService instance;
		public static UserService getInstance(){
			if(instance==null){
				instance= new UserService();
			}
			return instance;
		}
		
		private UserDao userdao =UserDao.getInstance();
		private MasterDao masterdao = MasterDao.getInstance();
		private CarService carservice=CarService.getInstance();
		private BoardService boardservice=BoardService.getInstance();
		private FaqDao faqdao=FaqDao.getInstance();
		private QnaDao qnadao=QnaDao.getInstance();
		private NoticeDao noticedao=NoticeDao.getInstance();
		private CarDao cardao=CarDao.getInstance();
		
		
		public int login() {
			System.out.println("---------로그인--------");
			System.out.print("아이디>");
			String id =ScanUtil.nextLine();
			System.out.print("비밀번호>");
			String pass= ScanUtil.nextLine();
			if(id.equals("admin")){
				Map<String, Object> master = masterdao.selectMaster(id,pass);
				System.out.println("로그인 성공");
				Controller.LoginMaster=master;
				return View.MASTER_MAIN;
			}
					
			Map<String, Object> user = userdao.selectUser(id,pass);
			if(user.get("USER_ID")!=null){
				System.out.println("로그인성공");
				Controller.LoginUser=user;
				return View.USER_MAIN;	
			}else{
				System.out.println("로그인실패");
			}
			return View.HOME;
			
			
		}
		
		public int join() {
			System.out.println("--------회원가입--------");
			System.out.print("아이디>");
			String id = ScanUtil.nextLine();
			System.out.print("비번>");
			String pass = ScanUtil.nextLine();
			System.out.print("이름>");
			String name = ScanUtil.nextLine();
			System.out.print("생년월일>");
			int birth = ScanUtil.nextInt();
			System.out.print("성별>");
			String gender = ScanUtil.nextLine();
			System.out.print("전화번호>");
			String tel= ScanUtil.nextLine();
			
			Map<String, Object> param = new HashMap<>();
			param.put("USER_ID", id);
			param.put("USER_PASS", pass);
			param.put("USER_NAME", name);
			param.put("USER_BIRTH", birth);
			param.put("USER_GENDER", gender);
			param.put("USER_TEL", tel);
			
			int result=userdao.insertUser(param);
			
			if(result>0){
				System.out.println("회원가입에 성공하셨습니다!!");
				Controller.LoginUser=param;
				return View.USER_MAIN;
			}else{
				System.out.println("회원가입 실패");
			}
			return View.HOME;
				
				
		}

		public int usermain() {
			carservice.scarlist();
			System.out.println("===============사용자메인===============");
			System.out.println("1.차량조회\t2.게시판\t3.내정보\t5.로그아웃");
			System.out.print(">");
			int input=ScanUtil.nextInt();
			switch (input) {
			case 1:
				return userReserv();
			case 2:
				return View.USERBOARD;
					
			case 3:
				return View.USERINFO;
			case 5:
				return View.HOME;
			}
			
			return View.USER_MAIN;
		}
		
		//사용자정보
		public int userinfo() {
			Map<String,Object> user=userdao.userinfo();
			Controller.LoginUser=user;//수정했을경우 현재상태를 수정된 로그인유저상태로바꿔줌
			System.out.println("==========내정보=========");
			System.out.println("이름>"+user.get("USER_NAME"));
			System.out.println("전화번호>"+user.get("USER_TEL"));
			System.out.println("1.수정\t2.회원탈퇴\t3.예약확인 및 반납\t0.돌아가기");
			System.out.print(">");
			int input=ScanUtil.nextInt();
			switch (input) {
			case 1:
				return View.USERUPDATE;//회원정보수정
			case 2:
				return userdelete();//회원탈퇴
			case 3:
				return userreservcheck();
			case 0:
				break;
			}
			return View.USER_MAIN;	
		}
			
		public int userreservcheck() {	
			SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
			System.out.println("=========예약 정보확인============");
			System.out.println("예약번호\t  차량번호\t     모델명");
			List<Map<String, Object>> selectres1 = userdao.selectres();
			for(Map<String, Object> selectres : selectres1){
				System.out.print("  " +selectres.get("RES_NO")+"\t");
				System.out.print(selectres.get("RES_CAR_NO")+"\t");
				System.out.println("     "+selectres.get("CAR_MNAME"));
			}
			System.out.println("==============================");
			System.out.println("1.상세보기\t2.이력보기\t0.돌아가기");
			int input = ScanUtil.nextInt();
			//상세보기
			if(input == 1){
				System.out.println("예약번호 입력>");
				int resno = ScanUtil.nextInt();
				Map<String, Object> check = userdao.rescheck(resno);
				System.out.println("=========예약 상세보기==============");
				System.out.println("예약번호 : " + check.get("RES_NO"));
				System.out.println("차량번호 : " + check.get("CAR_NO"));
				System.out.println("모델명 : " + check.get("CAR_MNAME"));
				System.out.println("인수일 : " + format.format(check.get("RES_INSU"))+ " " + check.get("RES_TIME") + "시");
				System.out.println("반납일 : " + format.format(check.get("RES_RBAN"))+ " " + check.get("RES_TIME") + "시");
				System.out.println("결제금액 : " + check.get("RES_PRICE"));
				System.out.println("===================================");
				System.out.println("1.반납\t0.돌아가기");
				int input2 = ScanUtil.nextInt();
				if(input2 == 1){
					//추가금 결제 + 반납
					System.out.println("실제반납년월 입력>");
					int banyear = ScanUtil.nextInt();
					System.out.println("실제반납시간 입력>");
					int bantime = ScanUtil.nextInt();
					Map<String, Object> payment = userdao.payment(resno, banyear, bantime);
					if(payment.get("PAYMENT") != null ){
						System.out.println("추가결제금액 : " + payment.get("PAYMENT"));
						System.out.println("결제하기(y), 취소(n) >");
						String paymentcheck = ScanUtil.nextLine();
						if(paymentcheck.equals("y")){
							userdao.updatepayment(resno,banyear, bantime, payment);
							System.out.println("결제 및 반납이 완료되었습니다.");
							System.out.println("감사합니다.");
							return View.USER_MAIN;
						}
						else{
							System.out.println("취소되었습니다.");
							return View.USERRESERVCHECK;
						}
					}			
 				}
				//상세보기에서 돌아가기
				else{
					return View.USERRESERVCHECK;
				}
			}
			//과거 이력보기
			else if(input == 2) {
				System.out.println("=======과거 이력보기========");
				System.out.println("예약번호\t  차량번호\t     모델명");
				List<Map<String, Object>> pasthistory1 = userdao.pasthistory();
				for(Map<String, Object> pasthistory : pasthistory1){
					System.out.print("  " +pasthistory.get("RES_NO")+"\t");
					System.out.print(pasthistory.get("RES_CAR_NO")+"\t");
					System.out.println("     "+pasthistory.get("CAR_MNAME"));
				}
				System.out.println("==============================");
				System.out.println("1.상세보기\t0.돌아가기");
				int history = ScanUtil.nextInt();
				if(history == 1){
					System.out.println("예약번호 입력>");
					int resno = ScanUtil.nextInt();
					Map<String, Object> check = userdao.historycheck(resno);
					System.out.println("==========과거이력 상세보기==============");
					System.out.println("예약번호 : " + check.get("RES_NO"));
					System.out.println("차량번호 : " + check.get("CAR_NO"));
					System.out.println("모델명 : " + check.get("CAR_MNAME"));
					System.out.println("인수일 : " + format.format(check.get("RES_INSU"))+" "+ check.get("RES_TIME") + "시");
					System.out.println("반납일 : " + format.format(check.get("RES_RBAN"))+" "+ check.get("RES_RTIME") + "시");
					System.out.println("결제금액 : " + check.get("PRICE"));
					System.out.println("===================================");
					System.out.println("0.돌아가기");
					int history1 = ScanUtil.nextInt();
					if(history1 == 0){
						return View.USERRESERVCHECK;
					}
					
				}
			}
			
			//예약현황에서 돌아가기
			else{
				return View.USER_MAIN;
			}
			return userreservcheck();
		}

		//회원탈되
		private int userdelete() {
			System.out.print("아이디>");
			String id=ScanUtil.nextLine();
			System.out.print("비번>");
			String pass=ScanUtil.nextLine();
			int result=userdao.userdelete(id,pass);
			if(result>0){
				System.out.println("회원탈퇴성공");
				return View.HOME;
			}else{
				System.out.println("회원탈퇴실패");
			}
			return View.HOME;
			
		}

		//사용자정보수정
		public int userupdate() {
			System.out.print("아이디>");
			String id=ScanUtil.nextLine();
			System.out.print("비번>");
			String pass=ScanUtil.nextLine();
			System.out.print("전화번호>");
			String tel=ScanUtil.nextLine();
			int result=userdao.userupdate(id,pass,tel);
			if(result>0){
				System.out.println("수정성공");
				//아이디값을 참조해서 유저네임을 불러오기때문에 정보창에 이름이 보여지기
                //위해서는 현재 유저아이디에 수정된 아이디를 삽입시켜줘야한다.
				Controller.LoginUser.put("USER_ID",id);
			}else{
				System.out.println("수정실패");
			}
			return View.USERINFO;
				
		}

		//사용자 게시판
		public int userboard() {
			System.out.println("1.Q&A\t2.FAQ\t3.공지사항\t0.돌아가기");
			System.out.print(">");
			int input=ScanUtil.nextInt();
			switch (input) {
			case 1:
				return View.USERQNA;
				
			case 2:
				return View.USERFAQ;
				
			case 3:
				return View.USERNOTICE;
			case 0:
				
				return View.USER_MAIN;
			}
			return userboard();
		}
		
		
		//사용자계정공지사항
		public int usernotice() {
			List<Map<String,Object>> noti=noticedao.noticelist();
			System.out.println("===============NOTICE==================");
			System.out.println("게시글번호\t제목\t작성자\t작성일자");
			for(Map<String,Object>notili:noti){
				System.out.println(notili.get("NOTICE_NO")+"\t"+
				           notili.get("NOTICE_TITLE")+"\t"+
				           notili.get("NAME")+"\t"+
				           notili.get("NOTICE_DATE"));
			}
			System.out.println("======================================");
			System.out.println("1.조회\t2.돌아가기");
			System.out.print(">");
			int input=ScanUtil.nextInt();
			switch (input) {
			case 1:
				System.out.println("조회할 게시글 번호를 눌러주세요");
				System.out.print(">");
				int check=ScanUtil.nextInt();
				Map<String,Object> noticon=noticedao.noticeselect(check);
				System.out.println("게시글번호>"+noticon.get("NOTICE_NO"));
				System.out.println("게시글제목>"+noticon.get("NOTICE_TITLE"));
				System.out.println("게시글내용>"+noticon.get("NOTICE_CONTENT"));
				System.out.println("작성일자>"+noticon.get("NOTICE_DATE"));
				System.out.println("--------------------------------------");
				System.out.println("돌아가기(0)>");
				int back=ScanUtil.nextInt();
				if(back==0){
					return View.USERNOTICE;
				}
			case 2:
				return View.USERBOARD;
			}
			return usernotice();
		}

		//사용자계정faq리스트
		public int userfaq() {
			List<Map<String,Object>> faq=faqdao.faqlist();
			System.out.println("===============FAQ==================");
			System.out.println("게시글번호\t제목\t작성자\t작성일자");
			for(Map<String,Object> faqli:faq){
				System.out.println(faqli.get("FAQ_NO")+"\t"+
				           faqli.get("FAQ_TITLE")+"\t"+
				           faqli.get("NAME")+"\t"+
				           faqli.get("FAQ_DATE"));
			}
			System.out.println("====================================");
			System.out.println("1.조회\t2.돌아가기");
			System.out.print(">");
			int input=ScanUtil.nextInt();
			switch (input) {
			case 1:
				System.out.println("조회할 게시글 번호를 눌러주세요");
				System.out.print(">");
				int check=ScanUtil.nextInt();
				Map<String,Object> faqcon=faqdao.faqselect(check);
				System.out.println("게시글번호>"+faqcon.get("FAQ_NO"));
				System.out.println("게시글제목>"+faqcon.get("FAQ_TITLE"));
				System.out.println("게시글내용>"+faqcon.get("FAQ_CONTENT"));
				System.out.println("작성일자>"+faqcon.get("FAQ_DATE"));
				System.out.println("--------------------------------------");
				System.out.print("돌아가기(0)>");
				int back=ScanUtil.nextInt();
				if(back==0){
					return View.USERFAQ;
				}
			case 2:
				return View.USERBOARD;
			}
			return userfaq();
		}
		
		
		
		
		//사용자계정qna리스트
		public int userqna() {
			boardservice.qnalist();
			System.out.println("1.조회\t2.등록\t0.돌아가기");
			System.out.print(">");
			int input=ScanUtil.nextInt();
			switch (input) {
			case 1:
				System.out.println("조회하실게시글 번호를 입력해주세요.");
				System.out.print(">");
				int check=ScanUtil.nextInt();
				boardservice.usqnarelist(check);
				return View.USERQNA;

			case 2:
				System.out.print("제목>");
				String title=ScanUtil.nextLine();
				System.out.print("내용>");
				String content=ScanUtil.nextLine();
				int result=qnadao.qnainsert(title,content);
				if(result>0){
					System.out.println("등록완료");
				}else{
					System.out.println("등록실패");
				}
				return View.USERQNA;
			case 0:
				return View.USERBOARD;
			}
			return userqna();
			
		}


		//사용자예약
		public int userReserv() {
			System.out.println("1.소형\t2.준중형\t3.준대형\t4.대형\t0.돌아가기");
			int num=ScanUtil.nextInt();
			switch (num) {
			case 1:
			  return screserv();
			case 2:
			  return mcreserv();
			case 3:
			  return lcreserv();
			case 4:
			  return xlcreserv();
			case 0:
				return View.USER_MAIN;
				
			}
			return userReserv();
		}
		
		
		
		
		
		
		public int xlcreserv() {
			carservice.xlcarlist();
			System.out.println("1.예약  2.소형  3.준중형  4.준대형  0.돌아가기");
			System.out.print(">");
			int check = ScanUtil.nextInt();
			switch (check) {
			case 1:
				System.out.println("예약할 차량번호를 입력해주세요");
				System.out.println(">");
				int select=ScanUtil.nextInt();
				Map<String, Object> carimfo = cardao.carimport(select);
				System.out.println("번호>" + carimfo.get("CAR_COUNT"));
				System.out.println("모델형>" + carimfo.get("CAR_MNO"));
				System.out.println("모델명>" + carimfo.get("CAR_MNAME"));
				System.out.println("차량번호>"+carimfo.get("CAR_NO"));
				if(carimfo.get("CAR_AIR").equals("y ")){
					System.out.println("옵션>에어백");
				}
				if(carimfo.get("CAR_SUN").equals("y ")){
					System.out.println("옵션>선루프");
				}
				if(carimfo.get("CAR_BACK").equals("y ")){
					System.out.println("옵션>후방카메라");
				}
				if(carimfo.get("CAR_NAVI").equals("y ")){
					System.out.println("옵션>내비게이션");
				}
				if(carimfo.get("CAR_NSMOKE").equals("y ")){
					System.out.println("옵션>금연차량");
				}
				if(carimfo.get("CAR_OPEN").equals("y ")){
					System.out.println("옵션>오픈카");
				}
				System.out.println("연료>"+carimfo.get("CAR_FUEL"));
				System.out.println("인승>"+carimfo.get("CAR_PEO"));
				System.out.println("시간당차량금액>"+carimfo.get("CAR_PRICE"));
				System.out.print("예약하시겠습니까(y/n)>");
				String eng = ScanUtil.nextLine();
				if(eng.equals("y")){
			        System.out.println("예약날짜를 입력해주세요.");
			 		System.out.print("예약년월일>");
			 		String year = ScanUtil.nextLine();
			 		System.out.print("인수시간>");
			 		int time = ScanUtil.nextInt();
			 		System.out.print("반납년월>");
			 		String banyear = ScanUtil.nextLine();

			 		Map<String, Object> carpare = cardao.carcompare(year, carimfo);
			 		Map<String, Object> carpare1 = cardao.carcompare1(banyear,  carimfo);	
			 		if (carpare== null) {
			 			if(carpare1== null){
			 			int result = cardao.carinsu(year, banyear, carimfo, time);
			 			Map<String,Object> resno=cardao.insuselect(year, carimfo);
			 			if (result > 0) {
			 				Map<String,Object> userprice=userdao.userpayment(carimfo);
			 				System.out.println("결제 금액 : " + userprice.get("PRICE"));
							System.out.print("결제하기(y), 취소(n) >");
							String input1=ScanUtil.nextLine();
							if(input1.equals("y")){
								int result2 = cardao.carprice(carimfo);
								if (result2 > 0) {
									System.out.println("예약이 완료되었습니다.");
									return View.USER_MAIN;	
							   }
			 				}else{
			 					int cancel=userdao.usercancel(resno);
			 					if(cancel>0){
			 						System.out.println("결제가 취소되었습니다.");
			 					}
			 				}
			 				
			 			}else {
			 				System.out.println("예약실패");
			 				return View.USERSCRESERV;
			 			}

			 		}else{
			 			System.out.println("예약실패");
			 			return View.USERSCRESERV;
			 		}
			 		
					}else{
						System.out.println("예약실패");
						return View.USERSCRESERV;
					}
					
			}else{
				return View.USERSCRESERV;
			}

			case 2:
				return screserv();
			case 3:
				return mcreserv();
			case 4:
				return lcreserv();
			case 0:
				return View.USER_MAIN;		
		}
							
			return xlcreserv();
			
		}	
		

		//준대형차예약
		public int lcreserv() {
			carservice.lcarlist();
			System.out.println("1.예약  2.소형  3.준중형  4.대형  0.돌아가기");
			System.out.print(">");
			int check = ScanUtil.nextInt();
			switch (check) {
			case 1:
				System.out.println("예약할 차량번호를 입력해주세요");
				System.out.println(">");
				int select=ScanUtil.nextInt();
				Map<String, Object> carimfo = cardao.carimport(select);
				System.out.println("번호>" + carimfo.get("CAR_COUNT"));
				System.out.println("모델형>" + carimfo.get("CAR_MNO"));
				System.out.println("모델명>" + carimfo.get("CAR_MNAME"));
				System.out.println("차량번호>"+carimfo.get("CAR_NO"));
				if(carimfo.get("CAR_AIR").equals("y ")){
					System.out.println("옵션>에어백");
				}
				if(carimfo.get("CAR_SUN").equals("y ")){
					System.out.println("옵션>선루프");
				}
				if(carimfo.get("CAR_BACK").equals("y ")){
					System.out.println("옵션>후방카메라");
				}
				if(carimfo.get("CAR_NAVI").equals("y ")){
					System.out.println("옵션>내비게이션");
				}
				if(carimfo.get("CAR_NSMOKE").equals("y ")){
					System.out.println("옵션>금연차량");
				}
				if(carimfo.get("CAR_OPEN").equals("y ")){
					System.out.println("옵션>오픈카");
				}
				System.out.println("연료>"+carimfo.get("CAR_FUEL"));
				System.out.println("인승>"+carimfo.get("CAR_PEO"));
				System.out.println("시간당차량금액>"+carimfo.get("CAR_PRICE"));
				System.out.print("예약하시겠습니까(y/n)>");
				String eng = ScanUtil.nextLine();
				if(eng.equals("y")){
			        System.out.println("예약날짜를 입력해주세요.");
			 		System.out.print("예약년월일>");
			 		String year = ScanUtil.nextLine();
			 		System.out.print("인수시간>");
			 		int time = ScanUtil.nextInt();
			 		System.out.print("반납년월>");
			 		String banyear = ScanUtil.nextLine();

			 		Map<String, Object> carpare = cardao.carcompare(year, carimfo);
			 		Map<String, Object> carpare1 = cardao.carcompare1(banyear,  carimfo);	
			 		if (carpare== null) {
			 			if(carpare1== null){
			 			int result = cardao.carinsu(year, banyear, carimfo, time);
			 			Map<String,Object> resno=cardao.insuselect(year, carimfo);
			 			if (result > 0) {
			 				Map<String,Object> userprice=userdao.userpayment(carimfo);
			 				System.out.println("결제 금액 : " + userprice.get("PRICE"));
							System.out.print("결제하기(y), 취소(n) >");
							String input1=ScanUtil.nextLine();
							if(input1.equals("y")){
								int result2 = cardao.carprice(carimfo);
								if (result2 > 0) {
									System.out.println("예약이 완료되었습니다.");
									return View.USER_MAIN;	
							   }
			 				}else{
			 					int cancel=userdao.usercancel(resno);
			 					if(cancel>0){
			 						System.out.println("결제가 취소되었습니다.");
			 					}
			 				}
			 				
			 			}else {
			 				System.out.println("예약실패");
			 				return View.USERLCRESERV;
			 			}

			 		}else{
			 			System.out.println("예약실패");
			 			return View.USERLCRESERV;
			 		}
			 		
					}else{
						System.out.println("예약실패");
						return View.USERLCRESERV;
					}
					
			}else{
				return View.USERLCRESERV;
			}

			case 2:
				return screserv();
			case 3:
				return mcreserv();
			case 4:
				return xlcreserv();
			case 0:
				return View.USER_MAIN;		
		}
							
			return lcreserv();
		}
		

		
		
		//준준형차예약
		public int mcreserv() {
			carservice.mcarlist();
			System.out.println("1.예약  2.소형  3.준대형  4.대형  0.돌아가기");
			System.out.print(">");
			int check = ScanUtil.nextInt();
			switch (check) {
			case 1:
				System.out.println("예약할 차량번호를 입력해주세요");
				System.out.println(">");
				int select=ScanUtil.nextInt();
				Map<String, Object> carimfo = cardao.carimport(select);
				System.out.println("번호>" + carimfo.get("CAR_COUNT"));
				System.out.println("모델형>" + carimfo.get("CAR_MNO"));
				System.out.println("모델명>" + carimfo.get("CAR_MNAME"));
				System.out.println("차량번호>"+carimfo.get("CAR_NO"));
				if(carimfo.get("CAR_AIR").equals("y ")){
					System.out.println("옵션>에어백");
				}
				if(carimfo.get("CAR_SUN").equals("y ")){
					System.out.println("옵션>선루프");
				}
				if(carimfo.get("CAR_BACK").equals("y ")){
					System.out.println("옵션>후방카메라");
				}
				if(carimfo.get("CAR_NAVI").equals("y ")){
					System.out.println("옵션>내비게이션");
				}
				if(carimfo.get("CAR_NSMOKE").equals("y ")){
					System.out.println("옵션>금연차량");
				}
				if(carimfo.get("CAR_OPEN").equals("y ")){
					System.out.println("옵션>오픈카");
				}
				System.out.println("연료>"+carimfo.get("CAR_FUEL"));
				System.out.println("인승>"+carimfo.get("CAR_PEO"));
				System.out.println("시간당차량금액>"+carimfo.get("CAR_PRICE"));
				System.out.print("예약하시겠습니까(y/n)>");
				String eng = ScanUtil.nextLine();
				if(eng.equals("y")){
			        System.out.println("예약날짜를 입력해주세요.");
			 		System.out.print("예약년월일>");
			 		String year = ScanUtil.nextLine();
			 		System.out.print("인수시간>");
			 		int time = ScanUtil.nextInt();
			 		System.out.print("반납년월>");
			 		String banyear = ScanUtil.nextLine();

			 		Map<String, Object> carpare = cardao.carcompare(year, carimfo);
			 		Map<String, Object> carpare1 = cardao.carcompare1(banyear,  carimfo);	
			 		if (carpare== null) {
			 			if(carpare1== null){
			 			int result = cardao.carinsu(year, banyear, carimfo, time);
			 			Map<String,Object> resno=cardao.insuselect(year, carimfo);
			 			if (result > 0) {
			 				Map<String,Object> userprice=userdao.userpayment(carimfo);
			 				System.out.println("결제 금액 : " + userprice.get("PRICE"));
							System.out.print("결제하기(y), 취소(n) >");
							String input1=ScanUtil.nextLine();
							if(input1.equals("y")){
								int result2 = cardao.carprice(carimfo);
								if (result2 > 0) {
									System.out.println("예약이 완료되었습니다.");
									return View.USER_MAIN;	
							   }
			 				}else{
			 					int cancel=userdao.usercancel(resno);
			 					if(cancel>0){
			 						System.out.println("결제가 취소되었습니다.");
			 					}
			 				}
			 				
			 			}else {
			 				System.out.println("예약실패");
			 				return View.USERMCRESERV;
			 			}

			 		}else{
			 			System.out.println("예약실패");
			 			return View.USERMCRESERV;
			 		}
			 		
					}else{
						System.out.println("예약실패");
						return View.USERMCRESERV;
					}
					
			}else{
				return View.USERMCRESERV;
			}

			case 2:
				return screserv();
			case 3:
				return lcreserv();
			case 4:
				return xlcreserv();
			case 0:
				return View.USER_MAIN;		
		}
							
			return mcreserv();
		}
		
		 
		
		
		
		//소형차예약
		public int screserv(){
			carservice.scarlist();
			System.out.println("1.예약  2.준중형  3.준대형  4.대형  0.돌아가기");
			System.out.print(">");
			int check = ScanUtil.nextInt();
			switch (check) {
			case 1:
				System.out.println("예약할 차량번호를 입력해주세요");
				System.out.println(">");
				int select=ScanUtil.nextInt();
				Map<String, Object> carimfo = cardao.carimport(select);
				System.out.println("번호>" + carimfo.get("CAR_COUNT"));
				System.out.println("모델형>" + carimfo.get("CAR_MNO"));
				System.out.println("모델명>" + carimfo.get("CAR_MNAME"));
				System.out.println("차량번호>"+carimfo.get("CAR_NO"));
				if(carimfo.get("CAR_AIR").equals("y ")){
					System.out.println("옵션>에어백");
				}
				if(carimfo.get("CAR_SUN").equals("y ")){
					System.out.println("옵션>선루프");
				}
				if(carimfo.get("CAR_BACK").equals("y ")){
					System.out.println("옵션>후방카메라");
				}
				if(carimfo.get("CAR_NAVI").equals("y ")){
					System.out.println("옵션>내비게이션");
				}
				if(carimfo.get("CAR_NSMOKE").equals("y ")){
					System.out.println("옵션>금연차량");
				}
				if(carimfo.get("CAR_OPEN").equals("y ")){
					System.out.println("옵션>오픈카");
				}
				System.out.println("연료>"+carimfo.get("CAR_FUEL"));
				System.out.println("인승>"+carimfo.get("CAR_PEO"));
				System.out.println("시간당차량금액>"+carimfo.get("CAR_PRICE"));
				System.out.print("예약하시겠습니까(y/n)>");
				String eng = ScanUtil.nextLine();
				if(eng.equals("y")){
			        System.out.println("예약날짜를 입력해주세요.");
			 		System.out.print("예약년월일>");
			 		String year = ScanUtil.nextLine();
			 		System.out.print("인수시간>");
			 		int time = ScanUtil.nextInt();
			 		System.out.print("반납년월>");
			 		String banyear = ScanUtil.nextLine();

			 		Map<String, Object> carpare = cardao.carcompare(year, carimfo);
			 		Map<String, Object> carpare1 = cardao.carcompare1(banyear,  carimfo);	
			 		if (carpare== null) {
			 			if(carpare1== null){
			 			int result = cardao.carinsu(year, banyear, carimfo, time);
			 			Map<String,Object> resno=cardao.insuselect(year, carimfo);
			 			if (result > 0) {
			 				Map<String,Object> userprice=userdao.userpayment(carimfo);
			 				System.out.println("결제 금액 : " + userprice.get("PRICE"));
							System.out.print("결제하기(y), 취소(n) >");
							String input1=ScanUtil.nextLine();
							if(input1.equals("y")){
								int result2 = cardao.carprice(carimfo);
								if (result2 > 0) {
									System.out.println("예약이 완료되었습니다.");
									return View.USER_MAIN;	
							   }
			 				}else{
			 					int cancel=userdao.usercancel(resno);
			 					if(cancel>0){
			 						System.out.println("결제가 취소되었습니다.");
			 					}
			 				}
			 				
			 			}else {
			 				System.out.println("예약실패");
			 				return View.USERSCRESERV;
			 			}

			 		}else{
			 			System.out.println("예약실패");
			 			return View.USERSCRESERV;
			 		}
			 		
					}else{
						System.out.println("예약실패");
						return View.USERSCRESERV;
					}
					
			}else{
				return View.USERSCRESERV;
			}

			case 2:
				return mcreserv();
			case 3:
				return lcreserv();
			case 4:
				return xlcreserv();
			case 0:
				return View.USER_MAIN;		
		}
							
			return screserv();
		}		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
