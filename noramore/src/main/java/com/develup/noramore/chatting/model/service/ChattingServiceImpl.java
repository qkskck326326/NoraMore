package com.develup.noramore.chatting.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.chatting.model.dao.ChattingDao;
import com.develup.noramore.chatting.vo.ChattingRoom;
import com.develup.noramore.chatting.vo.Message;
import com.develup.noramore.member.model.vo.Member;




@Service
public class ChattingServiceImpl implements ChattingService{

    @Autowired
    private ChattingDao chattingDao;

    @Override
    public List<ChattingRoom> selectRoomList(String memberID) {
        return chattingDao.selectRoomList(memberID);
    }
    
    @Override
    public int checkChattingNo(Map<String, Integer> map) {
        return chattingDao.checkChattingNo(map);
    }

    @Override
    public int createChattingRoom(Map<String, Integer> map) {
        return chattingDao.createChattingRoom(map);
    }


    @Override
    public int insertMessage(Message msg) {
		/* msg.setMessageContent(Util.XSSHandling(msg.getMessageContent())); */
        return chattingDao.insertMessage(msg);
    }

    @Override
    public int updateReadFlag(Map<String, Object> paramMap) {
        return chattingDao.updateReadFlag(paramMap);
    }

    @Override
    public List<Message> selectMessageList( Map<String, Object> paramMap) {
        System.out.println(paramMap);
        
        List<Message> messageList = chattingDao.selectMessageList(  Integer.parseInt( String.valueOf(paramMap.get("chattingNo") )));
        
        if(!messageList.isEmpty()) {
            int result = chattingDao.updateReadFlag(paramMap);
        }
        
        return messageList;
    }

    // 채팅 상대 검색
   @Override
   public List<Member> selectTarget(Map<String, Object> map) {
      return chattingDao.selectTarget(map);
   }
    
}