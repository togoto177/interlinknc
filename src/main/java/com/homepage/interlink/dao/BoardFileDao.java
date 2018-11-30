package com.homepage.interlink.dao;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.Board;
import com.homepage.interlink.model.BoardFile;

public interface BoardFileDao {

	public void file_insert(BoardFile boardFile);

	public List<BoardFile> file_list(Map<String, Object> paramMap);

	public void fileDeleteByBoardFile(BoardFile boardFile);

}
