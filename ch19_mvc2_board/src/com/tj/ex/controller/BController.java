package com.tj.ex.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.service.BContentService;
import com.tj.ex.service.BDeleteService;
import com.tj.ex.service.BListService;
import com.tj.ex.service.BModifyService;
import com.tj.ex.service.BModifyViewService;
import com.tj.ex.service.BReplyService;
import com.tj.ex.service.BReplyViewService;
import com.tj.ex.service.BWriteService;
import com.tj.ex.service.Service;

import sun.rmi.server.Dispatcher;


@WebServlet("*.do")
public class BController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		actionDo(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doGet(req, resp);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("command : " + command);
		Service service = null;
		String viewPage = null;
		
		if(command.equals("/list.do")) {
			// 게시판 목록보기
			// service의 execute() 호출 - BListService.java
			service = new BListService();
			service.execute(request, response);
			viewPage = "board/list.jsp";
		} else if (command.equals("/write_view.do")) {
			// 글쓰기 view
			viewPage = "board/write_view.jsp";
		} else if (command.equals("/write.do")) {
			// 글쓰기 저장
			// service의 execute() 호출 = BWriteService.java
			service = new BWriteService();
			service.execute(request, response);
			viewPage = "list.do";
		} else if (command.equals("/content_view.do") ) {
			// 글 상세보기
			// service의 execute() 호출 - BContentService.java
			service = new BContentService();
			service.execute(request, response);
			viewPage = "board/content_view.jsp";
		} else if (command.equals("/modify_view.do")) {
			// 글 수정화면으로 가기
			// service execute() 호출 - BModifyViewService.java
			service = new BModifyViewService();
			service.execute(request, response);
			viewPage = "board/modify_view.jsp";
		} else if (command.equals("/modify.do")) {
			// 수정한 글 DB에 저장
			// service execute() 호출 - BModifyService.java
			service = new BModifyService();
			service.execute(request, response);
			// 수정이 완료되면 
			viewPage = "content_view.do";
		} else if (command.equals("/delete.do")) {
			// 글 삭제하기
			// service execute() 호출 - BDeleteService.java
			service = new BDeleteService();
			service.execute(request, response);
			viewPage = "list.do";
		} else if (command.equals("/reply_view.do")) {
			// 답변글 에디터로 가기
			// service execute() 호출 - BReplyViewService.java
			service = new BReplyViewService();
			service.execute(request, response);
			viewPage = "board/reply_view.jsp";
		} else if (command.equals("/reply.do")) {
			// 답변글 DB에 저장
			// service execute() 호출 - BReplyService.java
			service = new BReplyService();
			service.execute(request, response);
			viewPage = "list.do";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
