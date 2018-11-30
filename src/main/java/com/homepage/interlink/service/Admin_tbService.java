package com.homepage.interlink.service;

import java.util.Map;

import com.homepage.interlink.model.Admin_tb;

public interface Admin_tbService {
	int insert(Admin_tb admin_tb);
	int idcheck(String id);
	Admin_tb selectUserInfo(Map<String, Object> map);
}
