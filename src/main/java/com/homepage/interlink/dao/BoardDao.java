package com.homepage.interlink.dao;


import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Board;

public interface BoardDao {

	public void board_insert(Board board);

	public Board board_read(Board board);

	public List<Board> board_list(Map<String, Object> paramMap);

	public int board_cnt(Map<String, Object> paramMap);

	public void board_update(Board board);

	public void board_delete(Board board);

	public void portfolio_insert(Board board2);

}
