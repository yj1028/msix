package com.msix.admin.notice.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msix.admin.notice.vo.NoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeDAO noticeDAO;
	
	 
	public void testBoardList() {
		
		List<NoticeVO> list = noticeDAO.boardList();
		for(NoticeVO out : list) {
			log.info(out);
		}
	}
	@Test
	public void testBoardInsert() {
		NoticeVO nvo = new NoticeVO();
		nvo.setN_title("제목");
		nvo.setN_content("내용");
		
		int count = noticeDAO.boardInsert(nvo);
		log.info("count : " +count);
	}
	
	public void testBoardDetail() {
		NoticeVO nvo = new NoticeVO();
		nvo.setN_no(2);
		
		noticeDAO.boardDetail(nvo);
		
	}
	
	public void testBoardUpdate() {
		NoticeVO nvo = new NoticeVO();
		nvo.setN_no(1);
		nvo.setN_title("제목 수정");
		nvo.setN_content("내용 수정");
		
		noticeDAO.boardUpdate(nvo);
	}
	
	public void testBoardDelete() {
		NoticeVO nvo = new NoticeVO();
		nvo.setN_no(1);
		
		noticeDAO.boardDelete(nvo);
	}
	
}
