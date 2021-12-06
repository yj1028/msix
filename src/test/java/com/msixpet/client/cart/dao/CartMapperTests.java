package com.msixpet.client.cart.dao;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.msixpet.client.cart.vo.CartVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private CartDAO cartDAO;
	
	@Test 
	 public void TestCartList() {
		CartVO cvo = new CartVO();
		cvo.setCart_no(3);
	 
		List<CartVO> list = cartDAO.cartList(cvo);
	  for(CartVO vo : list) {
	  log.info(vo);
	  } 
	 }
	
}
