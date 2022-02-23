package kr.or.ddit.scheduler;

import java.io.File;

import kr.or.ddit.service.spring.ScheduledBoardService;
import kr.or.ddit.service.spring.ScheduledNoticeService;
import kr.or.ddit.service.spring.ScheduledPdsService;

public class RemoveSummernoteImageScheduler {

	private ScheduledNoticeService noticeService;
	private ScheduledBoardService boardService;
	private ScheduledPdsService pdsService;
	private String filePath;
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public void setNoticeService(ScheduledNoticeService noticeService) {
		this.noticeService = noticeService;
	}
	public void setBoardService(ScheduledBoardService boardService) {
		this.boardService = boardService;
	}
	public void setPdsService(ScheduledPdsService pdsService) {
		this.pdsService = pdsService;
	}
	
	public void fileRemove() throws Exception{
		
		boolean existFile = false;
		
		File dir = new File(filePath);
		File[] files = dir.listFiles();
		
		if(files != null) for(File file:files) {
//			existFile = false; // 명시적
			existFile = existFile || (noticeService.getNoticeByImage(file.getName()) != null) || (boardService.getBoardByImage(file.getName()) != null) || (pdsService.getPdsByImage(file.getName()) != null);

			if(existFile) {
				System.out.println(file.getName() + "은 사용하는 파일입니다.");
				existFile = false;
				continue;
			}else {
				System.out.println(file.getName() + "은 사용하지 않습니다.");
				if(file.exists()) file.delete();
			}
		}
		
	}
	
}
