package com.develup.noramore.forbidden.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.develup.noramore.forbidden.model.dao.ForbiddenDao;

@Service("forbiddenService")
public class ForbiddenServiceImpl {
	@Autowired
	public ForbiddenDao forbiddenDao;
}
