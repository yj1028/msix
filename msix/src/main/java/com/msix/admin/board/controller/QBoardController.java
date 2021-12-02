package com.msix.admin.board.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;

import com.msix.admin.board.service.QBoardService;
import com.msix.admin.board.vo.QBoardVO;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@Log4j
@AllArgsConstructor
public class QBoardController {
	
	private QBoardService qboardService;
	
	//질의게시판 리스트
	@GetMapping("/qnaList")
	public String boardList(@ModelAttribute("data") QBoardVO vo, Model model) {
		log.info("qnaList 호출");
		List<QBoardVO> qnaList = qboardService.boardList();
		model.addAttribute("qnaList", qnaList);
		
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
