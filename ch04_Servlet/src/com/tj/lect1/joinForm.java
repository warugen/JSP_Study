package com.tj.lect1;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class joinForm
 */
@WebServlet("/joinForm")
public class joinForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public joinForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글안깨지게 설정
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String hiddenPara = request.getParameter("hiddenPara");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String pwOut="";
		for (int i = 0; i < pw.length(); i++) {
			pwOut += "*";
		}		
		String birth = request.getParameter("birth");
		String hobby[] = request.getParameterValues("hobby");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String mailSend[] = request.getParameterValues("mailSend");
		
		out.println("<html>");
		out.println("<head>");
		out.println("<head>");
		out.println("<link href='css/ex8.css' rel='stylesheet'>");
		out.println("<style> .title { color : blue; font-size: 2em; text-align : center; } </style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<table>");
		out.println("<div class='title'> 회원가입정보 </div>");
		out.println("<tr><td> hiddenParam : " + hiddenPara + "</td></tr>");
		out.println("<tr><td> 이름 : " + name + "</td></tr>");
		out.println("<tr><td> 아이디 : " + id + "</td></tr>");
		out.println("<tr><td> 비번 : " + pwOut + "</td></tr>");
		out.println("<tr><td> 생년월일 : " + birth + "</td></tr>");
		out.println("<tr><td> 취미 : ");
		if(hobby != null) {
			for(int i=0; i< hobby.length; i++) {
				if(i==hobby.length-1) {
					out.print(hobby[i]);
				} else {
					out.print(hobby[i]);
					out.print(",");
				}
			}
		} else {
			out.print("없음");
		}
		out.println("</td></tr>");
		out.println("<tr><td> 성별 : " + gender + "</td></tr>");
		out.println("<tr><td> 이메일 : " + email + "</td></tr>");
		out.println("<tr><td> 메일수신 : ");
		if(mailSend != null) {
			for(int i=0; i < mailSend.length; i++) {
				if(i == mailSend.length-1) {
					out.print(mailSend[i]);
				} else {
					out.print(mailSend[i]);
					out.print(",");
				}
			}
		} else {
			out.print("메일수신 안함");
		}
		out.println("</td></tr>");
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
	}

}
