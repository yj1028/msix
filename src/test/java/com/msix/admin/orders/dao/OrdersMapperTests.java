package com.msix.admin.orders.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.msix.admin.orders.vo.AOrderDetailVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrdersMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private AOrdersDAO ordersDAO;
	
//	@Test
//	public void testOrderList() {
//		OrdersVO ovo = new OrdersVO();
//		
//		List<OrdersVO> list = ordersDAO.orderList(ovo);
//		for(OrdersVO vo : list) {
//			log.info(vo);
//		}
//	}
	
//	@Test
//	public void testOrderDetail() {
//		OrderDetailVO odvo = new OrderDetailVO();
//		odvo.setO_no(43);
//		
//		List<OrderDetailVO> list = ordersDAO.orderDetail(odvo);
//		for(OrderDetailVO vo : list) {
//			log.info(vo);
//		}
//	}
	
	@Test
	public void testOrderChange() {
		AOrderDetailVO odvo = new AOrderDetailVO();
		odvo.setO_no(43);
		odvo.setD_delivery("배송중");
		
		int count = ordersDAO.orderChange(odvo);
		log.info("count : " + count);
	}
	
//	@Test
//	public void testOrderCancel() {
//		
//	}
//	
//	@Test
//	public void testOrderDetailCancel() {
//		
//	}
	
}
