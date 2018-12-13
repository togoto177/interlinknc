package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.homepage.interlink.model.Admin_tb;

public interface Admin_tbService {
	int insert(Admin_tb admin_tb);
	int idcheck(String id);
	Admin_tb selectUserInfo(Map<String, Object> map);
	Admin_tb admin_read(Admin_tb admin); //관리자정보 읽기
	void admin_update(Admin_tb admin); //관리자정보 수정
	boolean passwordCheck(Admin_tb admin); //비밀번호확인체크
	void password_update(Admin_tb admin); //관리자패스워드 수정
	List<Admin_tb> employee_list(Map<String, Object> paramMap); //사원관리 목록 출력
	public int employee_cnt(Map<String, Object> paramMap); //사원관리 전체 페이지 수
	public int wait_cnt(Map<String, Object> paramMap); //회원가입 대기자 수
	public int employee_delete(int ad_seq);
	List<Admin_tb> wait_list(Map<String, Object> paramMap);
	public int wait_admit(Admin_tb admin_tb);
}
