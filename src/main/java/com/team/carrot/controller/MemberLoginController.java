package com.team.carrot.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.carrot.service.MemberService;
import com.team.carrot.vo.LoginDTO;
import com.team.carrot.vo.MemberVO;


@Controller
@RequestMapping("/member/*")
public class MemberLoginController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberService service;
	
	@Inject
	public MemberLoginController(MemberService service) {
		this.service = service;
	}
	
	// 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(@ModelAttribute("loginDTO") LoginDTO loginDTO) throws Exception {
		return "/member/login";
	}
	
	// 로그인 post
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void postLogin(LoginDTO loginDTO, HttpSession session, Model model) throws Exception{
		logger.info("post login");
		
		MemberVO vo = service.login(loginDTO);
		
		if(vo == null || !BCrypt.checkpw(loginDTO.getMemberPw(), vo.getMemberPw())) {
			return;
		}
		model.addAttribute("member", vo);
	}
	
}