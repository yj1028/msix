package com.msix.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class MainController {
	
	@GetMapping(value = "/mainPage")
	public String mainPage() {
		
		return "main/mainPage";
	}
	
	@GetMapping(value="/adminLogin")
	public String adminLogin() {
		
		return "adminLogin";
	}
}
