package com.team.carrot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		//��Ʃ�� �ּ� 
		//model.addAttribute("youtube", "https://www.youtube.com/results?search_query=");
		//�α��� �׽�Ʈ
		//model.addAttribute("user_id", "abc");
		return "home";
	}
	
}
