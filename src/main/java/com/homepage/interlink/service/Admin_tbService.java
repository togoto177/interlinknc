package com.homepage.interlink.service;

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
}
