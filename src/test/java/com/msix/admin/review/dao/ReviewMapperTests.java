package com.msix.admin.review.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msix.admin.review.vo.AReviewVO;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTests {
	@Setter(onMethod_ = @Autowired)
	private AReviewDAO reviewDAO;
	
	
	public void testBoardList() {
		AReviewVO rvo = new AReviewVO();
		
		List<AReviewVO> list = reviewDAO.boardList(rvo);
		for(AReviewVO out : list) {
			log.info(out);
		}
	}
	
	public void testDetailList() {
		AReviewVO rvo = new AReviewVO();
		rvo.setRv_no(1);
		
		AReviewVO vo = reviewDAO.boardDetail(rvo);
		log.info(vo);
	}
	@Test
	// 자식 레코드가 있어서 삭제 불가 
	public void testBoardDelete() {
		AReviewVO rvo = new AReviewVO();
		rvo.setRv_no(1);
		
		int count = reviewDAO.boardDelete(rvo);
		log.info("delete count : " + count);
	}
	
}
