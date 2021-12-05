package com.msix.admin.board.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msix.admin.board.vo.QBoardVO;

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
		QBoardVO qvo = new QBoardVO();
		
		qvo.setPageNum(1);
		qvo.setAmount(10);
		
		List<QBoardVO> list = qboardDAO.boardList(qvo);
		for(QBoardVO out : list) {
			log.info(out);
		}
	}
	
	public void testBoardDetail() {
		QBoardVO qvo = new QBoardVO();
		qvo.setQ_no(1);
		
		qboardDAO.boardDetail(qvo);
	}
	
}