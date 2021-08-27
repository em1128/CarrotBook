package com.team.carrot.vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class LoginDTO {
	private String memberId;
	private String memberPw;
	private boolean useCookie;
	
	
	public LoginDTO() {
		
	}


	@Override
	public String toString() {
		return "LoginVO [memberId=" + memberId + ", memberPw=" + memberPw + ", useCookie=" + useCookie + "]";
	}
	
}
