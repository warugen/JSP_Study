package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.BoardDao;

public class BModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao bDao = new BoardDao();
		int bid = Integer.parseInt(request.getParameter("bid"));
		request.setAttribute("modify_view", bDao.modifyView_replyView(bid));
		
	}

}
