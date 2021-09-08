package com.team.carrot.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.team.carrot.vo.ScheduleVO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {

	@Inject
	private SqlSession sqlSession;
	

	// 일정 추가
	@Override
	public void create(ScheduleVO scheduleVO) throws Exception {
		sqlSession.insert("scheduleMapper.create", scheduleVO);
	}
	
	// 일정 조회
	@Override
	public ScheduleVO read(int bno) throws Exception {
		return sqlSession.selectOne("scheduleMapper.read", bno);
	}	
	
	// 전체 일정 조회
	@Override
	public List<ScheduleVO> readAll(String memberId) throws Exception {
		return sqlSession.selectList("scheduleMapper.readAll", memberId);
	}	
	
	// 일정 수정
	@Override
	public void update(ScheduleVO scheduleVO) throws Exception {
		sqlSession.update("scheduleMapper.update", scheduleVO);
	}	
	
	// 일정 삭제
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("scheduleMapper.delete", bno);
	}
}
