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
    
    public List<ChattingRoom> selectRoomList(String memberID) {
        return sqlSession.selectList("chatting.selectRoomList", memberID);
    }

    public int checkChattingNo(Map<String, Object> map) {
        return sqlSession.selectOne("chatting.checkChattingNo", map);
    }

    public int createChattingRoom(Map<String, Object> map) {
        int result = sqlSession.insert("chatting.createChattingRoom", map);
        int chattingNo = 0;
        if(result > 0)  chattingNo = (int)map.get("chattingNo");
        return chattingNo;
    }


    public int insertMessage(Message msg) {
        return sqlSession.insert("chatting.insertMessage", msg);
    }

    public int updateReadFlag(Map<String, Object> paramMap) {
        return sqlSession.update("chatting.updateReadFlag", paramMap);
    }

    public List<Message> selectMessageList(int chattingNo) {
       return sqlSession.selectList("chatting.selectMessageList", chattingNo);
    }
}