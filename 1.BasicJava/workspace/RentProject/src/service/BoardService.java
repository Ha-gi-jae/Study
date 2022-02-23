package service;

import java.util.List;
import java.util.Map;

import utill.ScanUtil;
import utill.View;
import controller.Controller;
import dao.FaqDao;
import dao.NoticeDao;
import dao.QnaDao;

public class BoardService {
	
	private BoardService(){}
	private static BoardService instance;
	public static BoardService getInstance(){
		if(instance==null){
			instance= new BoardService();
		}
		return instance;
	}
	
	private QnaDao qnadao = QnaDao.getInstance();
	private FaqDao faqdao = FaqDao.getInstance();
	private NoticeDao noticedao = NoticeDao.getInstance();
	
	//비회원 게시판조회 기능 (faq랑 공지사항만 조회가능)
	public int unuser() {
		System.out.println("1.QNA\t2.FAQ\t3.공지사항\t0.돌아가기");
		int input=ScanUtil.nextInt();
		switch (input) {
		case 1:
			System.out.println("로그인이 필요합니다");
			return View.BOARD;
		case 2:
			return unfaqli();
		case 3:
			return unnotice();
		case 0:
			return View.HOME;
		}
		return unuser();
	}
	
	
	public int unfaqli() {
		System.out.println("================FAQ================");
		System.out.println("게시글번호\t제목\t작성자\t작성일자");
		List<Map<String,Object>>faqli=faqdao.faqlist();
		for(Map<String,Object>faq:faqli){
		System.out.println(faq.get("FAQ_NO")+"\t"+
			           faq.get("FAQ_TITLE")+"\t"+
			           faq.get("NAME")+"\t"+
			           faq.get("FAQ_DATE"));
		}
		System.out.println("===================================");
		System.out.println("1.조회\t2.돌아가기");
		int select=ScanUtil.nextInt();
		if(select==1){
			System.out.println("조회할 게시글 번호를 입력해주세요");
			System.out.print(">");
			int check=ScanUtil.nextInt();
			Map<String,Object>faqinfo=faqdao.faqselect(check);
			System.out.println("게시글번호>"+faqinfo.get("FAQ_NO"));
			System.out.println("게시글제목>"+faqinfo.get("FAQ_TITLE"));
			System.out.println("게시글내용>"+faqinfo.get("FAQ_CONTENT"));
			System.out.println("작성일자>"+faqinfo.get("FAQ_DATE"));
			System.out.print("돌아가기(0)>");
			int back=ScanUtil.nextInt();
			if(back==0){
				return View.UNFAQ;
			}
		}
		if(select==2){
			return View.BOARD;
		}
		
		return unfaqli();
	}
	
	public int unnotice(){
		System.out.println("================NOTICE================");
		System.out.println("게시글번호\t제목\t작성자\t작성일자");
		List<Map<String,Object>>notli=noticedao.noticelist();
		for(Map<String,Object>noli:notli){
		System.out.println(noli.get("NOTICE_NO")+"\t"+
			           noli.get("NOTICE_TITLE")+"\t"+
			           noli.get("NAME")+"\t"+
			           noli.get("NOTICE_DATE"));
		}
		System.out.println("===================================");
		System.out.println("1.조회\t2.돌아가기");
		int select=ScanUtil.nextInt();
		if(select==1){
			System.out.println("조회할 게시글 번호를 입력해주세요");
			System.out.print(">");
			int check=ScanUtil.nextInt();
			Map<String,Object>notiinfo=noticedao.noticeselect(check);
			System.out.println("게시글번호>"+notiinfo.get("NOTICE_NO"));
			System.out.println("게시글제목>"+notiinfo.get("NOTICE_TITLE"));
			System.out.println("게시글내용>"+notiinfo.get("NOTICE_CONTENT"));
			System.out.println("작성일자>"+notiinfo.get("NOTICE_DATE"));
			System.out.print("돌아가기(0)>");
			int back=ScanUtil.nextInt();
			if(back==0){
				return View.UNNOTICE;
			}
		}
		if(select==2){
			return View.BOARD;
		}
		
		return unnotice();
		
	}
	

	//qna게시글 보여주기
	public void qnalist() {
		List<Map<String,Object>> qna = qnadao.qnalist();
		System.out.println("================QNA================");
		System.out.println("게시글번호\t제목\t작성자\t작성일자");
		for(Map<String,Object> qnalist:qna){
			System.out.println(qnalist.get("QNA_NO")+"\t"+
					           qnalist.get("QNA_TITLE")+"\t"+
					           qnalist.get("QNA_USER_ID")+"\t"+
					           qnalist.get("QNA_CONTENT_DATE"));
		}
		System.out.println("===================================");
		
		
	}
	
	
	//마스터계정에서 조회할 qna게시글 상세정보
	public void qnarelist(int input) {
		Map<String,Object> list = qnadao.qnarelist(input);
		System.out.println("게시글번호>"+list.get("QNA_NO"));
		System.out.println("게시글제목>"+list.get("QNA_TITLE"));
		System.out.println("게시글내용>"+list.get("QNA_CONTENT"));
		System.out.println("작성일자>"+list.get("QNA_CONTENT_DATE"));
		if(list.get("QNA_COMMENT")==null){			
			System.out.println("답변>");
			System.out.println("답글을 다시겠습니까?(y/n)");
			System.out.print(">");
			String eng = ScanUtil.nextLine();
			if(eng.equals("y")){
				System.out.print("내용 :");
				String content = ScanUtil.nextLine();
				int result = qnadao.qnaans(list,content);
				if(result>0){
					System.out.println("답변등록 완료");
				}else{
					System.out.println("답변등록 실패");
				}
			}else if(eng.equals("n")){
				//return View.MASTER_MAIN;
			}
		}else if(list.get("QNA_COMMENT")!=null){
			System.out.println("답변>"+list.get("QNA_COMMENT"));
			
			
		}
		
		//return View.MASTER_MAIN;
	}

	//master계정faqlist보여주기
	public int faqlist() {
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
		System.out.println("1.조회\t2.등록\t3.돌아가기");
		int input = ScanUtil.nextInt();
		switch (input) {
		case 1:
			System.out.println("조회하실 게시글 번호를 입력해 주세요");
			System.out.print(">");
			int check=ScanUtil.nextInt();
			faqselect(check);
			return View.MASTER_FAQ;
		case 2:
			faqinsert();
			return View.MASTER_FAQ;
		case 3:
			return View.MASTER_MBOARD;
		}
		return faqlist();
	}


	private void faqinsert() {
		System.out.print("제목>");
		String title=ScanUtil.nextLine();
		System.out.print("내용>");
		String content=ScanUtil.nextLine();
		int result=faqdao.faqinsert(title,content);
		if(result>0){
			System.out.println("등록성공");
		}else{
			System.out.println("등록실패");
		}
		
	}


	private void faqselect(int check) {
		Map<String, Object> faq=faqdao.faqselect(check);
		System.out.println("게시글번호>"+faq.get("FAQ_NO"));
		System.out.println("게시글제목>"+faq.get("FAQ_TITLE"));
		System.out.println("게시글내용>"+faq.get("FAQ_CONTENT"));
		System.out.println("작성일자>"+faq.get("FAQ_DATE"));
		System.out.println("--------------------------------------");
		System.out.println("1.수정\t2.삭제\t3.돌아가기");
		System.out.print(">");
		int input=ScanUtil.nextInt();
		switch (input) {
		case 1:
			faqupdate(check);
			break;
		case 2:
			faqdelte(check);
			break;
		case 3:
			break;
		}
	}


	private void faqdelte(int check) {
		int result = faqdao.faqdelte(check);
		if(result>0){
			System.out.println("삭제성공");
		}else{
			System.out.println("삭제실패");
		}
		
	}


	private void faqupdate(int check) {
		System.out.print("제목>");
		String title=ScanUtil.nextLine();
		System.out.print("내용>");
		String content=ScanUtil.nextLine();
		int result=faqdao.faqupdate(title,content,check);
		if(result>0){
			System.out.println("수정성공");
		}else{
			System.out.println("수정실패");
		}
	}
	
	
	
	
	
	//NOTICElist보여주기
		public int noticelist() {
			List<Map<String,Object>> notice=noticedao.noticelist();
			System.out.println("===============NOTICE==================");
			System.out.println("게시글번호\t제목\t작성자\t작성일자");
			for(Map<String,Object> notili:notice){
				System.out.println(notili.get("NOTICE_NO")+"\t"+
				           notili.get("NOTICE_TITLE")+"\t"+
				           notili.get("NAME")+"\t"+
				           notili.get("NOTICE_DATE"));
			}
			System.out.println("=======================================");
			System.out.println("1.조회\t2.등록\t3.돌아가기");
			int input = ScanUtil.nextInt();
			switch (input) {
			case 1:
				System.out.println("조회하실 게시글 번호를 입력해 주세요");
				System.out.print(">");
				int check=ScanUtil.nextInt();
				noticeselect(check);
				return View.MASTER_NOTICE;
			case 2:
				noticeinsert();
				return View.MASTER_NOTICE;
			case 3:
				return View.MASTER_MBOARD;
			}
			return noticelist();
			
		}

		//notice등록
		private void noticeinsert() {
			System.out.print("제목>");
			String title=ScanUtil.nextLine();
			System.out.print("내용>");
			String content=ScanUtil.nextLine();
			int result=noticedao.noticeinsert(title,content);
			if(result>0){
				System.out.println("등록성공");
			}else{
				System.out.println("등록실패");
			}
			
		}

		//notice 상세정보
		private void noticeselect(int check) {
			Map<String, Object> noti=noticedao.noticeselect(check);
			System.out.println("게시글번호>"+noti.get("NOTICE_NO"));
			System.out.println("게시글제목>"+noti.get("NOTICE_TITLE"));
			System.out.println("게시글내용>"+noti.get("NOTICE_CONTENT"));
			System.out.println("작성일자>"+noti.get("NOTICE_DATE"));
			System.out.println("--------------------------------------");
			System.out.println("1.수정\t2.삭제\t3.돌아가기");
			System.out.print(">");
			int input=ScanUtil.nextInt();
			switch (input) {
			case 1:
				noticeupdate(check);
				break;
			case 2:
				noticedelte(check);
				break;
			case 3:
				break;
			}
		}

		//notice삭제
		private void noticedelte(int check) {
			int result = noticedao.noticedelte(check);
			if(result>0){
				System.out.println("삭제성공");
			}else{
				System.out.println("삭제실패");
			}
			
		}

		//notice수정
		private void noticeupdate(int check) {
			System.out.print("제목>");
			String title=ScanUtil.nextLine();
			System.out.print("내용>");
			String content=ScanUtil.nextLine();
			int result=noticedao.noticeupdate(title,content,check);
			if(result>0){
				System.out.println("수정성공");
			}else{
				System.out.println("수정실패");
			}
		}

		//유저계정에서 qna상세정보
		public int usqnarelist(int check) {
			Map<String,Object> list = qnadao.usqnarelist(check);
			System.out.println("게시글번호>"+list.get("QNA_NO"));
			System.out.println("게시글제목>"+list.get("QNA_TITLE"));
			System.out.println("게시글내용>"+list.get("QNA_CONTENT"));
			System.out.println("작성일자>"+list.get("QNA_CONTENT_DATE"));
			System.out.println("1.수정\t2.삭제\t3.돌아가기");
			System.out.print(">");
			int input=ScanUtil.nextInt();
			if(input==1){
				if(Controller.LoginUser.get("USER_ID").equals(list.get("QNA_USER_ID"))){
					System.out.print("제목>");
					String title=ScanUtil.nextLine();
					System.out.print("내용>");
					String content=ScanUtil.nextLine();
					int result=qnadao.qnaupdate(check, title, content);
					if(result>0){
						System.out.println("수정완료");
					}else{
						System.out.println("수정실패");
					}
				}else{
					System.out.println("본인계정게시글이 아닙니다.");
				}
			
			}else if(input==2){
				if(Controller.LoginUser.get("USER_ID").equals(list.get("QNA_USER_ID"))){
					int result=qnadao.qnadelete(check);
					if(result>0){
						System.out.println("삭제성공");
					}else{
						System.out.println("삭제실패");
					}
				}else{
					System.out.println("본인계정게시글이 아닙니다.");
				}
			}
			return View.USERQNA;
		}











		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
