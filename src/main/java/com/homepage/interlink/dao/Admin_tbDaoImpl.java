package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Admin_tb;

@Repository
public class Admin_tbDaoImpl implements Admin_tbDao{
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public int insert(Admin_tb admin_tb) {
		return sst.insert("admin_tbs.insert", admin_tb);
	}

	@Override
	public int idcheck(String id) {
		return sst.selectOne("admin_tbs.idcheck", id);
	}

	@Override
	public Admin_tb selectUserInfo(Map<String, Object> map) {
		return sst.selectOne("admin_tbs.selectUserInfo", map);
	}

}
