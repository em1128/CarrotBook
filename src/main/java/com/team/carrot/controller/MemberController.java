package com.team.carrot.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.carrot.service.MemberService;
import com.team.carrot.vo.MemberVO;


@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		service.register(vo);
		return "/member/login";
	}
	
	// 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception {
		logger.info("get login");
	}
	
	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/login";
		}else {
			session.setAttribute("member", login);
			return "redirect:/member/myPage";
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "home";
	}
	
	// 아이디 찾기 get
	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public void getFind_id() throws Exception {
		logger.info("get find id");
	}
	
	// 아이디 찾기 post
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public String postFind_id(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post find id");
		
		HttpSession session = req.getSession();
		MemberVO find_id = service.find_id(vo);
		
		if(find_id == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "/member/find_id";
		}else {
			session.setAttribute("member", find_id);
			return "redirect:/member/check_id";
		}
	}
	// 아이디 확인 get
	@RequestMapping(value = "/check_id", method = RequestMethod.GET)
	public void check_id() throws Exception {
		logger.info("check id");
	}
	
	//마이페이쥐잉
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPage() throws Exception {
		logger.info("myPage");
	}
	
	//비밀번호 찾기 get
	@RequestMapping(value = "/find_pw", method = RequestMethod.GET)
	public void find_pw() throws Exception {
		logger.info("find pw");
	}
	
	//비밀번호 찾기 post
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public String postFind_pw(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post find pw");
		
		HttpSession session = req.getSession();
		MemberVO find_pw = service.find_pw(vo);
		
		if(find_pw == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "/member/find_pw";
		}else {
			session.setAttribute("member", find_pw);
			return "redirect:/member/change_pw";
		}
	}
	
	//비밀번호 변경 get
	@RequestMapping(value = "/change_pw", method = RequestMethod.GET)
	public String get_change_pw() throws Exception {
		return "member/change_pw";
	}	

}