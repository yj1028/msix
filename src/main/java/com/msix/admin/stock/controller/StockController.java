package com.msix.admin.stock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.msix.admin.product.service.ProductService;
import com.msix.admin.product.vo.ProductVO;
import com.msix.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/stock/*")
@AllArgsConstructor
public class StockController {
	
	private ProductService productService;
	
	/* 재고 리스트 조회 구현하기 */
	@RequestMapping(value = "/stockList", method = RequestMethod.GET)
	public String stockList(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("stockList 호출 성공");
		
		// 전체 레코드 조회
		List<ProductVO> stockList = productService.stockList(pvo);
		model.addAttribute("stockList", stockList);
		
		// 전체 레코드 수 구현
		int total = productService.productListCnt(pvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		
		// 출력되는 글번호 제어
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		model.addAttribute("count", count);
		
		return "stock/stockList";
	}
	
	/* 재고수정 구현하기 */
	@PostMapping(value = "/stockUpdate")
	public String stockUpdate(@ModelAttribute ProductVO pvo) throws Exception {
		log.info("stockUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = productService.stockUpdate(pvo);
		
		if(result == 1) {
			url = "/stock/stockList";
		}else {
			url = "/product/productList";
		}
		
		return "redirect:"+url;
	}
}
