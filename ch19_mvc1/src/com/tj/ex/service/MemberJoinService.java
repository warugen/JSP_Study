package com.tj.ex.service;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.dao.MemberDAO;
import com.tj.ex.dto.MemberDTO;

public class MemberJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tmpBirth = request.getParameter("tmpBirth");
		Timestamp birth = tmpBirth != null ? Timestamp.valueOf(tmpBirth + " 00:00:00")  : null;
		String address = request.getParameter("address");
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO dto = new MemberDTO(id, pw, name, email, birth, null, address);

		request.setAttribute("joinResult", mDao.insertMember(dto));
	}

}
