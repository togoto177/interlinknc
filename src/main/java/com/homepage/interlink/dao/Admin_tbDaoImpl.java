package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Admin_tb;

@Repository
public class Admin_tbDaoImpl implements Admin_tbDao{
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
    private SqlSession sqlSession;

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

	@Override
	public Admin_tb admin_read(Admin_tb admin) {
		return sst.selectOne("admin_tbs.admin_read", admin);
	}

	@Override
	public void admin_update(Admin_tb admin) {
		sst.update("admin_tbs.admin_update", admin);
	}

	@Override
	public boolean passwordCheck(Admin_tb admin) {
boolean result = false;
		
        int count = sqlSession.selectOne("admin_tbs.passwordCheck", admin);

        if(count == 1) result = true;
        
        return result;
	}

	@Override
	public void password_update(Admin_tb admin) {
		sst.update("admin_tbs.password_update", admin);
		
	}

}
