package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Admin_tb;

public interface Admin_tbDao {
	int insert(Admin_tb admin_tb);
	int idcheck(String id);
	Admin_tb selectUserInfo(Map<String, Object> map);
	Admin_tb admin_read(Admin_tb admin);
	void admin_update(Admin_tb admin);
	boolean passwordCheck(Admin_tb admin);
	void password_update(Admin_tb admin);
	List<Admin_tb> employee_list(Map<String, Object> paramMap);
	public int employee_cnt(Map<String, Object> paramMap);
	public int wait_cnt(Map<String, Object> paramMap);
	public int employee_delete(int ad_seq);
	List<Admin_tb> wait_list(Map<String, Object> paramMap);
	public int wait_admit(Admin_tb admin_tb);
}
