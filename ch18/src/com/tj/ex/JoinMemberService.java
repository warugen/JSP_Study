package com.tj.ex;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.member.MemberDAO;
import com.tj.member.MemberDTO;

public class JoinMemberService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = new MemberDTO();
		
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setBirth((Timestamp.valueOf(request.getParameter("tmpBirth") + " 00:00:00")));
		dto.setAddress(request.getParameter("address"));
		
		request.setAttribute("joinResult", dao.insertMember(dto));
	}

}
