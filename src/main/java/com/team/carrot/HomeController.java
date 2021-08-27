package com.team.carrot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		//유튜브 주소 
		//model.addAttribute("youtube", "https://www.youtube.com/results?search_query=");
		//로그인 테스트
		//model.addAttribute("user_id", "abc");
		return "home";
	}
	
}
