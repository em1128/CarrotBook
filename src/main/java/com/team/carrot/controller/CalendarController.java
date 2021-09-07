package com.team.carrot.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.carrot.service.ScheduleService;
import com.team.carrot.vo.ScheduleVO;

@Controller
@RequestMapping("/scheduler/*")
public class CalendarController {
   
	@Inject
	ScheduleService service;
	
	@RequestMapping("/calendar")
	public String Calendar(Model model) throws Exception {
		List<ScheduleVO> list = service.readAll();
		for(ScheduleVO svo : list) {
			System.out.println(svo);
		}
		
		model.addAttribute("schedule", list);
		return "scheduler/calendar";
	}

   @RequestMapping("/modal")
   public String modal() {
	   return "modal";
   }

   @RequestMapping("/modalInsert")
   public String modalInsert(Model model, ScheduleVO vo) throws Exception {
	   service.create(vo);
	   model.addAttribute("vo", vo);
	   return "redirect:/scheduler/calendar";
   }

   @RequestMapping(value = "/delete", method = RequestMethod.GET)
   public String delete(int bno) throws Exception {
	   System.out.println(service.read(bno));
	   service.delete(bno);
	   return "redirect:/scheduler/calendar";
   }

}