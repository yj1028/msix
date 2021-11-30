package com.msix.admin.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.msix.admin.board.service.BoardService;
import com.msix.admin.board.vo.BoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/bulletein/*")
@Log4j
@AllArgsConstructor
public class BoardController {
	
	private BoardService boardService;
	
	//질의게시판 리스트
	@GetMapping("/bulleteinList")
	public String boardList(@ModelAttribute("data") BoardVO vo, Model model) {
		
		List<BoardVO> bulleteinList = boardService.boardList();
		model.addAttribute("bulleteinList", bulleteinList);
		
		return "board/boardQNA";
	}
	
}
