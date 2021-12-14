package com.msix.client.orderdetail.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.msix.client.member.vo.MemberVO;
import com.msix.client.orderdetail.vo.OrderdetailVO;
import com.msix.client.orders.service.OrdersService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/orders/*")
@Log4j
@AllArgsConstructor
public class OrderdetailController {
	private OrdersService ordersService;

	@GetMapping("/orderDetailList")
	public String orderDetailList(HttpSession session, OrderdetailVO odvo, Model model) {
		log.info("orderDetailList 호출 성공!");
		
		MemberVO member = (MemberVO)session.getAttribute("login");
		
		odvo.setM_no(member.getM_no());
		
		List<OrderdetailVO> orderDetailList = ordersService.ordersDetailList(odvo);
		model.addAttribute("orderDetailList", orderDetailList);

		return "orders/detailList";
	}
}
