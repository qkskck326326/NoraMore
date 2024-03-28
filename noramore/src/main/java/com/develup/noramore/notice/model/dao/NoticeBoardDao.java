package com.develup.noramore.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.develup.noramore.common.Paging;
import com.develup.noramore.notice.model.vo.Notice;

@Repository("noticeBoardDao")
public class NoticeBoardDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int selectListCount() {		
		return sqlSessionTemplate.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(Paging paging) {		
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectList", paging);
		return (ArrayList<Notice>)list;
	}
		
}



