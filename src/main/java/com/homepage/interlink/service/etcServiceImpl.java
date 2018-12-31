package com.homepage.interlink.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.etcDao;
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
	
}
