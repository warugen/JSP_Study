package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.BoardDao;

public class BContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao bDao = new BoardDao();
		int bid = Integer.parseInt(request.getParameter("bid"));
		request.setAttribute("content_view", bDao.contentView(bid));
	}

}
