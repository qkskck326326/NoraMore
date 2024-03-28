package com.develup.noramore.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.develup.noramore.common.Paging;
import com.develup.noramore.notice.model.vo.Notice;

@Repository("noticeBoardDao")
public class NoticeBoardDao {
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int selectListCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("noticeMapper.selectLsitCount");
	}

	public ArrayList<Notice> selectList(Paging paging) {
		// TODO Auto-generated method stub
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectList", paging);
		return  (ArrayList<Notice>)list;
	}
		
}



