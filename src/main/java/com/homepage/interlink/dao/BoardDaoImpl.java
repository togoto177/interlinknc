package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.homepage.interlink.model.Board;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {
	
	@Inject
    SqlSession SqlSession;
	
	
	@Override
	public void board_insert(Board board) { 
		SqlSession.insert("boards.board_insert", board);	
		}

	@Override
	public Board board_read(Board board) {
		
		return SqlSession.selectOne("boards.board_read", board);
		
	}

	@Override
	public List<Board> board_list(Map<String, Object> paramMap) {
		return SqlSession.selectList("boards.board_list", paramMap);
	}

	@Override
	public int board_cnt(Map<String, Object> paramMap) {
		return SqlSession.selectOne("boards.board_cnt", paramMap);
	}

	@Override
	public void board_update(Board board) {
		SqlSession.update("boards.board_update", board);
	}

	@Override
	public void board_delete(Board board) {
		SqlSession.update("boards.board_delete", board);
	}

	@Override
	public void portfolio_insert(Board board2) {
		SqlSession.insert("boards.portfolio_insert", board2);	
	}
	
}