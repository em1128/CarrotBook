package com.team.carrot.service;

import com.team.carrot.vo.LoginDTO;
import com.team.carrot.vo.MemberVO;

public interface MemberService {
	
	void register(MemberVO vo) throws Exception;
	
	MemberVO login(LoginDTO loginDTO) throws Exception;
	
	public MemberVO find_id(MemberVO vo) throws Exception;
	
	public MemberVO find_pw(MemberVO vo) throws Exception;
	
	public int change_pw(MemberVO vo) throws Exception;

	public int update_member(MemberVO vo) throws Exception;
	
	public int delete_member(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public int passChk(MemberVO vo) throws Exception;
	
}
