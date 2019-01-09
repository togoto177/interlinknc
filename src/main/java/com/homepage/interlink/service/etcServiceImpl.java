package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.etcDao;
import com.homepage.interlink.model.Sms_get;
import com.homepage.interlink.model.Sms_tb;
import com.homepage.interlink.model.Surem_admin;

@Service
public class etcServiceImpl implements etcService {
	
	@Autowired
	private etcDao etc;

	@Override
	public Surem_admin surem_admin_select(Map<String, Object> paramMap) {
		return etc.surem_admin_select(paramMap);
	}

	@Override
	public int smsMessage_id_select(Map<String, Object> paramMap) {
		return etc.smsMessage_id_select(paramMap);
	}

	@Override
	public int smsInsert(Sms_tb sms_tb) {
		return etc.smsInsert(sms_tb);
	}

	@Override
	public List<Sms_tb> sms_select(Map<String, Object> paramMap) {
		return etc.sms_select(paramMap);
	}

	@Override
	public int sms_cnt(Map<String, Object> paramMap) {
		return etc.sms_cnt(paramMap);
	}

	@Override
	public int smsGetInsert(Sms_get sms_get) {
		return etc.smsGetInsert(sms_get);
	}

	@Override
	public int smsTbUpdate(Sms_tb sms_tb) {
		return etc.smsTbUpdate(sms_tb);
	}
	
}
