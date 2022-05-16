package com.choong.spr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choong.spr.domain.ex01.ReplyDto;
import com.choong.spr.survice.Ex02Service;

@Controller
@RequestMapping("ex02")
public class Ex02galleryController {

	@Autowired
	private Ex02Service service;
	
	@PostMapping("reply/add")
	public String addReply(ReplyDto reply) {
		boolean success = service.addReply(reply);

		return "redirect:/ex01/board1/" + reply.getBoardId();

	}
	@PostMapping("reply/remove")
	public String removeReply(ReplyDto reply) {
		boolean success = service.removeReplyById(reply.getId());
		
		return "redirect:/ex01/board1/" + reply.getBoardId();
	}
	
	
	@PostMapping("reply/modify")
	public String modifyReply(ReplyDto reply) {
		boolean success =service.modifyReply(reply);
		
		return "redirect:/ex01/board1/" + reply.getBoardId();
	}
	

}
