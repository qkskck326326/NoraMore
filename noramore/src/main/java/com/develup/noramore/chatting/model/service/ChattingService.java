package com.develup.noramore.chatting.model.service;

import java.util.List;
import java.util.Map;

import com.develup.noramore.chatting.vo.ChattingRoom;
import com.develup.noramore.chatting.vo.Message;
import com.develup.noramore.member.model.vo.Member;


public interface ChattingService {

    int insertMessage(Message msg);


}