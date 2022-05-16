package com.choong.spr.mapper;

import java.util.List;

import com.choong.spr.domain.ex01.BoardDto;

public interface Ex01Mapper {

	List<BoardDto> insertTrainingBoard();

	BoardDto selertGetBoard(int id);

	int insertUpdateBoard(BoardDto board);

	int deleteboard(int id);

	int insertBoard(BoardDto board);

}
