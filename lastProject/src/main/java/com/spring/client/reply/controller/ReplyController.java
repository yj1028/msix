package com.spring.client.reply.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
//import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.reply.service.ReplyService;
import com.spring.client.reply.vo.ReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


/* rest(representational state transfer)의 약어로 하나의 URI는 
 * 하나의 고유한 리소스를 대표하도록 설계된다는 개념
 * 예를 들어 Board/125는 게시물 중에서 125번이라는 고유한 의미를 가지도록 설계.
 * 
 * @RestController (@Controller + @ResponsesBody)
 * controller가 rest 방식을 처리하기 위한 것임을 명시.
 * 기존의 특정한 jsp 와 같은 뷰를 만들어 내는 것이 목적이 아닌
 * rest방식의 데이터 처리(데이터 자체를 반환)를 위해서 사용하는 어노테이션.
 * @ResponsesBody : 데이터 자체를 전달하는 용도
 * @PathVariable : url 경로에 있는 값을 파라미터로 추출하려고 할 때 사용 
 * @RequestBody : json 형태의 데이터로 사용자로부터 받아온 경우 원하는 타입으로 바인딩 처리(VO)*/

@RestController
@RequestMapping(value = "/replies")
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService replyService;
	
	/* 댓글 글목록 구현하기 
	 * @PathVariable : url 경로에 있는 값을 파라미터로 추출하려고 할 때 사용 
	 * 응답 문서 타입을 xml이나 json 으로 반환할 때는 produces 속성을 사용한다.
	 * produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF-8_VALUE }
	 * 현재 요청 URL : https://localhost:8080/replies/all/게시판글번호
	 * ResponseEntity는 개발자가 직접 결과 데이터와 HTTP 상태 코드를 직접 제어할 수 있는 클래스.*/
	
	/*@GetMapping(value="/all/{b_num}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("b_num") Integer b_num){
		log.info("list 호출 성공");
		
		ResponseEntity<List<ReplyVO>> entity = null;
		entity = new ResponseEntity<List<ReplyVO>>(replyService.replyList(b_num), HttpStatus.OK);
		return entity;
	}*/
	
	@GetMapping(value="/all/{b_num}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<ReplyVO> replyList(@PathVariable("b_num") Integer b_num){
		log.info("list 호출 성공");
		List<ReplyVO> list = null;
		list = replyService.replyList(b_num);
		return list;
	}
	/*
	@PostMapping(value = "/replyInsert", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rvo){
		log.info("ReplyVO  : " +rvo);
		int result =0;
		result = replyService.replyInsert(rvo);
		return result == 1? new ResponseEntity<String>("SUCCESS",HttpStatus.OK):
							new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}*/
	
	@PostMapping(value = "/replyInsert", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String replyInsert(@RequestBody ReplyVO rvo){
		log.info("ReplyVO  : " +rvo);
		int result =0;
		result = replyService.replyInsert(rvo);
		return (result == 1)? "SUCCESS" : "FAILURE";
	}
	
	/* 댓글 비밀번호 확인 */
	@RequestMapping(value="/pwdConfirm", method = {RequestMethod.POST}, produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> pwdConfirm(@ModelAttribute ReplyVO rvo) {
		log.info("실행성공");
		ResponseEntity<String> entity = null;
		int result = 0;
		
		result = replyService.pwdConfirm(rvo);
		entity = new ResponseEntity<String>(String.valueOf(result),HttpStatus.OK);
		return entity;
	}
	
	/* 댓글 수정 
	 * rest 방식에서 update 작업은 put, patch방식을 이용해서 처리.
	 * 전체 데이터를 수정하는 경우에는 put을 이용하고,
	 * 일부의 데이터를 수정하는 경우에는 patch를 이용. 대게 put 선호. */
	@RequestMapping(value = "/{r_num}", method= {RequestMethod.PUT, RequestMethod.PATCH},
			consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyUpdate(@PathVariable("r_num") Integer r_num,	@RequestBody ReplyVO vo) {
		vo.setR_num(r_num);
		int result = replyService.replyupdate(vo);
		return result == 1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	/* 댓글 삭제 
	 * rest 방식에서 delete 작업은 delete 이용해서 처리
	 * 
	 * @@RequestMapping(value = "/{r_num}", method= RequestMethod.DELETE,
			produces = {MediaType.TEXT_PLAIN_VALUE})*/
	@DeleteMapping(value = "/{r_num}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyDelete(@PathVariable("r_num") Integer r_num){
		int result = replyService.replyDelete(r_num);
		return result == 1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
