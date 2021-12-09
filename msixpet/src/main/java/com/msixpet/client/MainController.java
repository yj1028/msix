package com.msixpet.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class MainController {

	@GetMapping(value = "/mainPage")
	public String mainPage() {
		
		return "main/mainPage";
	}

}
