<%@page import="com.tj.model1ex.dto.FileboardDto"%>
<%@page import="com.tj.model1ex.dao.FileboardDao"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	// 첨부파일이 있으면 저장하는 처리
	String path = request.getRealPath("fileboardUpload");
	int maxSize = 1024 * 1024 * 10;	// 최대 10메가
	String fileName = "";
	MultipartRequest mRequest = null;
	try{
		mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration<String> paramNames = mRequest.getFileNames();
		String param = paramNames.nextElement();
		fileName = mRequest.getFilesystemName(param);
	}catch (IOException e) {
		System.out.println(e.getMessage());
	}
	
	InputStream  is = null;
	OutputStream os = null;
	File serverFile = new File(path+"/"+fileName);
	if(serverFile.exists()){
		try{
			is = new FileInputStream(serverFile);
			os = new FileOutputStream("D:/mega_IT/source/6_JSP/model1ex/WebContent/fileboardUpload/" + fileName);
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
	
	// 수정한글 저장하기
	FileboardDao fDao = FileboardDao.getInstance();
	FileboardDto dto = new FileboardDto();
	
	int fNum = Integer.parseInt(mRequest.getParameter("num"));
	String fSubject = mRequest.getParameter("fsubject");
	String fContent = mRequest.getParameter("fcontent");
	String fPw = mRequest.getParameter("fpw");
	String dbFileName = mRequest.getParameter("dbFileName");
	String fIp = request.getRemoteAddr();
	if(fileName == null && dbFileName!=null){
		fileName = dbFileName;
		System.out.println("dbFileName : " + dbFileName);
		System.out.println("fileName : " + fileName);
	}
	
	dto.setfNum(fNum);
	dto.setfSubject(fSubject);
	dto.setfContent(fContent);
	dto.setfFileName(fileName);
	dto.setfPw(fPw);
	dto.setfIp(fIp);
	
	int result = fDao.updateFileBoard(dto);
	if(result == FileboardDao.SUCCESS){
		// 글쓰기 성공
		%>
		<script> 
			alert('게시글 수정 성공');
			location.href='fboardList.jsp?pageNum=<%=pageNum %>';
		</script>
		<%
	} else {
		// 글쓰기 실패
		%>
		<script>alert('글 수정 실패'); history.back(); </script>
		<%
	}
%>
</body>
</html>