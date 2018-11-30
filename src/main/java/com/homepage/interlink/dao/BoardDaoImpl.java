package com.homepage.interlink.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.homepage.interlink.model.Board;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {
	
	@Inject
    SqlSession SqlSession;
	
	
	@Override
	public void board_insert(Board board) { 
		SqlSession.insert("boards.board_insert", board);	
		}

	@Override
	public Board board_read(int board_seq) {
		
		return SqlSession.selectOne("boards.board_read", board_seq);
		
	}
	
}