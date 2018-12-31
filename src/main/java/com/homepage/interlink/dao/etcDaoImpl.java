package com.homepage.interlink.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Surem_admin;

@Repository
public class etcDaoImpl implements etcDao {
	
	@Autowired
	private SqlSessionTemplate sst;

	@Override
	public Surem_admin surem_admin_select(Map<String, Object> paramMap) {
		return sst.selectOne("surem_admins.surem_admin_select", paramMap);
	}

	@Override
	public int smsMessage_id_select(Map<String, Object> paramMap) {
		return sst.selectOne("surem_admins.smsMessage_id_select", paramMap);
	}

}
