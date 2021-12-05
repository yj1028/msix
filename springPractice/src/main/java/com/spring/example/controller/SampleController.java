package com.spring.example.controller;

import java.util.ArrayList;
//import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.example.domain.ExampleVO;
import com.spring.example.domain.SampleDTO;
import com.spring.example.domain.SampleDTOList;
import com.spring.example.domain.Ticket;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	/* 요청방법 http://localhost:8080/sample/basic */
	@RequestMapping(value="/basic", method= {RequestMethod.GET, RequestMethod.POST})
	public String basicGet1() {
		log.info("basic get");
		return "basic";
	}
	
	@GetMapping("/exam01")
	public String exam01(@ModelAttribute SampleDTO dto/*, Model model*/) {
		log.info("" + dto);
		
		//model.addAttribute("dto",dto);
		return "exam01";
	}
	
	@GetMapping("/exam02")
	public String exam02(@RequestParam("name") String name, int age, Model model) {
		log.info(" name " + name );
		log.info(" age " + age );
		
		model.addAttribute("name", name);
		model.addAttribute("age",age);
		return "exam02";
	}
	
	@GetMapping("/exam02List")
	public String exam02ListForm(@RequestParam("language") ArrayList<String> language, Model model) {
		log.info("language: " + language);
		for(String lang : language) {
			log.info("language values " + lang);
		}
		
		model.addAttribute("language", language);
		return "exam02List";
	}
	
	@GetMapping("/exam02Array")
	public String exam02Array(@RequestParam("hobby") String[] hobby, Model model) {
		model.addAttribute("hobby", hobby);
		
		return "exam02Array";
	}
	
	@GetMapping("/exam02Bean")
	public String exam02Bean(SampleDTOList list) {
		
		return "exam02Bean";
	}
	
	@GetMapping("/exam03")
	public String exam03(@ModelAttribute SampleDTO dto, String number, Model model) {
		model.addAttribute("number", number);
		
		return "exam03";
	}
	
	/* @ResponseBody : 일반적인 jsp와 같은 뷰로 전달되는 게 아니라 데이터 자체를 전달하기 위한 용도*/
	@GetMapping("/exam04")
	@ResponseBody
	public SampleDTO exam04() {
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("홍길동");
		
		return dto;
	}
	/* ResponseEntity는 직접 결과 데이터와 HTTP 상태코드를 직접 제어할 수 있는 클래스 */
	@GetMapping("/exam05")
	public ResponseEntity<String> exam05(){
		String msg = "{\"name\": \"홍길동\", \"email\" : \"javauser@naver.com\"}";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type","application/json;charset=UTF-8");
		
		return new ResponseEntity<>(msg, header, HttpStatus.OK);
	}
	
	/*
	@GetMapping(value= "/exam06", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public SampleDTOList exam06() {
		SampleDTOList dtoList = new SampleDTOList();
		
		List<SampleDTO> list= dtoList.getList();
		list.add(new SampleDTO("홍길동",20));
		list.add(new SampleDTO("길동",30));
		
		return dtoList;
	} */
	
	@GetMapping("/exam06")
	public String exam06() {
		
		return "sample/exam06";
	}
	
	@PostMapping(value = "/exam06", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String exam06(ExampleVO evo, Ticket tvo) {
		log.info("정보 " +evo + tvo);
		return "확인";
	}
	
}
