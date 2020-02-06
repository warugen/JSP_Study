package com.tj.lect1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex4_initParam
 */
/*
@WebServlet(urlPatterns = {"/Ex4_initParam"},
			// 구동될때 초기화 시킬것들 정의(초기화 파라미터)
			initParams = {@WebInitParam(name="id", value="root"),
						  @WebInitParam(name="pw", value="mysql"),
						  @WebInitParam(name="jdbcdriver", value="com.mysql.jdbc.Driver")})
*/

public class Ex4_initParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
     

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 어노테이션에 선언한 초기화 파라메터값 가져오기
		String id = getInitParameter("id");
		String pw = getInitParameter("pw");
		String jdbcdriver = getInitParameter("jdbcdriver");
		
		response.getWriter().append("<h2>id = " +id+ "</h2>");
		response.getWriter().append("<h2>pw = " +pw+ "</h2>");
		response.getWriter().append("<h2>jdbcdriver = " +jdbcdriver+ "</h2>");

		System.out.println("id = " +id);
		System.out.println("pw = " +pw);
		System.out.println("jdbcdriver = " +jdbcdriver);
		
		// 공유 파라미터 (현 프로젝트의 모든 서블릿에서 사용가능
		String contextId = getServletContext().getInitParameter("contextId");
		String contextPw = getServletContext().getInitParameter("contextPw");
		System.out.println("contextId = " +contextId);
		System.out.println("contextPw = " +contextPw);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
