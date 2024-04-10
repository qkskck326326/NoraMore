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
    public int insertMessage(Message msg) {
        return chattingDao.insertMessage(msg);
    }

    
}