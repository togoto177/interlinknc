package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.Admin_tbDao;
import com.homepage.interlink.model.Admin_tb;

@Service
public class Admin_tbServiceImpl implements Admin_tbService {
	
	@Autowired
	private Admin_tbDao ad;

	@Override
	public int insert(Admin_tb admin_tb) {
		return ad.insert(admin_tb);
	}

	@Override
	public int idcheck(String id) {
		return ad.idcheck(id);
	}

	@Override
	public Admin_tb selectUserInfo(Map<String, Object> map) {
		return ad.selectUserInfo(map);
	}

}
