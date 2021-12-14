package com.msix.client.orders.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.msix.client.cart.service.CartService;
import com.msix.client.cart.vo.CartVO;
import com.msix.client.member.vo.MemberVO;
import com.msix.client.orders.service.OrdersService;
import com.msix.client.orders.vo.OrdersVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/orders/*")
@Log4j
@AllArgsConstructor
public class OrdersController {

	private OrdersService ordersService;

	@Setter(onMethod_ = @Autowired)
	private CartService cartService;

	@RequestMapping(value = "/ordersForm")
	public String ordersForm(CartVO cvo, OrdersVO ovo, Model model, HttpSession session) {
		log.info("ordersForm 호출 성공 ★");

		MemberVO mvo = (MemberVO) session.getAttribute("login");
		CartVO cart = (CartVO) session.getAttribute("cart");

		cvo.setM_no(mvo.getM_no());

		List<CartVO> cartList = cartService.cartList(cvo);
		model.addAttribute("cartList", cartList);

		return "orders/ordersForm";
	}

	@PostMapping(value="/ordersInsert") 
		 public String ordersInsert(String[] cart, OrdersVO ovo, CartVO cvo, Model model, HttpSession session) { 
			 log.info("ordersInsert 호출 성공");
			 log.info(Arrays.toString(cart));
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		
		ovo.setM_no(mvo.getM_no());
		
		  String url="";
		  
		  int result = 0;

		  
		  result = ordersService.ordersInsert(ovo);
		  
		  if(result==0) {
			  url="/orders/ordersForm";
		  }else if(result == 1) {  
			  for(String value :cart) {
				  log.info("cart_no : "+ value);
				  cvo.setCart_no(Integer.parseInt(value));
				  cartService.deleteCart(cvo);
			  }
			  url="/orders/orderConfirm";
		  } 
		  
		  return "redirect:"+url;
		 }
		 
		 @RequestMapping(value = "/orderConfirm")
		 public String orderConfirm() {
			 log.info("orderConfirm 호출 성공");
			 
			 return "/orders/orderConfirm"; 
		 }
		 
		 
		 
		 
		 
		
		
}
