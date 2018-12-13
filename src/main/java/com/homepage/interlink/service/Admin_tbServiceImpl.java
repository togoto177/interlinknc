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

	@Override
	public Admin_tb admin_read(Admin_tb admin) {
		return ad.admin_read(admin);
	}

	@Override
	public void admin_update(Admin_tb admin) {
		ad.admin_update(admin);
	}

	@Override
	public boolean passwordCheck(Admin_tb admin) {
		return ad.passwordCheck(admin);
		
	}

	@Override
	public void password_update(Admin_tb admin) {
		ad.password_update(admin);
		
	}

	@Override
	public List<Admin_tb> employee_list(Map<String, Object> paramMap) {
		return ad.employee_list(paramMap);
	}

	@Override
	public int employee_cnt(Map<String, Object> paramMap) {
		return ad.employee_cnt(paramMap);
	}

	@Override
	public int wait_cnt(Map<String, Object> paramMap) {
		return ad.wait_cnt(paramMap);
	}

	@Override
	public int employee_delete(int ad_seq) {
		return ad.employee_delete(ad_seq);
	}

	@Override
	public List<Admin_tb> wait_list(Map<String, Object> paramMap) {
		return ad.wait_list(paramMap);
	}

	@Override
	public int wait_admit(Admin_tb admin_tb) {
		return ad.wait_admit(admin_tb);
		
	}
	
	
	

	
}
