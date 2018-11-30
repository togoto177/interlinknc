package com.homepage.interlink.service;

import java.util.List;
import java.util.Map;

import com.homepage.interlink.model.BoardFile;

public interface BoardFileService {

	public void file_insert(BoardFile boardFile);

	List<BoardFile> file_list(Map<String, Object> paramMap);

	public void fileDeleteByBoardFile(BoardFile boardFile);

}
