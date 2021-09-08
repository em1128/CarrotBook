package com.team.carrot.service;

import java.util.List;

import com.team.carrot.vo.ScheduleVO;

public interface ScheduleService {

	void create(ScheduleVO scheduleVO) throws Exception;

	ScheduleVO read(int bno) throws Exception;

	void update(ScheduleVO scheduleVO) throws Exception;

	void delete(int bno) throws Exception;

	List<ScheduleVO> readAll(String memberId) throws Exception;

}
