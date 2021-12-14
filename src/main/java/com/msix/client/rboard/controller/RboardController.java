package com.msix.client.rboard.controller;






import java.util.List;


import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.msix.client.rboard.service.RboardService;
import com.msix.client.rboard.vo.RboardVO;

import lombok.AllArgsConstructor;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/rboards/*")
@Log4j
@AllArgsConstructor
public class RboardController {
	
	private RboardService rboardService;
	
	@GetMapping(value ="/all/{q_no}",produces =MediaType.APPLICATION_JSON_UTF8_VALUE )
	public List<RboardVO> rboardList(@PathVariable("q_no") int q_no){
		log.info("rboardList호출성공");
		
		List<RboardVO> list=null;
		list=rboardService.rboardList(q_no);
		return list;
	}
		
		
		
}
