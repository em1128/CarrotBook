package com.team.carrot.dao;

import java.util.List;

import com.team.carrot.vo.RecipeVO;

public interface RecipeDAO{
	
	// 레시피 목록 조회
	public List<RecipeVO> list() throws Exception;
	
	// 레시피 조회
	public RecipeVO read(int recipe_bno) throws Exception;
	
	// 레시피 목록 조회
	public List<RecipeVO> list_cate(String recipe_category) throws Exception;
	
	public RecipeVO read_ingredients(int recipe_bno) throws Exception;
}
