package com.develup.noramore.commentrecrboard.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.develup.noramore.commentrecrboard.model.vo.CommentRecrBoard;
import com.develup.noramore.commentrecrboard.service.CommentRecrBoardService;
import com.develup.noramore.recrboard.model.service.RecrBoardService;

@Controller
public class CommentRecrBoardController {
	@Autowired
	CommentRecrBoardService commentRecrBoardService;
	@Autowired
	private RecrBoardService recrBoardService;
	
	@RequestMapping(value="insertrecrcomment.do", method=RequestMethod.POST)
	public String insertRecrComment(CommentRecrBoard commentRecrBoard, Model model, @RequestParam("page") String page) {
		if(commentRecrBoardService.insertRecrComment(commentRecrBoard) > 0 &&
				recrBoardService.upCountComment(commentRecrBoard.getBoardId()) > 0) {
			model.addAttribute("message", "댓글이 등록되었습니다.");
			model.addAttribute("boardId", commentRecrBoard.getBoardId());
			model.addAttribute("page", page);
			return "redirect:rbdetail.do";
		}else {
			model.addAttribute("message", "error! 댓글이 등록에 실패하였습니다.");
			model.addAttribute("boardId", commentRecrBoard.getBoardId());
			model.addAttribute("page", page);
			return "redirect:rbdetail.do";
		}
	}//
	
	@RequestMapping("selectrecrcomment.do")
	@ResponseBody
	public String selectRecrComment(@RequestParam("BoardId") String Id) {
		int boardId = Integer.parseInt(Id);
		ArrayList<CommentRecrBoard> list = commentRecrBoardService.selectRecrComment(boardId);
		
		JSONArray jarr = new JSONArray();
		for(CommentRecrBoard commentRecrBoard : list) {
			JSONObject job = new JSONObject();
			job.put("memberId", commentRecrBoard.getMemberId());
			job.put("commentId", commentRecrBoard.getCommentId());
			job.put("context", commentRecrBoard.getContext());
			job.put("countSubComment", commentRecrBoard.getCountSubComment());		
			job.put("lastUpdateDate", commentRecrBoard.getLastUpdateDate());
			
			jarr.add(job);
		}
		
		return jarr.toJSONString();
	}//
}//
