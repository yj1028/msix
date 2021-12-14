package com.msix.admin.review.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msix.admin.review.vo.ARepReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RepReviewMapperTests {
	@Setter(onMethod_ = @Autowired )
	private ARepReviewDAO repReviewDAO;
	
	@Test
	public void replyList() {
		List<ARepReviewVO> list = repReviewDAO.replyList(4);
		for(ARepReviewVO out : list) {
			log.info(out);
		}
	}
	
	
	public void replyEachDelete() {
		int count = repReviewDAO.replyEachDelete(2);
		log.info("replyDelete 결과 : " + count);
	}
	
	public void replyAllDelete() {
		int count = repReviewDAO.replyAllDelete(2);
		log.info("replyDelete 결과 : " + count);
	}
}
