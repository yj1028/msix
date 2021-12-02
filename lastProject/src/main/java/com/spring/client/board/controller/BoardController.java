package com.spring.client.board.controller;

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

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor // 주입(생성자)
public class BoardController {
	
	private BoardService boardService;
	
	/***************************************************
	 * 글 목록 구현하기(검색 제외 목록 조회) 
	 ***************************************************/
//	@GetMapping("/boardList")
//	public String boardList(@ModelAttribute("data") BoardVO bvo, Model model) {
//		log.info("boardList 호출 성공");
//		// 전체 레코드 조회
//		List<BoardVO> boardList = boardService.boardList(bvo);
//		model.addAttribute("boardList", boardList);
//		
//		return "board/boardList";
//	}
	
	/***************************************************
	 * 글 목록 구현하기(페이징 처리 목록 조회)
	 ***************************************************/
	@GetMapping("/boardList")
	public String boardList(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardList 호출 성공");
		// 전체 레코드 조회
		List<BoardVO> boardList = boardService.boardList(bvo);
		model.addAttribute("boardList", boardList);
		
		// 전체 레코드 수 구현
		int total = boardService.boardListCnt(bvo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(bvo, total));
		// 출력되는 글번호 제어
		int count = total - (bvo.getPageNum() - 1) * bvo.getAmount();
		model.addAttribute("count", count);
		
		return "board/boardList";
	}
	
	/***************************************************
	 * 글쓰기 폼 출력하기
	 ***************************************************/
	@RequestMapping(value="/writeForm")
	public String writeForm() {
		log.info("writeForm 호출 성공");
		
		return "/board/writeForm";
	}
	
	/***************************************************
	 * 글 입력 처리
	 ***************************************************/
	@RequestMapping(value ="/boardInsert", method =RequestMethod.POST)
	//@PostMapping("/boardInsert")
	public String boardInsert(BoardVO bvo) throws Exception{
		log.info("boardInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = boardService.boardInsert(bvo);
		if(result == 1) { // 입력 성공시 게시판 리스트로 이동
			url = "/board/boardList";
		} else {		  // 입력 실패시 입력화면으로 이동(제외 가능)
			url = "/board/writeForm";
		}
		
		return "redirect:" + url; 
		//return "redirect:/board/boardList";
	}
	
	/**************************************************
	 * 글 상세보기 구현
	 **************************************************/
	@GetMapping("/boardDetail")
	public String boardDetail(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("boardDetail 호출 성공");
		
		BoardVO detail = boardService.boardDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "board/boardDetail";
	}
	
	/******************************************************
	 * 비밀번호 확인
	 * @param b_num
	 * @param b_pwd
	 * @return int로 result를 0 또는 1을 리턴할 수도 있고,
	 * 		   String으로 result 값을 "성공 or 실패, 일치 or 불일치"를 리턴할 수도 있다.(현재 문자열 리턴)
	 * 참고 : @ResponseBody는 전달된 뷰를 통해서 출력하는 것이 아니라
	 *       Http Response Body에 직접 출력하는 방식.
	 *       produces 속성은 지정한 미디어 타입과 관련된 응답을 생성하는데 사용한 실제 컨텐트 타입을 보장.
	 ******************************************************/
	@ResponseBody
	@RequestMapping(value = "/pwdConfirm", method=RequestMethod.POST,
					produces = "text/plain; charset=UTF-8")
	public String pwdConfirm(BoardVO bvo) {
		log.info("pwdConfirm 호출 성공");
		String value = "";
		
		// 아래 변수에는 입력 성공에 대한 상타값 저장 (1 or 0)
		int result = boardService.pwdConfirm(bvo);
		if(result == 1) {
			value = "일치";
		} else {
			value = "불일치";
		}
		log.info("result = " + result);
		
		return value;
	}
	
	/****************************************************
	 * 글수정 폼 출력하기
	 * @param  : b_num
	 * @return : BoardVO
	 ****************************************************/
	@RequestMapping(value = "/updateForm")
	public String updateForm(@ModelAttribute("data") BoardVO bvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("b_num = " + bvo.getB_num());
		
		BoardVO updateData = boardService.updateForm(bvo);
		
		model.addAttribute("updateData", updateData);
		
		return "board/updateForm";
	}
	
	/******************************************************
	 * 글수정 구현하기
	 * @param : BoardVO
	 * 참고 : RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에
	 * 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다.
	 * addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
	 ******************************************************/
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(@ModelAttribute BoardVO bvo, RedirectAttributes ras) throws Exception {
		log.info("boardUpdate 호출 성공");
		
		int result = 0;
		String url= "";
		
		result = boardService.boardUpdate(bvo);
		ras.addFlashAttribute("data", bvo);
		
		if(result == 1) {
			// 아래 url은 수정 후 상세 페이지로 이동
			// url="/board/boardDetail?b_num="+bvo.getB_num();
			url = "/board/boardDetail";
		} else {
			// url="/board/updateForm?b_num="+bvo.getB_num();
			url = "/board/updateForm";
		}
		
		return "redirect:"+url;
	}
	
	/****************************************************
	 * 글 삭제 구현하기
	 ****************************************************/
	@RequestMapping(value="/boardDelete", method = RequestMethod.POST)
	public String boardDelete(@ModelAttribute BoardVO bvo, RedirectAttributes ras) throws Exception {
		log.info("boardDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = boardService.boardDelete(bvo);
		ras.addFlashAttribute("boardVO", bvo);
		
		if(result == 1) {
			url = "/board/boardList";
		} else {
			url = "/board/boardDetail";
		}
		return "redirect:"+url;
	}
	
	/****************************************************
	 * 글 삭제 전 댓글 개수 구현
	 ****************************************************/
	@ResponseBody
	@RequestMapping(value = "/replyCnt")
	public String replyCnt(@RequestParam("b_num") int b_num) {
		int result =0;
		result = boardService.replyCnt(b_num);
		return String.valueOf(result);
	}
}
