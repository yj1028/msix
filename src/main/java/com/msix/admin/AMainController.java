package com.msix.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AMainController {
	
	@GetMapping(value = "/mainPage")
	public String mainPage() {
		
		return "amain/mainPage";
	}
	
	@GetMapping(value="/msixAdmin")
	public String adminLogin() {
		
		return "msixAdmin";
	}
}
