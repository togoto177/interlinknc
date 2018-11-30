package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

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
	
}