package com.msix.client.cart.controller;

//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.client.cart.service.CartService;
import com.msix.client.cart.vo.CartVO;
import com.msix.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart/*")
@Log4j
@AllArgsConstructor
public class CartController {
	private CartService cartService;
	
	@GetMapping("/cartList")
	public String CartList(HttpSession session, CartVO cvo, Model model) {
		log.info("cartList 호출 성공!");
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		cvo.setM_no(member.getM_no());
		
		List<CartVO> cartList = cartService.cartList(cvo);
		model.addAttribute("cartList", cartList);
		
		return "cart/cartList";
	}
	
	@PostMapping("/addCart")
	public String addCart(@ModelAttribute CartVO cvo, RedirectAttributes ras, HttpServletRequest req, HttpSession session) {
		log.info("addCart 호출 성공 !!!!!");
		int result = 0;
		String url="";
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		cvo.setM_no(member.getM_no());
		
		List<CartVO> cartList = cartService.cartList(cvo);
		
		
		for(CartVO cart : cartList) {
				if(cart.getP_no().equals(cvo.getP_no()) && cart.getCart_delivery().equals(cvo.getCart_delivery())){
					cvo.setCart_no(cart.getCart_no());
					cvo.setCart_cnt(cart.getCart_cnt());
					cvo.setCart_price(Integer.parseInt(cart.getP_price()) * cart.getCart_cnt());
					cvo.setCart_delivery(cart.getCart_delivery());
					
						result = cartService.updateCartcnt(cvo);
						return "redirect:/cart/cartList";
					 	
				}
		} 
		cvo.setCart_price(Integer.parseInt(cvo.getP_price())* cvo.getCart_cnt());
		result=cartService.addCart(cvo);
		
		if(result > 0) {
			url = "/cart/cartList";
		}else {
			url = "/goods/productDetail?p_no="+cvo.getP_no();
		}
		return "redirect:"+url;
	}
	
	@PostMapping(value="/deleteCart")
	@ResponseBody
	public String deleteCart(@RequestParam(value="checkArr[]") List<String> checkArr, HttpSession session) throws Exception {
		log.info("deleteCart 호출 성공 ★");
		log.info("checkArr" +checkArr.toString());
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		String result = "";
		
		CartVO cvo = new CartVO();
		int cart_no = 0;
		
		if(member != null) {
			cvo.setM_no(member.getM_no());
			
			for(String i : checkArr) {
				cart_no = Integer.parseInt(i);
				cvo.setCart_no(cart_no);
				cartService.deleteCart(cvo);
			}
			result = "success";
			
		} else {
			result = "fail";
		}
		
		return result; 	
		
	}
	
	@PostMapping("/updateCart")
	@ResponseBody
	public String updateCart (CartVO cvo, HttpSession session, RedirectAttributes ras) throws Exception {
		log.info("updateCart 호출 성공 !!!!!");
		
		
		String result = "";
		ras.addFlashAttribute("data", cvo);
		
			cvo.getCart_cnt();
			cvo.getCart_no();
			cvo.getP_price();
			cvo.setCart_price(Integer.parseInt(cvo.getP_price()) * cvo.getCart_cnt());
			cvo.getCart_price();
			
			cartService.updateCart(cvo);
			
			result = "success";
		
		return result;
	} 
	
	@PostMapping(value="/paydeleteCart")
	public String paydeleteCart(@RequestParam(value="checkArr[]") List<String> checkArr, HttpSession session) throws Exception {
		log.info("paydeleteCart 호출 성공 ★");
		log.info("checkArr" +checkArr.toString());
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		CartVO cvo = new CartVO();
		int cart_no = 0;
		
		if(member != null) {
			cvo.setM_no(member.getM_no());
			
			for(String i : checkArr) {
				cart_no = Integer.parseInt(i);
				cvo.setCart_no(cart_no);
				cartService.deleteCart(cvo);
			}
		
		}
		return "/orders/orderConfirm"; 
	}
}
