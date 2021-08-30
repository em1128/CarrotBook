package com.team.carrot.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class RecipeVO {
	
	private int recipe_bno;
    private String recipe_title;
    private String ingredients;
    private String directions;
    private String recipe_category;
    
	public RecipeVO(int recipe_bno, String recipe_title, String ingredients, String directions,
			String recipe_category) {
		super();
		this.recipe_bno = recipe_bno;
		this.recipe_title = recipe_title;
		this.ingredients = ingredients;
		this.directions = directions;
		this.recipe_category = recipe_category;
	}
	@Override
	public String toString() {
		return "RecipeVO [recipe_bno=" + recipe_bno + ", recipe_title=" + recipe_title + ", ingredients=" + ingredients
				+ ", directions=" + directions + ", recipe_category=" + recipe_category + "]";
	}
    
    
}
