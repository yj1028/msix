package com.msix.client.refund.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.msix.admin.orders.vo.AOrderDetailVO;
import com.msix.admin.refund.service.RefundService;
import com.msix.admin.refund.vo.ARefundVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/refund/*")
@Log4j
@AllArgsConstructor
public class RefundController {

	private RefundService refundService;
	
	@RequestMapping("/refundInsertForm")
	public String refundInsertForm(@ModelAttribute AOrderDetailVO odvo, Model model) {
		log.info("refundInsertForm 호출 성공");
		
		odvo.getD_no();
		odvo.getD_price();
		
		model.addAttribute("detail", odvo);
		
		return "refund/refundInsertForm";
	}
	
	@PostMapping("/refundInsert")
	public String refundInsert(ARefundVO rvo) throws Exception{
		log.info("refundInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = refundService.refundInsert(rvo);
		if(result == 1) {
			url = "/orders/orderDetailList";
		} else {
			url = "/refund/refundInsertForm";
		}
		
		return "redirect:" + url;
	}
}
