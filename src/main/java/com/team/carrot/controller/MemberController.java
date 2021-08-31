package com.team.carrot.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.carrot.service.MemberService;
import com.team.carrot.vo.MemberVO;


@Controller
@RequestMapping("/member/*")
public class MemberController {

	private final MemberService service;
	
	@Inject
	public MemberController(MemberService service) {
		this.service = service;
	}
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		return "/member/register";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
	
	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo, RedirectAttributes rttr) throws Exception {
		int result = service.idChk(vo);
		try {
			if(result == 1) {	//id가 중복되면
				return "/member/register";
			}else if(result == 0) {	//중복되지 않으면 회원가입가능
				String inputPass = vo.getMemberPw();
				String pwd = pwdEncoder.encode(inputPass);
				vo.setMemberPw(pwd);
				service.register(vo);
				rttr.addFlashAttribute("msg", "ok");
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/member/login";
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "/member/logout";
	}
	
	// 아이디 찾기 get
	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public void get_find_id() throws Exception {

	}
	
	// 아이디 찾기 post
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public String post_find_id(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{

		HttpSession session = req.getSession();
		MemberVO find_id = service.find_id(vo);
		
		if(find_id == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/member/find_id";
		}else {
			session.setAttribute("member", find_id);
			return "redirect:/member/check_id";
		}
	}
	// 아이디 확인 get
	@RequestMapping(value = "/check_id", method = RequestMethod.GET)
	public void check_id(HttpSession session) throws Exception {
	}
	
	//마이페이쥐잉
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public void myPage() throws Exception {
	}
	
	//비밀번호 찾기 get
	@RequestMapping(value = "/find_pw", method = RequestMethod.GET)
	public String get_find_pw() throws Exception {
		return "member/find_pw";
	}
	
	//비밀번호 찾기 post
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public String post_find_pw(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		
		HttpSession session = req.getSession();
		MemberVO find_pw = service.find_pw(vo);
		
		System.out.println("==================");
		System.out.println(vo.getMemberId());
		System.out.println("==================");
		
		if(find_pw == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/member/find_pw";
		}else {
			session.setAttribute("member", find_pw);
			return "redirect:/member/change_pw_form";
		}
	}
	
	//비밀번호 변경 get
	@RequestMapping(value = "/change_pw_form", method = RequestMethod.GET)
	public String get_change_pw_form() throws Exception {
		return "member/change_pw_form";		
	}	

	//비밀번호 변경 post
	@RequestMapping(value="/change_pw", method = RequestMethod.POST)
	public String post_change_pw(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		System.out.println("==================");
		System.out.println(vo.getMemberId());
		System.out.println("==================");
		
		String inputPass = vo.getMemberPw();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setMemberPw(pwd);
		int msg_pw = service.change_pw(vo);	
		
		if(msg_pw!=1) {	//안될때
			rttr.addFlashAttribute("msg_pw","0");
			return "redirect:/member/change_pw_form";
		}else { //될때
			rttr.addFlashAttribute("msg_pw","1");
			session.invalidate();
			return "redirect:/member/login";
		}
	}
	
	//회원정보 수정 get
	@RequestMapping(value = "/update_member_form", method = RequestMethod.GET)
	public String get_update_member() throws Exception {
		return "member/update_member_form";		
	}	
	
	//회원정보 수정 post
	@RequestMapping(value = "/update_member", method = RequestMethod.POST)
	public String post_update_member(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		int msg_update = service.update_member(vo);
		
		if(msg_update!=1) {	//안될때
			rttr.addFlashAttribute("msg_update","0");
			return "redirect:/member/update_member_form";
		}else { //될때
			rttr.addFlashAttribute("msg_update","1");
			session.invalidate();
			return "redirect:/member/login";
		}
	}
	//회원 탈퇴 get
	@RequestMapping(value = "/delete_member_form", method = RequestMethod.GET)
	public String get_delete_member() throws Exception {
		return "member/delete_member_form";		
	}	
	
	//회원 탈퇴 post
	@RequestMapping(value = "/delete_member", method = RequestMethod.POST)
	public String post_delete_member(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		int msg_delete = service.delete_member(vo);
		
		if(msg_delete!=1) {	//안될때
			rttr.addFlashAttribute("msg_delete","0");
			return "redirect:/member/delete_member_form";
		}else { //될때
			rttr.addFlashAttribute("msg_delete","1");
			session.invalidate();
			return "redirect:/member/login";
		}
	}
		
}