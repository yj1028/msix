package com.msix.admin.signin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String signin(@ModelAttribute SigninVO svo, Model model) {
		log.info("signin 호출 성공");
		
		int result = signinService.signin(svo);
		String url = "";
		
		if(result == 1) {
			url = "/admin/mainPage";
		}else {
			url = "adminLogin";
		}
		
		return url;
	}
}
