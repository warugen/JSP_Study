package com.tj.ex;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.member.MemberDAO;

public class ListMemberService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO mDao = MemberDAO.getInstance();
		request.setAttribute("members", mDao.getListMember());
		
	}

}
