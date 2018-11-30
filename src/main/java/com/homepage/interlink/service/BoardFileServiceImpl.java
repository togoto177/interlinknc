package com.homepage.interlink.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.homepage.interlink.dao.BoardFileDao;
import com.homepage.interlink.model.BoardFile;

@Service("boardFileService")
public class BoardFileServiceImpl implements BoardFileService{
	
	@Resource(name="boardFileDao")
	private BoardFileDao boardFileDao;

	@Override
	public void file_insert(BoardFile boardFile) {
		boardFileDao.file_insert(boardFile);
		
	}
	
}
