package com.team.carrot.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.carrot.vo.RecipeVO;

@Repository
public class RecipeDAOImpl implements RecipeDAO {
	
	@Inject
	private SqlSession sql;

	@Override
	public List<RecipeVO> list() throws Exception {
		return sql.selectList("recipeMapper.list");
	}

	@Override
	public RecipeVO read(int recipe_bno) throws Exception {
		return sql.selectOne("recipeMapper.read", recipe_bno);
	}

	@Override
	public List<RecipeVO> list_cate(String recipe_category) throws Exception {
		return sql.selectList("recipeMapper.list_cate", recipe_category);
	}

}
