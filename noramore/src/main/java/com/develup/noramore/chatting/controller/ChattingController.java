package com.develup.noramore.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.develup.noramore.chatting.model.service.ChattingService;
import com.develup.noramore.chatting.vo.ChattingRoom;
import com.develup.noramore.chatting.vo.Message;
import com.develup.noramore.member.model.vo.Member;

@SessionAttributes({"loginMember"})
@Controller
public class ChattingController {
    
    @Autowired
    private ChattingService chattingService;
    
    // 채팅 생성 및 대기 페이지 이동
    @RequestMapping("chattingPage.do")
    public String chatting(@SessionAttribute("loginMember") Member loginMember) {
    	
    	
        return "chatting/unicast";
    }
    
    // 채팅 요청 응답 후 채팅 접속
    
    
    // 채팅 요청 입력
    @RequestMapping(value="chatRequest.do", method=RequestMethod.POST)
    public void chatRequest(
    		@RequestParam("textMessage") String textMessage,
    		@RequestParam("sender") String sender,
    		@RequestParam("receiver") String receiver) {
    	Message message = new Message(textMessage, sender, receiver, "Y");
    	chattingService.insertMessage(message);
    	
    }
    
    
    // 채팅 요청 알림
    

    
}