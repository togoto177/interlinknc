package com.homepage.interlink.dao;

import java.util.Map;

import com.homepage.interlink.model.Admin_tb;

public interface Admin_tbDao {
	int insert(Admin_tb admin_tb);
	int idcheck(String id);
	Admin_tb selectUserInfo(Map<String, Object> map);
}
