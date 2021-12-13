package com.msix.admin.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.admin.image.vo.ImageVO;
import com.msix.admin.product.service.ProductService;
import com.msix.admin.product.vo.ProductVO;
import com.msix.common.vo.PageDTO;

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
		
		// 출력되는 상품번호 제어
//		int count = total - (pvo.getPageNum()-1) * pvo.getAmount();
//		model.addAttribute("count", count);
		
		return "product/productList";
	}
	
	/* 상품등록 폼 출력하기 */
	@RequestMapping(value = "/insertForm")
	public String insertForm() {
		log.info("writeForm 호출 성공");
		
		return "product/insertForm";
	}
	
	/* 상품 등록 구현하기*/
	@PostMapping(value = "/productInsert")
	public String productInsert(@ModelAttribute ProductVO pvo, Model model) throws Exception {
		log.info("productInsert 호출 성공");
		log.info(pvo);
		
		int result = 0;
		String url = "";
		
		result = productService.productInsert(pvo);
		if(result == 1) {
			url = "/product/productList";
		} else {
			url = "/product/insertForm";
		}
		
		return "redirect:" + url;
	}
	
	/* 상품 상세보기 구현 */
	@GetMapping("/productDetail")
	public String productDetail(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productDetail 호출 성공");
		
		ProductVO detail = productService.productDetail(pvo);
		model.addAttribute("detail", detail);
		
		return "product/productDetail";
	}
		
	/* 상품수정 폼 출력하기 
	 * @param : p_no
	 * @return : PorductVO */
	@RequestMapping(value = "/updateForm")
	public String updateForm(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("p_no = " + pvo.getP_no());
		
		ProductVO updateData = productService.updateForm(pvo);
		model.addAttribute("updateData", updateData);
		
		return "product/updateForm";
	}
	
	/* 상품수정 구현하기 
	 * @param : ProductVO */
	@PostMapping(value = "/productUpdate")
	public String productUpdate(@ModelAttribute ProductVO pvo, RedirectAttributes ras) throws Exception {
		log.info("productUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = productService.productUpdate(pvo);
		ras.addFlashAttribute("data", pvo);
		
		if(result == 1) {
			url = "/product/productDetail";
		} else {
			url = "/product/updateForm";
		}
		
		return "redirect:"+url;
	}
	
	/* 상품삭제 구현하기 */
	@PostMapping(value = "/productDelete")
	public String productDelete(@ModelAttribute ProductVO pvo, RedirectAttributes ras) throws Exception {
		log.info("productDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = productService.productDelete(pvo);
		ras.addFlashAttribute("data", pvo);
		
		if(result == 1) {
			url = "/product/productList";
		} else {
			url = "/product/productDetail";
		}
		
		return "redirect:"+url;
	}
	
	/* 상품이미지 삭제 구현하기 */
	@ResponseBody
	@PostMapping(value = "/imageDelete", produces = "text/plain; charset=utf-8")
	public String imageDelete(ImageVO ivo) throws Exception {
		log.info("imageDelete 호출 성공");
		String value = "";
		
		int result = productService.imageDelete(ivo);
		if(result == 1) {
			value="success";
		}else {
			value="fail";
		}
		log.info("result = " + result);
		
		return value;
	}
	
	/* 상품이미지 수정 구현하기 */
	@PostMapping(value = "/imageUpdate", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String imageUpdate(ImageVO ivo) throws Exception {
		log.info("imageUpdate 호출 성공");
		String value = "";
		
		int result = productService.imageUpdate(ivo);
		if(result == 1) {
			value="success";
		}else {
			value="fail";
		}
		log.info("result = " + result);
		
		return value;
	}
	
	/* 상품이미지 등록 구현하기 */
	@PostMapping(value = "/imageInsert", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String imageInsert(ImageVO ivo) throws Exception {
		log.info("imageInsert 호출 성공");
		String value = "";
		
		int result = productService.imageInsert(ivo);
		if(result == 1) {
			value="success";
		}else {
			value="fail";
		}
		log.info("result = " + result);
		
		return value;
	}
}