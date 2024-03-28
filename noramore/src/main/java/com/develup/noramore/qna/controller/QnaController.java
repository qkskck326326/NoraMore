package com.develup.noramore.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.develup.noramore.qna.model.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;

	@RequestMapping("qnawrite.do")
	public String insertQna() {
		return "qna/qnawrite";
	}//

	@RequestMapping("qna.do")
	public String selectQna() {

		return "qna/qna";
	}//

}
