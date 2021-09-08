package com.team.carrot.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.carrot.service.ScheduleService;
import com.team.carrot.vo.MemberVO;
import com.team.carrot.vo.ScheduleVO;

@Controller
@RequestMapping("/scheduler/*")
public class CalendarController {
   
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Inject
	ScheduleService service;
	
	@RequestMapping("/calendar")
	public String Calendar(Model model, HttpSession session) throws Exception {
		logger.info("list");
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		if (mvo == null) {
			System.out.println("스케줄러는 회원만 사용 가능한 기능");
			return "member/login";
		}
		List<ScheduleVO> list = service.readAll(mvo.getMemberId());
		for(ScheduleVO svo : list) {
			System.out.println(svo);
		}
		
		model.addAttribute("schedule", list);
		return "scheduler/calendar";
	}

   @RequestMapping("/modalInsert")
   public String modalInsert(ScheduleVO svo, HttpSession session) throws Exception {
	   logger.info("insert");
	   String memberId = ((MemberVO) session.getAttribute("login")).getMemberId();
	   svo.setMemberId(memberId);
	   service.create(svo);
	   System.out.println(svo);
	   return "redirect:/scheduler/calendar";
   }

   @RequestMapping(value = "/delete", method = RequestMethod.GET)
   public String delete(int bno) throws Exception {
	   logger.info("delete");
	   System.out.println(service.read(bno));
	   service.delete(bno);
	   return "redirect:/scheduler/calendar";
   }

}