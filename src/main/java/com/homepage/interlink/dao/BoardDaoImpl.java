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
	public void portfolio_insert(Board board) {
		SqlSession.insert("boards.portfolio_insert", board);	
	}

	@Override
	public void customer_insert(Board board) {
		SqlSession.insert("boards.customer_insert", board);
		
	}

	@Override
	public List<Board> download_list(Map<String, Object> paramMap) {
	 	return SqlSession.selectList("boards.download_list", paramMap);
	}

	@Override
	public int download_cnt(Map<String, Object> paramMap) {
		return SqlSession.selectOne("boards.download_cnt", paramMap);
	}

	@Override
	public int download_hit(int board_seq) {
		return SqlSession.update("boards.download_hit", board_seq);
	}

	@Override
	public List<Board> portfolio_list(Map<String, Object> paramMap) {
		return SqlSession.selectList("boards.portfolio_list", paramMap);
	}

	@Override
	public Board port_pf_Year(String pf_year) {
		return SqlSession.selectOne("boards.port_pf_Year", pf_year);
	}

	@Override
	public String thisYear(Map<String, Object> paramMap) {
		return SqlSession.selectOne("boards.thisYear", paramMap);
	}
	
}