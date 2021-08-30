package com.team.carrot.service;

import java.util.List;

import com.team.carrot.vo.RecipeVO;

public interface RecipeService 
{
	// 레시피 목록 조회
	public List<RecipeVO> list() throws Exception;
	
	// 레시피 목록 조회
	public RecipeVO read(int recipe_bno) throws Exception;

}
