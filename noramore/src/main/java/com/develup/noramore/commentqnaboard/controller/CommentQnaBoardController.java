package com.develup.noramore.commentqnaboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.develup.noramore.commentqnaboard.model.service.CommentQnaBoardService;
import com.develup.noramore.commentqnaboard.model.vo.CommentQnaBoard;
import com.develup.noramore.qna.model.service.QnaService;

@Controller
public class CommentQnaBoardController {
	
	@Autowired
	CommentQnaBoardService commentQnaBoardService;
	
	@Autowired
	private QnaService qnaBoardServie;
	
	// 댓글 달기
		@RequestMapping(value = "insertqnacomment.do", method = RequestMethod.POST)
		public String insertqnarCocoment(CommentQnaBoard commentqnarBoard, Model model,
				@RequestParam("page") String page, @RequestParam("categoryId") int categoryId ) {
			if (commentQnaBoardService.insertQnaComment(commentqnarBoard) > 0
					&& qnaBoardServie.upCountComment(commentqnarBoard.getBoardId()) > 0) {
				
				model.addAttribute("message", "댓글이 등록되었습니다.");
				model.addAttribute("boardId", commentqnarBoard.getBoardId());
				model.addAttribute("page", page);
				return "rediqnat:rbdetail.do";
			} else {
				model.addAttribute("message", "error! 댓글이 등록에 실패하였습니다.");
				model.addAttribute("boardId", commentqnarBoard.getBoardId());
				model.addAttribute("page", page);
				model.addAttribute("categoryId", categoryId);
				return "rediqnat:qdetail.do";
			}
		}
	
}
