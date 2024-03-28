package com.develup.noramore.freeboard.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.freeboard.model.vo.FreeBoard;

@Service("freeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService{
	@Autowired
	SqlSessionTemplate SqlSessionTemplate;

	@Override
	public ArrayList<FreeBoard> selectFreeBoard() {
		List<FreeBoard> list = SqlSessionTemplate.selectList("freeboard.selectFreeBoard");
		return (ArrayList<FreeBoard>)list;
	}

	
	
}
