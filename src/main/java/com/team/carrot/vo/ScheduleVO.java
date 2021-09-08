package com.team.carrot.vo;

import java.util.Date;

public class ScheduleVO {

	private int bno;
	private String memberId;	// 로그인한 회원의 스케줄과 연동
	private String routine;
	private String schdate;
	private String start_time;
	private String end_time;
	private String allday;
	private String norpt;
	private String dayrpt;
	private String weekrpt;
	private String monthrpt;
	private String yearrpt;
	private String memo;

	public ScheduleVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getRoutine() {
		return routine;
	}

	public void setRoutine(String routine) {
		this.routine = routine;
	}

	public String getSchdate() {
		return schdate;
	}

	public void setSchdate(String schdate) {
		this.schdate = schdate;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getAllday() {
		return allday;
	}

	public void setAllday(String allday) {
		this.allday = allday;
	}

	public String getNorpt() {
		return norpt;
	}

	public void setNorpt(String norpt) {
		this.norpt = norpt;
	}

	public String getDayrpt() {
		return dayrpt;
	}

	public void setDayrpt(String dayrpt) {
		this.dayrpt = dayrpt;
	}

	public String getWeekrpt() {
		return weekrpt;
	}

	public void setWeekrpt(String weekrpt) {
		this.weekrpt = weekrpt;
	}

	public String getMonthrpt() {
		return monthrpt;
	}

	public void setMonthrpt(String monthrpt) {
		this.monthrpt = monthrpt;
	}

	public String getYearrpt() {
		return yearrpt;
	}

	public void setYearrpt(String yearrpt) {
		this.yearrpt = yearrpt;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "ScheduleVO [bno=" + bno + ", memberId=" + memberId + ", routine=" + routine + ", schdate=" + schdate
				+ ", start_time=" + start_time + ", end_time=" + end_time + ", allday=" + allday + ", norpt=" + norpt
				+ ", dayrpt=" + dayrpt + ", weekrpt=" + weekrpt + ", monthrpt=" + monthrpt + ", yearrpt=" + yearrpt
				+ ", memo=" + memo + "]";
	}

	public ScheduleVO(int bno, String memberId, String routine, String schdate, String start_time, String end_time,
			String allday, String norpt, String dayrpt, String weekrpt, String monthrpt, String yearrpt, String memo) {
		super();
		this.bno = bno;
		this.memberId = memberId;
		this.routine = routine;
		this.schdate = schdate;
		this.start_time = start_time;
		this.end_time = end_time;
		this.allday = allday;
		this.norpt = norpt;
		this.dayrpt = dayrpt;
		this.weekrpt = weekrpt;
		this.monthrpt = monthrpt;
		this.yearrpt = yearrpt;
		this.memo = memo;
	}

	
}