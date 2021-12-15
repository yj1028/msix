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
import com.msix.admin.orders.vo.AOrderDetailVO;
import com.msix.admin.orders.vo.AOrdersVO;
import com.msix.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/aorders/*")
@Log4j
@AllArgsConstructor
public class AOrdersController {
	
	private OrdersService ordersService;
	
	@GetMapping("/orderList")
	public String orderList(@ModelAttribute("data") AOrdersVO ovo, Model model) {
		log.info("ordersList 호출 성공");
		
		List<AOrdersVO> orderList = ordersService.orderList(ovo);
		model.addAttribute("orderList", orderList);
		
		// 전체 레코드 수 구현
		int total = ordersService.orderListCnt(ovo);
		log.info("count : " + total);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(ovo, total));
		// 출력되는 글번호 제어
		int count = total - (ovo.getPageNum() - 1) * ovo.getAmount();
		model.addAttribute("count", count);
		
		return "aorders/orderList";
	}
	
	@GetMapping("/orderDetail")
	public String orderDetail(@ModelAttribute("detail") AOrderDetailVO odvo, Model model) {
		log.info("orderDetail 호출 성공");
		
		odvo.setO_no(odvo.getO_no());
		
		List<AOrderDetailVO> detail = ordersService.orderDetail(odvo);
		model.addAttribute("detail", detail);
		
		return "aorders/orderDetail";
	}
	
	@PostMapping("/orderChange")
	public String orderChange(@ModelAttribute AOrderDetailVO odvo) {
		log.info("orderChange 호출 성공");
		
		String url = "";
		
		int result = ordersService.orderChange(odvo);

		log.info("no=" + odvo.getO_no());
		if(result != 0) {
			url = "/aorders/orderDetail?o_no="+odvo.getO_no()+"&m_no="+odvo.getM_no();
			//url = "/orders/orderDetail";
		} else {
			url = "/aorders/orderList";
			log.info("수정안됨");
		}
		
		return "redirect:"+url;
	}
	
	@PostMapping("/orderCancel")
	public String orderCancel(@ModelAttribute AOrderDetailVO odvo, RedirectAttributes ras) {
		log.info("orderCancel 호출 성공");
		
		String url = "";
		
		int result = ordersService.orderCancel(odvo);
		ras.addFlashAttribute("data", odvo);
		
		if(result != 0) {
			url = "/aorders/orderList";
		} else {
			url = "/aorders/orderDetail";
		}
		
		return "redirect:"+url;
	}
}
