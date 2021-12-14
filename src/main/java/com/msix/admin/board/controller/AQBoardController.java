package com.msix.admin.board.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.admin.board.service.AQBoardService;
import com.msix.admin.board.vo.AQBoardVO;
import com.msix.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@Log4j
@AllArgsConstructor
public class AQBoardController {
	
	private AQBoardService qboardService;
	
	//질의게시판 리스트 (페이징 처리 목록 조회)
	@GetMapping("/qnaList")
	public String boardList(@ModelAttribute("data") AQBoardVO vo, Model model) {
		log.info("qnaList 호출");
		List<AQBoardVO> qnaList = qboardService.boardList(vo);
		model.addAttribute("qnaList", qnaList);
		
		// 전체 레코드 수 구현
		int total = qboardService.qboardListCnt(vo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		// 출력되는 글번호 제어
		int count = total - (vo.getPageNum() - 1) * vo.getAmount();
		model.addAttribute("count", count);

		return "board/boardQNA";
	}
	
	//질의게시판 상세리스트
	@GetMapping("/qnaDetail")
	public String boardDetail(@ModelAttribute("data") AQBoardVO qvo, Model model) {
		AQBoardVO detail = qboardService.boardDetail(qvo);
		model.addAttribute("detail", detail);
		
		return "board/qnaDetail";
	}
	
	// 질의글 삭제 
	@RequestMapping(value = "/qnaDelete", method = RequestMethod.POST)
	public String boardDelete(@ModelAttribute AQBoardVO qvo, RedirectAttributes ras) throws Exception {
		log.info("boardDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = qboardService.boardDelete(qvo);
		ras.addFlashAttribute("QBoardVO", qvo);
		
		if(result == 1) {
			url = "/qna/qnaList";
		} else {
			url = "/qna/qnaDetail";
		}
		return "redirect:"+url;
	}
}