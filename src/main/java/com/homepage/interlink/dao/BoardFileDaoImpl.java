package com.homepage.interlink.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.homepage.interlink.model.BoardFile;

@Repository("boardFileDao")
public class BoardFileDaoImpl implements BoardFileDao {
	
	@Inject
    SqlSession SqlSession;

	@Override
	public void file_insert(BoardFile boardFile) {
		SqlSession.insert("boardFiles.file_insert", boardFile);
		
	}
	
	
}