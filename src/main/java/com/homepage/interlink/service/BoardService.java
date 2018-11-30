package com.homepage.interlink.service;


import com.homepage.interlink.model.Board;

public interface BoardService {
	public void board_insert(Board board);

	public Board board_read(int board_seq);
}
