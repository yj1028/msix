package com.msixpet.client.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msixpet.client.product.service.ProductService;
import com.msixpet.client.product.vo.ProductVO;
import com.msixpet.client.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	
	private ProductService productService;
	
	/* 상품목록 구현하기(페이징 처리 제외 목록 조회) */
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productList 호출 성공");
		// 전체 레코드 조회
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		// 전체 레코드 수 구현
		int total = productService.productListCnt(pvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		
		// 출력되는 글번호 제어
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		model.addAttribute("count", count);
		
		return "product/productList";
	}
	
	/* 상품등록 폼 출력하기 */
	@RequestMapping(value = "/insertForm")
	public String insertForm() {
		log.info("writeForm 호출 성공");
		
		return "product/insertForm";
	}
	
	
	/* 상품 상세보기 구현 */
	@GetMapping("/productDetail")
	public String productDetail(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productDetail 호출 성공");
		
		ProductVO detail = productService.productDetail(pvo);
		model.addAttribute("detail", detail);
		
		return "product/productDetail";
	}
	
	
}
