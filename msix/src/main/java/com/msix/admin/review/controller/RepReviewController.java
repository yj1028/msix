package com.msix.admin.review.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.msix.admin.review.service.RepReviewService;
import com.msix.admin.review.vo.RepReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/comments")
@Log4j
@AllArgsConstructor
public class RepReviewController {
		
	private RepReviewService repReviewService;
	
	@GetMapping(value = "/all/{rv_no}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public List<RepReviewVO> replyList(@PathVariable("rv_no") int rv_no ){
		log.info("replyList 호출 성공");
		List<RepReviewVO> list = null;
		list = repReviewService.replyList(rv_no);
		return list;
	}
	
	// 댓글 삭제 
	@DeleteMapping(value = "/{c_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyEachDelete(@PathVariable("c_no") int c_no){
		int result = repReviewService.replyEachDelete(c_no);
		return result == 1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
