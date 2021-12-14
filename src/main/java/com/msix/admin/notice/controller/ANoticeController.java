package com.msix.admin.notice.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.admin.notice.service.ANoticeService;
import com.msix.admin.notice.vo.ANoticeVO;
import com.msix.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@Log4j
@AllArgsConstructor
public class ANoticeController {
	
	private ANoticeService noticeService;
	
	//공지게시판 리스트 (페이징 처리 목록 조회)
	@GetMapping("/noticeList")
	public String boardList(@ModelAttribute ANoticeVO nvo, Model model) {
		log.info("boardList 호출");
		List<ANoticeVO> boardList = noticeService.boardList(nvo);
		model.addAttribute("boardList",boardList);
		
		// 전체 레코드 수 구현
		int total = noticeService.nboardListCnt(nvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		// 출력되는 글번호 제어
		int count = total - (nvo.getPageNum() - 1) * nvo.getAmount();
		model.addAttribute("count", count);
				
		return "notice/boardNotice";
	}
	/* 글 상세 보기*/
	@GetMapping("/noticeDetail")
	public String boardDetail(@ModelAttribute ANoticeVO nvo, Model model) {
		log.info("noticeDetail 호출");
		
		ANoticeVO detail = noticeService.boardDetail(nvo);
		model.addAttribute("detail", detail);
		
		return "notice/noticeDetail";
	}
	
	/* 공지등록 폼 이동 */
	@RequestMapping(value="/noticeForm")
	public String noticeForm() {
		log.info("noticeForm 호출 성공");
		
		return "notice/noticeForm";
	}
	/* 공지 입력 */
	@RequestMapping(value ="/noticeInsert", method =RequestMethod.POST)
	public String boardInsert(ANoticeVO nvo) throws Exception {
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
	public String boardDelete(@ModelAttribute ANoticeVO nvo, RedirectAttributes ras) throws Exception{
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
	
	/* 공지 수정 */
	@ResponseBody
	@RequestMapping(value = "/{n_no}", method= {RequestMethod.PUT, RequestMethod.PATCH},
			consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> boardUpdate(@PathVariable("n_no") Integer n_no, @RequestBody ANoticeVO nvo) {
		nvo.setN_no(n_no);
		int result = noticeService.boardUpdate(nvo);
		return result == 1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
