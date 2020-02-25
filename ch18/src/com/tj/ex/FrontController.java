package com.tj.ex;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length()+1);
		
		System.out.println("URI : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("command : " + command);
		System.out.println();
		
		String viewPage = null;
		Service service = null;
		
		if(command.equals("insert.do")) {
			System.out.println("insert command 호출함");
			
			// insert 로직 수행
			request.setAttribute("result", "insert");
			viewPage = "1_front/ex02.jsp";
			
		} else if(command.equals("select.do")) {
			System.out.println("select command 호출함");
			// insert 로직 수행
			request.setAttribute("result", "select");
			viewPage = "1_front/ex02.jsp";
			
		} else if(command.equals("delete.do")) {
			System.out.println("delete command 호출함");
			// insert 로직 수행
			request.setAttribute("result", "delete");
			viewPage = "1_front/ex02.jsp";
			
		} else if(command.equals("update.do")) {
			System.out.println("update command 호출함");
			// insert 로직 수행
			request.setAttribute("result", "update");
			viewPage = "1_front/ex02.jsp";
		} else if(command.equals("listMember.do")) {
			System.out.println("회원 목록 출력 호출함");
			service = new ListMemberService();
			service.execute(request, response);
			viewPage = "1_front/ex03list.jsp";
		} else if (command.equals("joinPro.do")) {
			System.out.println("회원 가입 호출");
			service = new JoinMemberService();
			service.execute(request, response);
			//viewPage = "1_front/joinResult.jsp";
			viewPage = "1_front/joinResult.jsp";
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
