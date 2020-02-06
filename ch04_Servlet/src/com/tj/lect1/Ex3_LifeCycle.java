package com.tj.lect1;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex3_LifeCycle
 */
@WebServlet("/Ex3_LifeCycle")
public class Ex3_LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@PostConstruct // 어노테이션 초기화 하고싶을때 이곳이나 init()에서 처리
	private void postConstruct() {
		System.out.println("Ex3_LifeCycle 객체 생성되자 마자 바로 실행  ------ 1");
	}
	
	public void init(ServletConfig config) throws ServletException {
		// 객체가 만들어질때 최초에 한번 수행
		System.out.println("Ex3_LifeCycle 서블릿 객체가 생성될때 한번 수행 ------ 2");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트의 요청이 Get방식으로 들어올때
		response.getWriter().append("<h1>doGet() called </h1>");
		System.out.println("doGet() 실행");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트의 요청이 Get방식으로 들어올때
		response.getWriter().append("<h1>doPost() called </h1>");
		doGet(request, response);		
	}

	public void destroy() {
		// 객체가 메모리에서 해제(끝낼때) -> 톰캣서버 종료시킬때
		System.out.println("Ex3_LifeCycle 서블릿 종료 ------ 1");
	}
	
	@PreDestroy // 어노테이션
	private void preDestroy() {
		System.out.println("Ex3_LifeCycle형 객체 소멸되기 바로 전에 수행 ------ 2");
	}
}
