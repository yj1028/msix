package com.msix.admin.orders.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.admin.orders.service.OrdersService;
import com.msix.admin.orders.vo.OrderDetailVO;
import com.msix.admin.orders.vo.OrdersVO;
import com.msix.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/orders/*")
@Log4j
@AllArgsConstructor
public class OrdersController {
	
	private OrdersService ordersService;
	
	@GetMapping("/orderList")
	public String orderList(@ModelAttribute("data") OrdersVO ovo, Model model) {
		log.info("ordersList 호출 성공");
		
		List<OrdersVO> orderList = ordersService.orderList(ovo);
		model.addAttribute("orderList", orderList);
		
		// 전체 레코드 수 구현
		int total = ordersService.orderListCnt(ovo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(ovo, total));
		// 출력되는 글번호 제어
		int count = total - (ovo.getPageNum() - 1) * ovo.getAmount();
		model.addAttribute("count", count);
		
		return "orders/orderList";
	}
	
	@GetMapping("/orderDetail")
	public String orderDetail(@ModelAttribute("detail") OrderDetailVO odvo, Model model) {
		log.info("orderDetail 호출 성공");
		
		OrderDetailVO detail = ordersService.orderDetail(odvo);
		model.addAttribute("detail", detail);
		
		return "orders/orderDetail";
	}
	
	@PostMapping("/orderChange")
	public String orderChange(@ModelAttribute OrderDetailVO odvo) {
		log.info("orderChange 호출 성공");
		
		String url = "";
		
		int result = ordersService.orderChange(odvo);

		log.info("no=" + odvo.getO_no());
		if(result == 1) {
			url = "/orders/orderDetail?o_no="+odvo.getO_no()+"&m_no="+odvo.getM_no();
			//url = "/orders/orderDetail";
		} else {
			url = "/orders/orderList";
			log.info("수정안됨");
		}
		
		return "redirect:"+url;
	}
	
	@PostMapping("/orderCancelq")
	public String orderDetailCancel(@ModelAttribute OrderDetailVO odvo, RedirectAttributes ras) {
		log.info("orderDetailCancel 호출 성공");
		
		String url = "";
		
		int result = ordersService.orderDetailCancel(odvo);
		ras.addFlashAttribute("data", odvo);
		
		if(result == 1) {
			url = "/orders/orderList";
		} else {
			url = "/orders/orderDetail";
		}
		
		return "redirect:"+url;
	}
	
	@PostMapping("/orderCancel")
	public String orderCancel(@ModelAttribute OrdersVO ovo, RedirectAttributes ras) {
		log.info("orderCancel 호출 성공");
		
		String url = "";
		
		int result = ordersService.orderCancel(ovo);
		ras.addFlashAttribute("data", ovo);
		
		if(result == 1) {
			url = "/orders/orderList";
		} else {
			url = "/orders/orderDetail";
		}
		
		return "redirect:"+url;
	}
}
