package com.msixpet.client.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.msixpet.client.cart.service.CartService;
import com.msixpet.client.cart.vo.CartVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart/*")
@Log4j
@AllArgsConstructor
public class CartController {
	private CartService cartService;
	
	@GetMapping("/cartList")
	public String CartList(HttpSession session, CartVO cvo) {
		log.info("cartList 호출 성공!");
		//String m_id = (String)session.getAttribute("m_id");
		
		cvo.setP_no("2");
		
		ArrayList<CartVO> cartList = cartService.cartList(cvo);
		session.setAttribute("cartList", cartList);
		
		return "cart/cartList";
	}
	
	@PostMapping("/addCart")
	public String addCart(CartVO cvo) {
		log.info("addCart 호출 성공 !!!!!");
		
		int result = 0;
		String url="";
		
		result=cartService.addCart(cvo);
		
		if(result==1) {
			url = "/cart/cartList";
		}else {
			url="/product/productDetail";
		}
		return "redirect:"+url;
	}
	
	@PostMapping(value="/deleteCart", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String deleteCart(CartVO cvo, HttpSession session ) {
		log.info("deleteCart 호출 성공 ★");
		String value="";
		
		cvo.setP_no("2");
	
		//session.removeAttribute("cartList");
		//redirect:/cart/cartList;
		
		int result = cartService.deleteCart(cvo);
		if(result==1) {
			value="success";
		}else {
			value="fail";
		}
		log.info("result = "+result);
		
		return value;
		
	}
	
	
	
	
}
