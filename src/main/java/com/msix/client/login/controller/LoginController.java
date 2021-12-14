package com.msix.client.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msix.client.member.service.MemberService;
import com.msix.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/login/*")
@Log4j
@AllArgsConstructor
public class LoginController {
	
	private MemberService memberService;
	
	
	// 로그인페이지
	@RequestMapping(value="/loginForm")
	public String loginForm() {
		log.info("loginForm 호출 성공");
		
		return "login/loginForm";
	}
	
	// 아이디찾기 페이지
	@RequestMapping(value="/selectIdForm")
	public String loginSelectId() {
		log.info("selectIdForm 호출 성공");
		
		return "login/selectId";
	}
	
	
	// 마이페이지 페이지
	@RequestMapping(value="/myPageForm")
	public String loginMyPage(MemberVO mvo, HttpSession session) {
		log.info("myPage 호출 성공");
		
		MemberVO vo = (MemberVO)session.getAttribute("login");
		mvo.setM_no(vo.getM_no());
		
		return "login/myPage";
	}
	
	// 로그인 구현
	@RequestMapping(value="/login", method = RequestMethod.POST) 
	public String login(MemberVO mvo, HttpServletRequest req, Model model) {
		log.info("login 호출 성공");
		String path = null;
		 
		HttpSession session = req.getSession();
		mvo = memberService.login(mvo);
		
		log.info("mvo : " + mvo);
		if(mvo == null) {
			model.addAttribute("errorMsg", "아이디 혹은 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			path = "login/loginForm";
		}else {
			session.setAttribute("login", mvo);
			path = "main/main";
		}
		
		return path;
	 }
	// 로그아웃 구현
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		log.info("logout 호출 성공");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "main/main";
	}
	
	// 아이디 찾기
	@RequestMapping(value="/selectId", method=RequestMethod.POST,produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String selectId(MemberVO mvo, Model model) {
		log.info("selectId 호출 성공");
		String result="";
		MemberVO vo = memberService.selectId(mvo);
		
		if(vo==null) {
			result = "없음";
		}else {
			result = vo.getM_id();
		}
		
		return result;
	}
	
	// 비밀번호찾기 페이지
	@RequestMapping(value="/selectPwdForm")
	public String loginSelectPwd() {
		log.info("selectPwdForm 호출 성공");
		
		return "login/selectPwd";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/selectPwd", method=RequestMethod.POST)
	public String selectPwd(@ModelAttribute MemberVO mvo, Model model) {
		log.info("selectPwd 호출 성공");
		String path = null;
		int result = memberService.selectPwd(mvo);
		
		model.addAttribute("mvo", mvo);
		
		log.info("결과 : "+result);
		if(result != 1) {
			model.addAttribute("errorMsg", "입력하신 정보는 틀린 정보입니다.");
			path = "login/selectPwd";
		}else {
			path = "login/rePasswd";
		}
		
		return path;
	}	
	
	// 비밀번호 수정
	@RequestMapping(value="/rePasswd", method=RequestMethod.POST)
	public String loginRePasswd(@ModelAttribute MemberVO mvo, RedirectAttributes ras, Model model) throws Exception{
		log.info("loginRePasswd 호출 성공");
		log.info("mvo : " + mvo);
		
		int result = 0;
		String url = "";
		
		result = memberService.rePasswd(mvo);
		
		ras.addAttribute("m_id", result);
		
		log.info("결과 : "+result);
		if(result == 1) {
			model.addAttribute("errorMsg", "비밀번호가 변경되었습니다.");
			url="login/loginForm";
		}else {
			model.addAttribute("errorMsg", "비밀번호를 다시 입력해주세요.");
			url="login/rePwdForm";
		}
		return url;
	}
	
}
