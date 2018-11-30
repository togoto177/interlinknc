package com.homepage.interlink.dao;


import com.homepage.interlink.model.Board;

public interface BoardDao {

	public void board_insert(Board board);

	public Board board_read(int board_seq);

}
