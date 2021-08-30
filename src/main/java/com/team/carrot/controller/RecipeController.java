package com.team.carrot.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.carrot.service.RecipeService;
import com.team.carrot.vo.RecipeVO;

@Controller
@RequestMapping("/recipe/*")
public class RecipeController {

	@Inject
	RecipeService service;
	
	//레시피 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		model.addAttribute("list",service.list());
		return "recipe/list";	
	}
	
	//레시피 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(RecipeVO vo, Model model) throws Exception{
		model.addAttribute("read", service.read(vo.getRecipe_bno()));
		return "recipe/readView";
	}
	
	//레시피 목록 조회
	@RequestMapping(value = "/list_cate", method = RequestMethod.GET)
	public String read_cate(RecipeVO vo, Model model) throws Exception{
		model.addAttribute("list_cate",service.list_cate(vo.getRecipe_category()));
		return "recipe/list_cate";	
	}
	
}
