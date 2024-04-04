package com.develup.noramore.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    
    // 채팅 페이지
    @GetMapping("chattingPage.do")
    public String chatting(@SessionAttribute("loginMember") Member loginMember, Model model) {
        
        // 현재 개설되어 있는 채팅방 목록 불러오기
        List<ChattingRoom> roomList = chattingService.selectRoomList(loginMember.getMemberID());
        model.addAttribute("roomList", roomList);
        
        return "chatting/chatting";
    }
    
    // 채팅 상대 검색
    @GetMapping(value="/chat/selectTarget.do", produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<Member> selectTarget(String query, @SessionAttribute("loginMember") Member loginMember){
    
       Map<String, Object> map = new HashMap<>();
       
       map.put("memberID", loginMember.getMemberID());
       map.put("query", query);
       
       return chattingService.selectTarget(map);
    }
    
    // 채팅방 입장(없으면 생성)
    @GetMapping("/chat/chattingEnter.do")
    @ResponseBody
    public int chattingEnter(String targetId, @SessionAttribute("loginMember") Member loginMember) {
     
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("targetId", targetId);
        map.put("loginMemberID", loginMember.getMemberID());
        
        int chattingNo = chattingService.checkChattingNo(map);
        
        // 받는 회원과 생성된 채팅방이 없을 경우 채팅방 번호 새로 생성
        if(chattingNo == 0) {
            chattingNo = chattingService.createChattingRoom(map);
        }
        
        return chattingNo;
    }
    
    // 채팅방 목록 조회
    @GetMapping(value="/chat/roomList.do", produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<ChattingRoom> selectRoomList(@SessionAttribute("loginMember") Member loginMember) {
       return chattingService.selectRoomList(loginMember.getMemberID());
    }
    
    // 채팅 읽음 표시
    @PutMapping("/chat/updateReadFlag.do")
    @ResponseBody
    public int updateReadFlag(@RequestBody Map<String, Object> paramMap) {
        return chattingService.updateReadFlag(paramMap);
    }
    
    // 채팅방 번호에 해당하는 메시지 목록 조회
    @GetMapping(value="selectMessage.do", produces="application/json; charset=UTF-8")
    @ResponseBody
    public List<Message> selectMessageList(@RequestParam Map<String, Object> paramMap) {
        return chattingService.selectMessageList(paramMap);
    }
    
}