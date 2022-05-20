package com.choong.spr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.choong.spr.domain.ex01.BoardDto;

public interface Ex01Mapper {

	List<BoardDto> insertTrainingBoard(@Param("type")String type, @Param("keyword")String keyword, @Param("from")int from);

	BoardDto selertGetBoard(int id);

	int insertUpdateBoard(BoardDto board);

	int deleteboard(int id);

	int insertBoard(BoardDto board);
	
	int totalBoard();

}
