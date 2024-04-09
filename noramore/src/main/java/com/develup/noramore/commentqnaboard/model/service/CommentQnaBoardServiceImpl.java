package com.develup.noramore.commentqnaboard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.commentqnaboard.model.dao.CommentQnaBoardDao;

@Service("commentQnaBoardService")
public class CommentQnaBoardServiceImpl {
	
	@Autowired
	CommentQnaBoardDao commentQnaBoardDao;
	
	
	
}
