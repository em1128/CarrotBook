package com.team.carrot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
   
   @RequestMapping("/scheduler")
   public String Calendar() {
      return "scheduler/calendar";
   }

}