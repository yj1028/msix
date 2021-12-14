package com.msix.client.nbaord.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.msix.client.common.vo.PageDTO;
import com.msix.client.nbaord.service.NboardService;
import com.msix.client.nbaord.vo.NboardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/nboard/*")
@Log4j
@AllArgsConstructor
public class NboardController {
	private NboardService nboardService;
	
	//공지게시판 목록 구현하기
	@RequestMapping(value = "/nboardList", method =RequestMethod.GET)
	public String nboardList(Model model,@ModelAttribute ("data") NboardVO nvo) {
		log.info("nboardList호출성공");
		//전체 레코드 조회
		List<NboardVO> nboardList=nboardService.nboardList(nvo);
		model.addAttribute("nboardList",nboardList);
		
		// 전체 레코드 수 구현
		int total=nboardService.nboardListCnt(nvo);
		//페이징 처리
		model.addAttribute("pageMaker",new PageDTO(nvo, total));
		//출력되는 글번호 제어
		int count=total -(nvo.getPageNum()-1)* nvo.getAmount();
		model.addAttribute("count",count);
		return "nboard/nboardList";
	}
	//글상세보기 
	@RequestMapping(value = "/nboardDetail" , method = RequestMethod.GET)
	public String nboardDetail(@ModelAttribute("data") NboardVO nvo ,Model model) {
		log.info("nboardDetail 호출성공");
		
		NboardVO detail=nboardService.nboardDetail(nvo);
		model.addAttribute("detail",detail);
		
		return "nboard/nboardDetail";
	}
}
