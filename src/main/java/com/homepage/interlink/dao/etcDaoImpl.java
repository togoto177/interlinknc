package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Sms_get;
import com.homepage.interlink.model.Sms_tb;
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

	@Override
	public int smsInsert(Sms_tb sms_tb) {
		return sst.insert("surem_admins.smsInsert", sms_tb);
	}

	@Override
	public List<Sms_tb> sms_select(Map<String, Object> paramMap) {
		return sst.selectList("surem_admins.sms_select", paramMap);
	}

	@Override
	public int sms_cnt(Map<String, Object> paramMap) {
		return sst.selectOne("surem_admins.sms_cnt", paramMap);
	}

	@Override
	public int smsGetInsert(Sms_get sms_get) {
		return sst.insert("surem_admins.smsGetInsert", sms_get);
	}

	@Override
	public int smsTbUpdate(Sms_tb sms_tb) {
		return sst.update("surem_admins.smsTbUpdate", sms_tb);
	}

}
