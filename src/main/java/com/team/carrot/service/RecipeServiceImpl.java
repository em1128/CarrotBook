package com.team.carrot.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.carrot.dao.RecipeDAO;
import com.team.carrot.vo.RecipeVO;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Inject
	private RecipeDAO dao;

	@Override
	public List<RecipeVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public RecipeVO read(int recipe_bno) throws Exception {
		return dao.read(recipe_bno);
	}

	@Override
	public List<RecipeVO> list_cate(String recipe_category) throws Exception {
		return dao.list_cate(recipe_category);
	}

	@Override
	public RecipeVO read_ingredients(int recipe_bno) throws Exception {
		return dao.read_ingredients(recipe_bno);
	}

}
