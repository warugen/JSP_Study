<%@page import="com.tj.book.BookDto"%>
<%@page import="com.tj.book.BookDao"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.IOError"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" >
</head>
<body>
<%	
	request.setCharacterEncoding("utf-8");
	String path = request.getRealPath("bookImg");
	int maxSize = 1024 * 1024 * 5;	// 최대 5메가
	String[] image = {"",""};
	MultipartRequest mRequest = null;

	try {
		mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration<String> paramNames = mRequest.getFileNames();
		int idx = 0;
		while(paramNames.hasMoreElements()){
			String param = paramNames.nextElement();
			image[idx] = mRequest.getFilesystemName(param);
			
			// 원래는 마지막에 첨부한 파일부터 불러오는게 정상인데 지금은 처음 첨부한것들부터 나오는증상 계속 그러는지 확인필요
			System.out.println(idx + "번째 처리한 파라미터 이름 : " + param + "/ 파일 이름 : " + image[idx]);
			
			out.println(idx + "번째 처리한 파라미터 이름 : " + param + "/ 파일 이름 : " + image[idx] + "<br>");
			
			idx++;
		}
	}catch (IOException e) {
		System.out.println(e.getMessage());
	}
	
	// 서버에 올려진 파일을 소스폴더에 복사
	for(String imgfile : image){
		if(imgfile!=null){
			InputStream  is = null;
			OutputStream os = null;
			File serverFile = new File(path+"/"+imgfile);
			if(serverFile.exists()){
				try{
					is = new FileInputStream(serverFile);
					os = new FileOutputStream("D:/mega_IT/source/6_JSP/ch14_fileUP/WebContent/bookImg/" + imgfile);
					byte[] bs = new byte[(int)serverFile.length()];
					while(true){
						int readByteCnt = is.read(bs);
						if(readByteCnt == -1){
							break;
						}
						os.write(bs, 0, readByteCnt);
					}	
				} catch(Exception e) {
					System.out.println(e.getMessage());
				} finally {
					if(os != null) os.close();
					if(is != null) is.close();
				}
			}
		}
	}
	// 책제목, 책설명, 가격, 할인율 등의 파라미터 값 받아서 BookDto 객체 만든다
	String 	bTitle		= mRequest.getParameter("bTitle");
	System.out.println("타이틀 : "+bTitle);
	int 	bPrice 		= Integer.parseInt(mRequest.getParameter("bPrice"));
	/*
	원래대로라면 image[]의 순서를 바꿔줘야한다.
	뒤바껴서 나오는지 체크하기
	String 	bImage1 	= image[1]!=null ? image[1] : "NOTHING.JPG";
	String 	bImage2 	= image[0]!=null ? image[0] : "noImg.png";
	*/
	String 	bImage1 	= image[0]!=null ? image[0] : "NOTHING.JPG";
	String 	bImage2 	= image[1]!=null ? image[1] : "noImg.png";
	
	String	bContent 	= mRequest.getParameter("bContent");
	int		bDiscount 	= Integer.parseInt(mRequest.getParameter("bDiscount"));
	
	// DB에 insert
	BookDao bDao = BookDao.getInstance();
	int result = bDao.insertBook(new BookDto(0, bTitle, bPrice, bImage1, bImage2, bContent, bDiscount, null));
	
	if(result == BookDao.SUCCESS){
		out.println("<h2>책 등록 성공</h2>");
	} else {
		out.println("<h2>책 등록 실패</h2>");
	}
%>
	<h3>책이름 : <%=bTitle %></h3>
	<h3>책 이미지1 : <%=path %> + "/" + <%=bImage1 %></h3>
	<img src="../bookImg/<%=bImage1 %>" />
	<h3>책 이미지2 : <%=path %> + "/" + <%=bImage2 %></h3>
	<img src="../bookImg/<%=bImage2 %>" />
	<h3>책 설명</h3>
	<pre><%=bContent %></pre>
	<h3>책 가격 : <del><%=bPrice %></del> <%=bPrice*(100-bDiscount)/100 %></h3>
	<h3>할인율 : <%=bDiscount %></h3>
	
	<a href="list.jsp">책 전체 리스트</a>
	<a href="listP.jsp">책 리스트(1page)</a>
</body>
</html>















