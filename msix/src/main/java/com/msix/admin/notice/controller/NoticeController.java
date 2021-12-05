package com.msix.admin.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.admin.notice.service.NoticeService;
import com.msix.admin.notice.vo.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@Log4j
@AllArgsConstructor
public class NoticeController {
	
	private NoticeService noticeService;
	
	@GetMapping("/noticeList")
	public String boardList(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("boardList 호출");
		List<NoticeVO> boardList = noticeService.boardList();
		model.addAttribute("boardList",boardList);
		return "notice/boardNotice";
	}
	/* 글 상세 보기*/
	@GetMapping("/noticeDetail")
	public String boardDetail(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("noticeDetail 호출");
		
		NoticeVO detail = noticeService.boardDetail(nvo);
		model.addAttribute("detail", detail);
		return "/notice/noticeDetail";
	}
	
	/* 공지등록 폼 이동 */
	@RequestMapping(value="/noticeForm")
	public String noticeForm() {
		log.info("noticeForm 호출 성공");
		
		return "/notice/noticeForm";
	}
	/* 공지 입력 */
	@RequestMapping(value ="/noticeInsert", method =RequestMethod.POST)
	public String boardInsert(NoticeVO nvo) throws Exception {
		log.info("noticeInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = noticeService.boardInsert(nvo);
		if(result == 1) { 
			url = "/notice/noticeList";
		} else {
			url = "/notice/noticeForm";
		}
		
		return "redirect:" + url; 
	}
	
	/* 공지 삭제 */
	@RequestMapping(value="/noticeDelete", method = RequestMethod.POST)
	public String boardDelete(@ModelAttribute NoticeVO nvo, RedirectAttributes ras) throws Exception{
		log.info("noticeDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = noticeService.boardDelete(nvo);
		ras.addFlashAttribute("NoticeVO",nvo);
		
		if(result == 1) {
			url = "/notice/noticeList";
		} else {
			url = "/notice/noticeDetail";
		}
		return "redirect:"+url;
	}
	
	/* 공지 수정*/
	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String boardUpdate(@ModelAttribute NoticeVO nvo, RedirectAttributes ras) throws Exception  {
		log.info("noticeUpdate 호출 성공");
		
		int result = 0;
		String url= "";
		
		result = noticeService.boardUpdate(nvo);
		ras.addFlashAttribute("data", nvo);				//------------
		
		if(result == 1) {
			url = "/notice/noticeList";
		}else {
			url = "/notice/noticeDetail";
		}
		
		return "redirect:"+url;
	}
	
}
