package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;

@Repository("boardFileDao")
public class BoardFileDaoImpl implements BoardFileDao {
	
	@Inject
    SqlSession SqlSession;

	@Override
	public void file_insert(BoardFile boardFile) {
		SqlSession.insert("boardFiles.file_insert", boardFile);
		
	}

	@Override
	public List<BoardFile> file_list(Map<String, Object> paramMap) {
		return SqlSession.selectList("boardFiles.file_list", paramMap);
	}

	@Override
	public void fileDeleteByBoardFile(BoardFile boardFile) {
		SqlSession.update("boardFiles.fileDeleteByBoardFile", boardFile);
		
	}

	
	
	
}