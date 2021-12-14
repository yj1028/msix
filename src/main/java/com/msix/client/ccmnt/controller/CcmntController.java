package com.msix.client.ccmnt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.msix.client.ccmnt.service.CcmntSercvice;
import com.msix.client.ccmnt.vo.CcmntVO;
import com.msix.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/ccmnts/")
@Log4j
@AllArgsConstructor
public class CcmntController {
	private CcmntSercvice ccmntSercvice;
	
	@GetMapping(value = "/all/{rv_no}",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<CcmntVO> ccmntList(@PathVariable("rv_no") int rv_no){
		log.info("ccmntList호출성공");
		
		List<CcmntVO> list =null;
		list=ccmntSercvice.ccmntList(rv_no);
		return list;
	}
	
	@PostMapping(value = "/ccmntInsert",consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
	public String ccmntInsert(@RequestBody CcmntVO cvo, HttpSession session) {
		log.info("ccmntInsert호출성공");
		log.info("CcmntVO"+cvo);
		
		MemberVO vo = (MemberVO)session.getAttribute("login");
		cvo.setM_no(vo.getM_no());
		
		int result=0;
		
		result=ccmntSercvice.ccmntInsert(cvo);
		return result==1? "SUCCESS":"FAILURE";
	}
	
	@RequestMapping(value = "{c_no}",method = {RequestMethod.PUT,RequestMethod.PATCH},
			consumes ="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> ccmntUpdate(@PathVariable("c_no") Integer c_no,
			@RequestBody CcmntVO cvo){
		log.info("ccmntUpdate 호출성공");
		cvo.setC_no(c_no);
		int result=ccmntSercvice.ccmntUpdate(cvo);
		return result==1 ? new ResponseEntity<String>("SUCCESS",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "{c_no}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> ccmntDelete(@PathVariable("c_no") Integer c_no){
		log.info("ccmntDelete호출성공");
		
		int result=ccmntSercvice.ccmntDelete(c_no);
		return result ==1 ? new ResponseEntity<String> ("SUCCESS",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
}
