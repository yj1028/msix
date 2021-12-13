package com.msix.admin.board.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msix.admin.board.vo.AQBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QBoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private QBoardDAO qboardDAO;
	
	@Test
	public void testBoardList() {
		AQBoardVO qvo = new AQBoardVO();
		
		qvo.setPageNum(1);
		qvo.setAmount(10);
		
		List<AQBoardVO> list = qboardDAO.boardList(qvo);
		for(AQBoardVO out : list) {
			log.info(out);
		}
	}
	
	public void testBoardDetail() {
		AQBoardVO qvo = new AQBoardVO();
		qvo.setQ_no(1);
		
		qboardDAO.boardDetail(qvo);
	}
	
}
