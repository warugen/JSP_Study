package com.tj.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Exam4
 */
@WebServlet("/Exam4")
public class Exam4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Exam4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String numStr[] = request.getParameterValues("su");
		int nums[] = new int[numStr.length];
		System.out.println("numStr : "+ numStr.length);
		System.out.println("nums : "+ nums.length);
		for(int i=0; i<numStr.length; i++) {
			
			nums[i] = Integer.parseInt(numStr[i]);
			
		}

		out.println("<html>");
		out.println("<head>");
		out.println("<link href=\"css/ex4.css\" rel=\"stylesheet\">");
		out.println("</head>");
		out.println("<body>");
		out.println("<table>");
		out.println("<tr>");
		
		// 단수 출력
		for(int j=0; j<nums.length; j++) {
			out.println("<td>"+nums[j] +"단</td>");
		}
		out.println("</tr>");
		
		// 구구단 출력
		for(int i=1; i<=9; i++) {
			out.println("<tr>");
			for(int j=0; j<nums.length; j++) {
				out.println("<td>"+nums[j] +" * "+ i +" = "+ (nums[j]*i)+"</td>");
			}
			out.println("</tr>");
		}
		
		out.println("</table>");
		
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
