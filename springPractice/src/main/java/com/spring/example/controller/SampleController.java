package com.spring.example.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
	
	@RequestMapping(value="/basic", method= {RequestMethod.GET, RequestMethod.POST})
	public String basicGet1() {
		log.info("basic get...........");
		return "basic";
	}
	//RequestMapping은 메서드 개당 한번씩밖에 못함. (반환을 한번씩만 할 수 있기 때문)
	
	//@RequestMapping(value="/exam01", method= {RequestMethod.GET})
	@GetMapping("/exam01")
	//괄호 안에는 요청할 url을 매핑한다.
	public String exam01(@ModelAttribute SampleDTO dto, Model model) {//여기서 모델의 인스턴스를 생성하고, 따로 객체 생성 코드 없이 속성 추가 가능.
						//사용자로부터 받아올 값의 request를 dto에 하기 위한 매개변수.
						//model에 데이터를 담아서 가져가기 위해 Attribute함.
		
		log.info(""+dto);
		//console에 출력하는 코드. 
		//model.addAttribute("dto", dto);
		//model에 dto데이터 담아주기(포워드 시켜주는 것) > 표현언어로 출력 가능.
		
		return "exam01";
		//반환해주는 값은 보여줄 jsp문서의 이름. 
	}
	
	@RequestMapping(value="/exam02", method= {RequestMethod.GET})
	public String exam02(@RequestParam("name") String name, int age, Model model) {
		log.info("name: "+name);
		log.info("age: "+age);
		//하나씩 담아서 보낼수도 있음.
		
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		return "exam02";
		
	}
	@GetMapping("/exam02List")
	public String exam02List(@RequestParam("language") ArrayList<String> language, Model model) {
		log.info("language: "+language.toString());
		for(String lang : language) {
			log.info("language values: "+lang);
		}
		model.addAttribute("language", language);
		return "exam02List";
	}
	
	@GetMapping("/exam02Array")
	public String exam02Array(@RequestParam("hobby")  String[] hobby,  Model model) {
		log.info("array hobby: "+Arrays.toString(hobby));
		model.addAttribute("hobby", hobby);
		
		return "exam02Array";
	}
	
	@GetMapping("/exam02Bean")
	public String exam02Bean(SampleDTOList list) {
		log.info("list dtoList: "+list);
		
		return "exam02Bean";
	}
	
	@GetMapping("/exam03")
	public String exam03(@ModelAttribute SampleDTO dto, String num,  Model model ) {
		model.addAttribute("dto", dto);
		model.addAttribute("num", num);
		
		return "exam03";
	}
	
	@GetMapping("/exam04")
	@ResponseBody
	/* @ResponseBody: 일반적인 JSP와 같은 뷰로 전달하는 것이 아닌, 데이터 자체를 전달하기 위한 어노테이션.
	 * 주로 ajax와 함께 사용된다. */
	public SampleDTO exam04() {
		log.info("/exam04.......");
		
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("홍길동");
		
		return dto;
	}
	
	@GetMapping("/exam05")
	public ResponseEntity<String> exam05(){
	//반환형이 ResponseEntity클래스이며, String 형태로 Json으로 반환하겠다.
	/* ResponseEntity객체는 개발자가 직접 결과 데이터와 HTTP 상태 코드를 직접 제어할 수 있는 클래스이다.  */
		log.info("/exam05.........");
		
		// {"name": "홍길동", "email": "javauser@naver.com"}
		String msg = "{\"name\": \"홍길동\", \"email\": \"javauser@naver.com\"}";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json;charset=UTF-8");
		
		return new ResponseEntity<>(msg,header,HttpStatus.OK);
	}
	
	/*
	 * @GetMapping(value ="/exam06", produces =
	 * MediaType.APPLICATION_JSON_UTF8_VALUE) //produces : 매개변수 타입을 JSON으로 설정.
	 * 
	 * @ResponseBody//json으로 변환하겠다는 어노테이션. public SampleDTOList exam06() {
	 * SampleDTOList dataList = new SampleDTOList(); List<SampleDTO> data =
	 * dataList.getList(); //이미 ArrayList가 생성되었기 때문에 set이 아닌 getList를 불러와야 함.
	 * 
	 * data.add(new SampleDTO("홍길동", 30)); data.add(new SampleDTO("김철수", 49));
	 * 
	 * return dataList; }
	 */
	
	@GetMapping("/exam06")
	public String exam06() {
		log.info("/exam06 Get.........");
		
		return "sample/exam06";
	}
	
	@PostMapping(value="/exam06", produces="text/plain; charset=UTF-8")
	//Post방식으로 매핑잡기, 반환되는 타입이 단순 text이므로 produces잡아주어야 함.
	@ResponseBody
	//ajax를 사용하여 불러내는 데이터이므로 ResponseBody 어노테이션 명시하기.
	public String exam06(ExampleVO evo, Ticket tvo) {
		//매개변수의 evo, tvo는 변수 이름. 해당 클래스의 주솟값을 가져온다. 
		log.info("/exam06 Post.....");
		log.info("/ExampleVO : "+evo+"Ticket : "+tvo);
		
		return "확인";
		//해당 ajax success함수의 resultData로 반환되는 값임.
	}
}
