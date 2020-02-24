package com.tj.ex;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExServlet2
 */
@WebServlet("/ExServlet2")
public class ExServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// 모소드 호출 -> MVC 패턴에서는 메소드에서 호출
		Member member = new Member(id, pw, "홍길동");
		request.setAttribute("member", member);
		
		// View단으로
		response.sendRedirect("2_sendRedirect/ex02View.jsp?id="+id+"&pw="+pw+"&name="+URLEncoder.encode("홍길동","utf-8"));
		
	}

}
