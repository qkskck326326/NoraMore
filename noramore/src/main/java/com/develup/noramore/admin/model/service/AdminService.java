package com.develup.noramore.admin.model.service;

import java.util.List;

import com.develup.noramore.admin.model.vo.BoardManage;
import com.develup.noramore.common.Paging;

public interface AdminService {

	int selectReportedListCount();

	List<BoardManage> selectReportedList(Paging paging);

}
