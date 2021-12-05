package com.msix.admin.board.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;

import com.msix.admin.board.service.QBoardService;
import com.msix.admin.board.vo.QBoardVO;
import com.msix.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@Log4j
@AllArgsConstructor
public class QBoardController {
	
	private QBoardService qboardService;
	
	//질의게시판 리스트 (페이징 처리 목록 조회)
	@GetMapping("/qnaList")
	public String boardList(@ModelAttribute("data") QBoardVO vo, Model model) {
		log.info("qnaList 호출");
		List<QBoardVO> qnaList = qboardService.boardList(vo);
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
	public String boardDetail(@ModelAttribute("data") QBoardVO qvo, Model model) {
		QBoardVO detail = qboardService.boardDetail(qvo);
		model.addAttribute("detail", detail);
		
		return "/board/qnaDetail";
	}
	
	
}
