package com.tj.ex;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Homework
 */
@WebServlet("/Homework")
public class Homework extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Homework() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		acitionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	
	private void acitionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmpDao dao = new EmpDao();
		String scEname = request.getParameter("scEname");
		String scJob = request.getParameter("scJob");
		scEname = scEname !=null ? scEname.toUpperCase() : "";
		scJob = scJob !=null ? scJob.toUpperCase() : "";
		
		// pageNum, currentPage, PAGESIZE, BLOCKSIZE, startRow, endRow 계산
		ArrayList<EmpDto> emps = dao.getSearch(scEname, scJob);
		request.setAttribute("emps", emps);
		// pageCnt, startPage, endPage 계산
		// request에 추가할 attribute : pageCnt, BLOCKSIZE, startPage, endPage, pageNum

		RequestDispatcher dispatcher = request.getRequestDispatcher("fmt/homework.jsp");
		dispatcher.forward(request, response);
		
	}
}
