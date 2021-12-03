package com.msixpet.client.cart.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.msixpet.client.cart.service.CartService;
import com.msixpet.client.cart.vo.CartVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("cart/*")
@Log4j
@AllArgsConstructor
public class CartController {
	private CartService cartService;
	
	@GetMapping("/cartList")
	public String CartList(Model model, CartVO cvo) {
		log.info("cartList 호출 성공!");
		
		List<CartVO> cartList = cartService.cartList(cvo);
		model.addAttribute("cartList", cartList);
		
		return "cart/cartList";
	}
}
