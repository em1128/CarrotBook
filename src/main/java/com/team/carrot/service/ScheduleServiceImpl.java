package com.team.carrot.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.carrot.dao.ScheduleDAO;
import com.team.carrot.vo.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Inject
	private ScheduleDAO dao;

	// 일정 추가
	@Override
	public void create(ScheduleVO scheduleVO) throws Exception {
		dao.create(scheduleVO);
	}
	
	// 일정 조회
	@Override
	public ScheduleVO read(int bno) throws Exception{
		return dao.read(bno);
	}
	
	// 일정 전체 조회
	@Override
	public List<ScheduleVO> readAll() throws Exception{
		return dao.readAll();
	}
	
	// 일정 수정
	@Override
	public void update(ScheduleVO scheduleVO) throws Exception {
		dao.update(scheduleVO);
	}
	
	// 일정 삭제
	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}
	
}
