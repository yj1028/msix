package com.msixpet.client.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.msixpet.client.member.service.MemberService;
import com.msixpet.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService;
	
	// 회원가입페이지
	@RequestMapping(value="/memberJoin")
	public String joinForm() {
		log.info("join 호출 성공");
		
		return "member/memberJoin";	
	}
	
	// 아이디 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String idCheck(String m_id) {
		log.info("idCheck 호출 성공");
		log.info("전달받은 id: "+m_id);
		
		int result = memberService.idCheck(m_id);
		log.info("결과 : " + result);
		
		return String.valueOf(result);
	}
	
	// 회원가입
	@RequestMapping(value="/memberInsert", method=RequestMethod.POST)
	public String memberInsert(MemberVO mvo, Model model) throws Exception {
		log.info("memberInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = memberService.memberInsert(mvo);
		if(result == 1) {
			url = "/login/loginForm";
		} else {
			url = "/main/main2";
		}
		
		return "redirect:"+url;
	}
}
