package com.tj.ex.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.BoardDao;

public class BDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int bid = Integer.parseInt(request.getParameter("bid"));
		BoardDao bDao = new BoardDao();
		request.setAttribute("deleteResult", bDao.delete(bid));
	}

}
