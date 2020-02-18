<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
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
	// 업로드할때 실제로 저장되는 경로 \apache-tomcat-9.0.30\wtpwebapps\ch14_fileUP\fileUpFolder
	String path = request.getRealPath("fileUpFolder");
	int maxSize = 1024 * 1024 * 10;	// 업로드 최대 용량을 10M으로 설정
	String filename = "";
	String originalFilename = "";
	
	try {
		// new DefaultFileRenamePolicy() 같은 이름이 있을경우 자동으로 rename해준다
		MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		Enumeration<String> paramNames = mRequest.getFileNames();
		while(paramNames.hasMoreElements()){
			String param = paramNames.nextElement();
			filename = mRequest.getFilesystemName(param);
			originalFilename = mRequest.getOriginalFileName(param);
			
			System.out.println("파라미터이름 : " + param);
			System.out.println("서버에 저장된 파일이름 이름 : " + filename);
			System.out.println("사용자가 첨부한 오리지널 파일이름 이름 : " + originalFilename);
		}
	} catch(IOException e) {
		System.out.println(e.getMessage());
	}
	
	// 서버에 업로드 하자마자 소스폴더로 file copy (개발단계에서만 필요)
	InputStream is = null;
	OutputStream os = null;
	
	try{
		File serverFile = new File(path + "/" + filename);
		System.out.println("serverFile : " + serverFile);
		if(serverFile.exists()){
			is = new FileInputStream(serverFile);
			os = new FileOutputStream("D:\\mega_IT\\source\\6_JSP\\ch14_fileUP\\WebContent\\fileUpFolder/" + filename);
			byte[] bs = new byte[(int)serverFile.length()];
			while(true){
				int nReadCnt = is.read(bs);	// nReadCnt : 읽어온 바이트 수
				if(nReadCnt == -1){
					break;
				}
				os.write(bs, 0, nReadCnt);
			}
		}
	}catch(IOException e){
		System.out.println(e.getMessage());
	} finally {
		try{			
			if(os!=null) os.close();
			if(is!=null) is.close();
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}
	}
%>
<%=path %>
<h3>올린 오리지널 파일이름 : <%=originalFilename %></h3>
<h3>서버에 저장된 파일이름 : <%=path %>/<%=originalFilename %></h3>
<img src="fileUpFolder/<%=filename %>" alt="첨부안됨" />
</body>
</html>



