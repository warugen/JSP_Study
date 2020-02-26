package com.tj.ex.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.ex.service.BListService;
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
	
	protected void actionDo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String conPath = req.getContextPath();
		String command = uri.substring(conPath.length());
		
		Service service = null;
		String viewPage = null;
		
		if(command.equals("/list.do")) {
			// 게시판 목록보기
			// service의 execute() 호출 - BListService.java
			service = new BListService();
			service.execute(req, resp);
			viewPage = "board/list.jsp";
		} else if (command.equals("/write_view.do")) {
			// 글쓰기 view
			viewPage = "board/write_view.jsp";
		} else if (command.equals("/write.do")) {
			// 글쓰기 저장
			// service의 execute() 호출 = BWriteService.java
			viewPage = "list.do";
		} else if (command.equals("/content_view.do") ) {
			// 글 상세보기
			// service의 execute() 호출 - BContentService.java
			viewPage = "board/content_view.jsp";
		} else if (command.equals("/modify_view.do")) {
			// 글 수정화면으로 가기
			// service execute() 호출 - BModifyViewService.java
			viewPage = "board/modify_view.jsp";
		} else if (command.equals("/modify.do")) {
			// 수정한 글 DB에 저장
			// service execute() 호출 - BModifyService.java
			// 수정이 완료되면 
			viewPage = "content_view.do";
		} else if (command.equals("/delete.do")) {
			// 글 삭제하기
			// service execute() 호출 - BDeleteService.java
			viewPage = "list.do";
		} else if (command.equals("/reply_view.do")) {
			// 답변글 에디터로 가기
			// service execute() 호출 - BReplyViewService.java
			viewPage = "board/reply_view.jsp";
		} else if (command.equals("/reply.do")) {
			// 답변글 DB에 저장
			// service execute() 호출 - BReplyService.java
			viewPage = "list.do";
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
		dispatcher.forward(req, resp);
	}
}
