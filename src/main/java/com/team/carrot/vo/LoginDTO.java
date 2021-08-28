package com.team.carrot.vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class LoginDTO {
	private String memberId;
	private String memberPw;
	private boolean useCookie;
	private String memberName;
	private String phone;
	private String birthday;
	private String gender;
	private String sms;
	
	public LoginDTO() {
		
	}

	@Override
	public String toString() {
		return "LoginDTO [memberId=" + memberId + ", memberPw=" + memberPw + ", useCookie=" + useCookie
				+ ", memberName=" + memberName + ", phone=" + phone + ", birthday=" + birthday + ", gender=" + gender
				+ ", sms=" + sms + "]";
	}

	public LoginDTO(String memberId, String memberPw, boolean useCookie, String memberName, String phone,
			String birthday, String gender, String sms) {
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.useCookie = useCookie;
		this.memberName = memberName;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
		this.sms = sms;
	}

}
