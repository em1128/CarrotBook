package com.team.carrot.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.carrot.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject SqlSession sql;

	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.login", vo);
	}
	//아이디찾기
	@Override
	public MemberVO find_id(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.find_id", vo);
	}
	//비밀번호 찾기
	@Override
	public MemberVO find_pw(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.find_pw", vo);
	}

}