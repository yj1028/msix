package com.msix.admin.board.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msix.admin.board.vo.RBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RBoardMapperTests {
	@Setter(onMethod_ = @Autowired )
	private RBoardDAO rboardDAO;
	
	@Test
	public void replyList(){
		List<RBoardVO> list = rboardDAO.replyList(1);
		for(RBoardVO out : list) {
			log.info(out);
		}
	}
	
	public void replyInsert() {
		RBoardVO rvo = new RBoardVO();
		rvo.setQ_no(1);
		rvo.setR_title("title");
		rvo.setR_content("content");
		rvo.setR_cnt(0);
		
		rboardDAO.replyInsert(rvo);
	}
	
	public void replyupdate() {
		RBoardVO rvo = new RBoardVO();
		rvo.setQ_no(1);
		rvo.setR_no(1);
		
		rboardDAO.replyupdate(rvo);
	}
	
	public void replyDelete() {
		rboardDAO.replyDelete(1);
	}
	
}
