package com.develup.noramore.chatbot.model.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.develup.noramore.notice.controller.NoticeBoardController;

	
@Controller
public class ChatbotController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatbotController.class);

	/*
	 * @Autowired private ChatbotService chatbotService;
	 */
	
	@RequestMapping("chatbot.do")
	public String selectChatbot() {
		return "chatbot/chatbot";
	}
}
