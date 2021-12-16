package com.msix.admin.refund.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.admin.refund.service.RefundService;
import com.msix.admin.refund.vo.ARefundVO;
import com.msix.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/arefund/*")
@Log4j
@AllArgsConstructor
public class ARefundController {
	
	private RefundService refundService;
	
	@GetMapping("/refundList")
	public String refundList(@ModelAttribute("data") ARefundVO rvo, Model model) {
		log.info("refundList 호출 성공");
		
		List<ARefundVO> refundList = refundService.refundList(rvo);
		model.addAttribute("refundList", refundList);
		
		// 전체 레코드 수 구현
		int total = refundService.refundListCnt(rvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		// 출력되는 글번호 제어
		int count = total - (rvo.getPageNum() - 1) * rvo.getAmount();
		model.addAttribute("count", count);
				
		return "arefund/refundList";
	}
	
	@GetMapping("/refundDetail")
	public String refundDetail(@ModelAttribute ARefundVO rvo, Model model) {
		log.info("refundDetail 호출 성공");
		
		ARefundVO detail = refundService.refundDetail(rvo);
		model.addAttribute("detail", detail);
		
		return "arefund/refundDetail";
	}
	
	@PostMapping("/refundUpdate")
	public String refundUpdate(@ModelAttribute ARefundVO rvo) {
		log.info("refundUpdate 호출 성공");
		
		String url = "";
		
		int result = refundService.refundUpdate(rvo);
		
		if(result == 1) {
			url = "/arefund/refundList";
		} else {
			url = "/arefund/refundDetail";
		}
		
		return "redirect:" + url;
	}
	
	@PostMapping("/refundDelete")
	public String refundDelete(@ModelAttribute ARefundVO rvo, RedirectAttributes ras) {
		log.info("refundDelete 호출 성공");
		
		String url = "";
		
		int result = refundService.refundDelete(rvo);
		ras.addFlashAttribute("data", rvo);
		
		if(result == 1) {
			url = "/arefund/refundList";
		} else {
			url = "/arefund/refundDetail";
		}
		
		return "redirect:" + url;
	}
	
}
