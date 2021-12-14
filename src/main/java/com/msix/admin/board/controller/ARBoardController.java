package com.msix.admin.board.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.msix.admin.board.service.ARBoardService;
import com.msix.admin.board.vo.ARBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/qnaReply")
@Log4j
@AllArgsConstructor
public class ARBoardController {
	
	private ARBoardService rboardService;
	
	@GetMapping(value = "/all/{q_no}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<ARBoardVO> replyList(@PathVariable("q_no") int q_no){
		log.info("replyList 호출");
		List<ARBoardVO> list = null;
		list = rboardService.replyList(q_no);
		return list;
	}
	//답글 입력
	@PostMapping(value = "/replyInsert", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String replyInsert(@RequestBody ARBoardVO rvo) {
		int result =0;
		result = rboardService.replyInsert(rvo);
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	//답글 수정
	@RequestMapping(value = "/{r_no}", method= {RequestMethod.PUT, RequestMethod.PATCH},
			consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyUpdate(@PathVariable("r_no") int r_no, @RequestBody ARBoardVO rvo){
		rvo.setR_no(r_no);
		int result = rboardService.replyupdate(rvo);
		return result == 1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//답글 삭제
	@DeleteMapping(value="/{r_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyDelete(@PathVariable("r_no") int r_no){
		int result = rboardService.replyDelete(r_no);
		return result == 1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
}
