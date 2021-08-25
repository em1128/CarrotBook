package com.team.carrot.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MemberVO {

	private String memberId;
	private String memberPw;
	private String memberName;
	private String phone;
	private String birthday;
	private String gender;
	private String sms;
	private Date regDate;
	
	public MemberVO() {

	}

	public MemberVO(String memberId, String memberPw, String memberName, String phone, String birthday, String gender,
			String sms, Date regDate) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
		this.sms = sms;
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName + ", phone="
				+ phone + ", birthday=" + birthday + ", gender=" + gender + ", sms=" + sms + ", regDate=" + regDate
				+ "]";
	}
	
	
}