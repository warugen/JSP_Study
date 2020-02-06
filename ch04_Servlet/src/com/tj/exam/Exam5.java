package com.tj.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Exam5
 */
@WebServlet("/Exam5")
public class Exam5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Exam5() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String bgColor[] = {"red","orange","yellow","green","blue","navy","violet"};
		int color = Integer.parseInt( request.getParameter("colorG"));
		int fColor=0;
		if(color == 0) {
			fColor = 6;
		} else {
			fColor = color - 1;
		}
		System.out.println("bgcolor : "+bgColor[color]);
		System.out.println("fcolor : "+bgColor[fColor]);
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<style>");
		out.println(" body{ background-color : " + bgColor[color] +";}");
		out.println(" h2{ color : " + bgColor[fColor] +";}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>배경색은 "+bgColor[color]+"입니다.</h2>");
		out.println("</body>");
		out.println("</html>");
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		String bgColor[] = {"red","orange","yellow","green","blue","navy","violet"};
		int color = Integer.parseInt( request.getParameter("colorP"));
		int fColor=0;
		if(color == 0) {
			fColor = 6;
		} else {
			fColor = color - 1;
		}
		System.out.println("bgcolor : "+bgColor[color]);
		System.out.println("fcolor : "+bgColor[fColor]);
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<style>");
		out.println(" body{ background-color : " + bgColor[color] +";}");
		out.println(" h2{ color : " + bgColor[fColor] +";}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>배경색은 "+bgColor[color]+"입니다.</h2>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

}
