package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Sms_tb;
import com.homepage.interlink.model.Surem_admin;

public interface etcService {
	Surem_admin surem_admin_select(Map<String, Object> paramMap);
	int smsMessage_id_select(Map<String, Object> paramMap);
	int smsInsert(Sms_tb sms_tb);
	List<Sms_tb> sms_select(Map<String, Object> paramMap);
	int sms_cnt(Map<String, Object> paramMap);
}
