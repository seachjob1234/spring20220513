package com.choong.spr.mapper;

import java.util.List;

import com.choong.spr.domain.ex01.ReplyDto;

public interface Ex02Mapper {

	int insertReply(ReplyDto reply);

	List<ReplyDto> selectReplyByBoardId(int id);

	int updateReply(ReplyDto reply);

	int deleteReplyById(int id);

	void deleteReplyByBoard(int id);



	

}
