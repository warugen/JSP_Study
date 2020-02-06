package com.tj.ex;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:8181/ch03_semiServlet/Ex0
@WebServlet("/Ex0")
public class Ex0 extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 방식으로 요청이들어오면 여기서 처리
		System.out.println("doGet호출");
		response.getWriter().append("Hello World!");
	}
}
