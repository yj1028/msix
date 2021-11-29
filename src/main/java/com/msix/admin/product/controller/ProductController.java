package com.msix.admin.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.msix.admin.product.service.ProductService;
import com.msix.admin.product.vo.ProductVO;

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
		
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		return "product/productList";
	}
}
