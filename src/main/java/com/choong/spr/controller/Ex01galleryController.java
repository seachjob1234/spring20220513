package com.choong.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choong.spr.domain.ex01.BoardDto;
import com.choong.spr.domain.ex01.ReplyDto;
import com.choong.spr.survice.Ex01Service;
import com.choong.spr.survice.Ex02Service;

@Controller
@RequestMapping("ex01")
public class Ex01galleryController {

	@Autowired
	private Ex01Service service;
	@Autowired
	private Ex02Service service1;

	@RequestMapping("board1/list")
	public void listBoard(@RequestParam(defaultValue = "1") int page, Model model) {
		
		
		List<BoardDto> list = service.listTrainingBoard(page);
		int total = service.getTotalBoardCount();

		model.addAttribute("boardList", list);
		model.addAttribute("endPage",(total-1)/10+1);
		model.addAttribute("currentPage",page);
		model.addAttribute("startPage",(page-1)/10*10+1);
		model.addAttribute("prevPage", startPage - 10);
		model.addAttribute("nextPage", startPage + 10);
		model.addAttribute("lastPage", lastPage);
		System.out.println(list.size());

	}

	@GetMapping("board1/{id}")
	public String getBoard(@PathVariable("id") int id, Model model) {
		System.out.println(id);

		List<ReplyDto> replyList = service1.listReplyByBoardId(id);
		// 서비스일 시켜서 id에 해당하는 게시물 select
		BoardDto dto = service.getBoard(id);

		// 모델에 넣고
		model.addAttribute("board1", dto);
		model.addAttribute("replyList", replyList);
		// /WEB-INF/views/board/get.jsp로 포워드
		return "/ex01/board1/get";

	}

	@PostMapping("board/modify")
	public String modifyBoard(BoardDto board, RedirectAttributes rttr) {

		boolean success = service.updateBoard(board);
		if (success) {
			rttr.addAttribute("success", true);
		} else {
			rttr.addAttribute("success", false);
		}
		return "redirect:/ex01/board1/" + board.getId();

	}

	@PostMapping("board/remove")
	public String removeBoard(int id) {
		boolean success = service.removeBoardById(id);
		if (success) {

		} else {

		}
		return "redirect:/ex01/board1/list";
	}

	@GetMapping("board1/write")
	public void writeBoard() {

	}

	@PostMapping("board/write")
	public String writeBoardProcess(BoardDto board) {
		boolean success = service.addBoard(board);
		if (success) {

		} else {

		}

		return "redirect:/ex01/board1/list";

	}
	

}
