package com.choong.spr.survice;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choong.spr.domain.ex01.BoardDto;
import com.choong.spr.mapper.Ex01Mapper;
import com.choong.spr.mapper.Ex02Mapper;

@Service
public class Ex01Service {
	@Autowired
	private Ex01Mapper mapper;
	@Autowired
	private Ex02Mapper replyMapper;
	

	public List<BoardDto> listTrainingBoard() {
		// TODO Auto-generated method stub
		return mapper.insertTrainingBoard();
	}

	public BoardDto getBoard(int id) {
		// TODO Auto-generated method stub
		return mapper.selertGetBoard(id);
	}

	public boolean updateBoard(BoardDto board) {

		// TODO Auto-generated method stub

		int cnt = mapper.insertUpdateBoard(board);

		return false;
	}
	
	
	public boolean removeBoardById(int id) {
		// TODO Auto-generated method stub
		replyMapper.deleteReplyByBoard(id);
		
		
		
		
		
		int cnt = mapper.deleteboard(id);

		return cnt == 1;
	}

	public boolean addBoard(BoardDto board) {
		board.setInserted(LocalDateTime.now());

		int cnt = mapper.insertBoard(board);
		return cnt == 1;

	}

}
