package com.msix.admin.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.admin.review.service.ReviewService;
import com.msix.admin.review.vo.ReviewVO;
import com.msix.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
@AllArgsConstructor
public class ReviewController {
	
	private ReviewService reviewService;
	
	//리뷰게시판 리스트 (페이징 처리 목록 조회)
	@GetMapping("/reviewList")
	public String boardList(@ModelAttribute("data") ReviewVO rvo, Model model) {
		log.info("review boardList 조회");
		List<ReviewVO> boardList = reviewService.boardList(rvo);
		model.addAttribute("boardList", boardList);
		
		// 전체 레코드 수 구현
		int total = reviewService.rvboardListCnt(rvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		// 출력되는 글번호 제어
		int count = total - (rvo.getPageNum() - 1) * rvo.getAmount();
		model.addAttribute("count", count);

		return "review/boardReview";
	}
	
	@GetMapping("/reviewDetail")
	public String boardDetail(@ModelAttribute ReviewVO rvo, Model model) {
		ReviewVO detail = reviewService.boardDetail(rvo);
		model.addAttribute("detail", detail);
		
		return "review/reviewDetail";
	}
	
	/* 글 삭제 전 댓글 개수 구현 */
	@ResponseBody
	@RequestMapping(value = "/replyCnt")
	public String replyCnt(@RequestParam("rv_no") int rv_no) {
		int result = 0;
		result = reviewService.replyCnt(rv_no);
		return String.valueOf(result);
	}
	
	/* 글 삭제 (댓글 있는 경우 댓글도 모두 삭제)*/
	@RequestMapping(value = "/reviewDelete", method = RequestMethod.POST)
	public String boardDelete(@ModelAttribute ReviewVO rvo, RedirectAttributes ras) {
		int result = 0;
		String url = "";
		
		result = reviewService.boardDelete(rvo);
		ras.addFlashAttribute("reviewVO",rvo);
		if(result == 1) {
			url = "/review/reviewList";
		}else {
			url ="/review/reviewDetail";
		}
		return "redirect:"+url;
	}
	
	
}
