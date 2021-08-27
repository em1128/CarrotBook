package com.team.carrot.dao;

import com.team.carrot.vo.LoginDTO;
import com.team.carrot.vo.MemberVO;

public interface MemberDAO {
	
	//로그인 처리
	MemberVO login(LoginDTO loginDTO) throws Exception;
	
	//회원가입
	public void register(MemberVO vo) throws Exception;
	
	//아이디 찾기
	public MemberVO find_id(MemberVO vo) throws Exception;
	
	//비밀번호 찾기
	public MemberVO find_pw(MemberVO vo) throws Exception;
	
	//비밀번호 변경
	public int change_pw(MemberVO vo) throws Exception;
	
	//회원정보 수정
	public int update_member(MemberVO vo) throws Exception;
	
	//회원 탈퇴
	public int delete_member(MemberVO vo) throws Exception;

}	

