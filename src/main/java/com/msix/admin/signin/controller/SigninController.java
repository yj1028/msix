package com.msix.admin.signin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.msix.admin.signin.service.SigninService;
import com.msix.admin.signin.vo.SigninVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/signin/*")
@AllArgsConstructor
public class SigninController {

	private SigninService signinService;
	
	@PostMapping(value = "/signin")
	public String signin(@ModelAttribute SigninVO svo, HttpServletRequest req, Model model) {
		log.info("signin 호출 성공");
		
		HttpSession session = req.getSession();
		int result = signinService.signin(svo);
		String url = "";
		
		if(result == 1) {
			session.setAttribute("adminLogin", svo);
			url = "amain/mainPage";
		}else {
			model.addAttribute("errorMsg", "아이디 혹은 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
			url = "msixAdmin";
		}
		
		return "redirect:"+url;
	}
	
	@GetMapping(value = "/signout")
	public String signout(HttpServletRequest request) {
		log.info("signout 호출 성공");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "msixAdmin";
	}
}
