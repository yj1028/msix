package com.msix.client.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.msix.common.vo.PageDTO;
import com.msix.client.product.service.ImageService;
import com.msix.client.product.service.ProductService;
import com.msix.client.product.vo.CImageVO;
import com.msix.client.product.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/goods/*")
@AllArgsConstructor
public class ProductController {
	
	private ProductService productService;
	
	private ImageService imageService;
	
	/* 상품목록 구현하기 */
	@RequestMapping(value = "/clientProductList", method = RequestMethod.GET)
	public String productList(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productList 호출 성공");
		
		// 레코드 조회
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		// 페이징 처리
		int total = productService.productListCnt(pvo);
		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		// 출력되는 사진개수 제어
		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
		model.addAttribute("count", count);
		
		return "product/clientProductList";
	}
	
	/* 상품 상세페이지 */
	@GetMapping("/productDetail")
	public String productDetail(@ModelAttribute ProductVO pvo, Model model) {
		log.info("productDetail 호출 성공");
		
		ProductVO detail = productService.productDetail(pvo);
		model.addAttribute("product", detail);
		
		//ImageVO
		List<CImageVO> list = imageService.imageList(pvo);
		model.addAttribute("image", list);
		
		return "product/productDetail";
	}
	
}
