package com.develup.noramore.forbidden.model.service;

import java.util.ArrayList;

import com.develup.noramore.common.Paging;
import com.develup.noramore.forbidden.model.vo.Forbidden;

public interface ForbiddenService {

	ArrayList<Forbidden> selectList(Paging paging);

	int selectListCount();
	
	
}
