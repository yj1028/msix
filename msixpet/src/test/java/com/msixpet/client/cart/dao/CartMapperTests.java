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
	
 /*	@Test 
	 public void TestCartList() {
		CartVO cvo = new CartVO();
		cvo.setP_no("2");
	 
		List<CartVO> list = cartDAO.cartList(cvo);
	  for(CartVO vo : list) {
	  log.info(vo);
	  } 
	 } */
	
@Test
	public void TestaddCart() {
		CartVO cvo = new CartVO();
		cvo.setCart_cnt(3);
		cvo.setP_no("2");
		cvo.setCart_delivery("일반배송");
		cvo.setCart_pay(10000);
		cvo.setCart_price("50000");
		cvo.setM_no(1);
		
		int count = cartDAO.addCart(cvo);
		log.info("add Count: "+count);
	} 
 
	 @Test 
	 public void TestdeleteCart() {
		CartVO cvo = new CartVO();
		cvo.setP_no("2");
	 
		int count = cartDAO.deleteCart(cvo);
	  log.info("delete Count : "+count);
	  } 
	 
	} 
	

