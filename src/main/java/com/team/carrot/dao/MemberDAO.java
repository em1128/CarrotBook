package com.team.carrot.dao;

import com.team.carrot.vo.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public void register(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//아이디 찾기
	public MemberVO find_id(MemberVO vo) throws Exception;
	
	//비밀번호 찾기
	public MemberVO find_pw(MemberVO vo) throws Exception;
	
	//비밀번호 변경
	public void change_pw(MemberVO vo) throws Exception;

}	

