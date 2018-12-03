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
	public void portfolio_insert(Board board2) {
		boardDao.portfolio_insert(board2);
	}
}
