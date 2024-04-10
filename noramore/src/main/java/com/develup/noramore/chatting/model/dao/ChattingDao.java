package com.develup.noramore.chatting.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.chatting.vo.ChattingRoom;
import com.develup.noramore.chatting.vo.Message;
import com.develup.noramore.member.model.vo.Member;



@Repository
public class ChattingDao {
    
    @Autowired
    private SqlSessionTemplate sqlSession;

    public int insertMessage(Message msg) {
        return sqlSession.insert("chatting.insertMessage", msg);
    }

}