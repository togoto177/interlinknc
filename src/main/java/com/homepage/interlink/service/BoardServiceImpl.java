package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.homepage.interlink.dao.BoardDao;
import com.homepage.interlink.model.Board;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@Override
	public void board_insert(Board board) {
		boardDao.board_insert(board);
	}

	@Override
	public Board board_read(Board board) {
		
		return boardDao.board_read(board);
		
	}

	@Override
	public List<Board> board_list(Map<String, Object> paramMap) {
		return boardDao.board_list(paramMap);
	}

	@Override
	public int board_cnt(Map<String, Object> paramMap) {
		return boardDao.board_cnt(paramMap);
	}

	@Override
	public void board_update(Board board) {
		boardDao.board_update(board);
	}

	@Override
	public void board_delete(Board board) {
		boardDao.board_delete(board);
	}

	@Override
	public void portfolio_insert(Board board) {
		boardDao.portfolio_insert(board);
	}

	@Override
	public void customer_insert(Board board) {
		boardDao.customer_insert(board);
	}

	@Override
	public List<Board> download_list(Map<String, Object> paramMap) {
		return boardDao.download_list(paramMap);
	}

	@Override
	public int download_cnt(Map<String, Object> paramMap) {
		return boardDao.download_cnt(paramMap);
	}

	@Override
	public int download_hit(int board_seq) {
		return boardDao.download_hit(board_seq);
	}

	@Override
	public List<Board> portfolio_list(Map<String, Object> paramMap) {
		return boardDao.portfolio_list(paramMap);
	}

	@Override
	public Board port_pf_Year(String pf_year) {
		return boardDao.port_pf_Year(pf_year);
	}

	@Override
	public String thisYear(Map<String, Object> paramMap) {
		return boardDao.thisYear(paramMap);
	}
}
