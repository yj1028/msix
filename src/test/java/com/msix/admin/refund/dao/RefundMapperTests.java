package com.msix.admin.refund.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msix.admin.refund.vo.RefundVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RefundMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private RefundDAO refundDAO;
	
	@Test
	public void testRefundList() {
		RefundVO rvo = new RefundVO();
		
		List<RefundVO> list = refundDAO.refundList(rvo);
		for(RefundVO vo : list) {
			log.info(vo);
		}
	}
	
	@Test
	public void testRefundDetail() {
		RefundVO rvo = new RefundVO();
		rvo.setRf_no(29);
		
		RefundVO detail = refundDAO.refundDetail(rvo);
		
		log.info(detail.toString());
	}
	
//	@Test
//	public void testRefundUpdate() {
//		RefundVO rvo = new RefundVO();
//		rvo.setD_no(14);
//		
//		int count = refundDAO.refundUpdate(rvo);
//		log.info("count : " + count);
//	}
}
