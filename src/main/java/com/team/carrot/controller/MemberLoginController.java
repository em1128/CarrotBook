package com.team.carrot.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.carrot.service.MemberService;
import com.team.carrot.vo.LoginDTO;
import com.team.carrot.vo.MemberVO;


@Controller
@RequestMapping("/member/*")
public class MemberLoginController {
	private MemberService service;
	
	@Inject
	public MemberLoginController(MemberService service) {
		this.service = service;
	}
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(@ModelAttribute("loginDTO") LoginDTO loginDTO) throws Exception {
		return "/member/login";
	}
	
	// 로그인 post
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void postLogin(LoginDTO loginDTO, HttpSession session,Model model) throws Exception{
		MemberVO vo = service.login(loginDTO);
		if(vo==null || !BCrypt.checkpw(loginDTO.getMemberPw(), vo.getMemberPw())) {
			return;
		}
		model.addAttribute("member", vo);
	}
	
	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public boolean passChk(LoginDTO loginDTO) throws Exception {
		MemberVO vo = service.login(loginDTO);
		boolean pwdChk = BCrypt.checkpw(loginDTO.getMemberPw(), vo.getMemberPw());
		return pwdChk;
	}
}