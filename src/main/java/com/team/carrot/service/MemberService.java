package com.team.carrot.service;

import com.team.carrot.vo.MemberVO;

public interface MemberService {
	
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
}
