package com.homepage.interlink.dao;

import java.util.Map;

import com.homepage.interlink.model.Surem_admin;

public interface etcDao {
	Surem_admin surem_admin_select(Map<String, Object> paramMap);
	int smsMessage_id_select(Map<String, Object> paramMap);
}
