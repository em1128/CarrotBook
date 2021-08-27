package com.team.carrot.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.carrot.vo.LoginDTO;
import com.team.carrot.vo.MemberVO;


@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final String NAMESPACE = "memberMapper";
	private final SqlSession sql;
	
	@Inject 
	public MemberDAOImpl(SqlSession sql) {
		this.sql = sql;
	}

	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert(NAMESPACE + ".register", vo);
	}
	//로그인 처리
	@Override
	public MemberVO login(LoginDTO loginDTO) throws Exception {
		return sql.selectOne(NAMESPACE + ".login", loginDTO);
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
	
	@Override
	public int change_pw(MemberVO vo) throws Exception {
		return sql.update("memberMapper.change_pw", vo);
	}
	


}