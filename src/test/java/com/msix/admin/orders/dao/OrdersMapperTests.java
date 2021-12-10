package com.msix.admin.orders.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msix.admin.orders.vo.OrderDetailVO;
import com.msix.admin.orders.vo.OrdersVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrdersMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private OrdersDAO ordersDAO;
	
	@Test
	public void testOrderList() {
		OrdersVO ovo = new OrdersVO();
		
		List<OrdersVO> list = ordersDAO.orderList(ovo);
		for(OrdersVO vo : list) {
			log.info(vo);
		}
	}
	
	@Test
	public void testOrderDetail() {
		OrderDetailVO odvo = new OrderDetailVO();
		odvo.setO_no(11);
		
		OrderDetailVO vo = ordersDAO.orderDetail(odvo);
		
		log.info(vo.toString());
	}
	
//	@Test
//	public void testOrderChange() {
//		OrderDetailVO odvo = new OrderDetailVO();
//		odvo.setD_no(14);
//		odvo.setD_delivery("배송중");
//		
//		int count = ordersDAO.orderChange(odvo);
//		log.info("count : " + count);
//	}
}