package com.team.carrot.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.team.carrot.dao.MemberDAO;
import com.team.carrot.vo.LoginDTO;
import com.team.carrot.vo.MemberVO;



@Service
public class MemberServiceImpl implements MemberService {
	
	private final MemberDAO dao;
	
	@Inject 
	public MemberServiceImpl(MemberDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public MemberVO login(LoginDTO loginDTO) throws Exception {
		return dao.login(loginDTO);
	}

	@Override
	public MemberVO find_id(MemberVO vo) throws Exception {
		return dao.find_id(vo);
	}

	@Override
	public MemberVO find_pw(MemberVO vo) throws Exception {
		return dao.find_pw(vo);
	}

	@Override
	public int change_pw(MemberVO vo) throws Exception {
		return dao.change_pw(vo);
	}

	@Override
	public int update_member(MemberVO vo) throws Exception {
		return dao.update_member(vo);
		
	}

	@Override
	public int delete_member(MemberVO vo) throws Exception {
		return dao.delete_member(vo);
	}

}