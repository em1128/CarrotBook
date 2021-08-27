package com.team.carrot.service;

import com.team.carrot.vo.LoginDTO;
import com.team.carrot.vo.MemberVO;

public interface MemberService {
	
	void register(MemberVO vo) throws Exception;
	
	MemberVO login(LoginDTO loginDTO) throws Exception;
	
	public MemberVO find_id(MemberVO vo) throws Exception;
	
	public MemberVO find_pw(MemberVO vo) throws Exception;
	
	public int change_pw(MemberVO vo) throws Exception;


}
