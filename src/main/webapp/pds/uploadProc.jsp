<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>uploadProc_파일첨부</title>
</head>
<body>
	<h3>파일 첨부 테스트 결과</h3>
<%
	//MVC 패턴으로 코드 작성 시작하면 request 요소를 우리가 생성하여 코드 작성
	/* 
		request.setCharacterEncoding("UTF-8");
		out.print(request.getParameter("uname"));
		out.print("<hr>");
		out.print(request.getParameter("subject"));
		out.print("<hr>");
		out.print(request.getParameter("content"));
		out.print("<hr>");
		out.print(request.getParameter("filenm"));
		out.print("<hr>");
		
		<form>에 enctype="multipart/form-data" 속성이 추가되면 
		request내장객체가 가지고 있는 값을 제대로 가져올 수 없다
		request.getParameter("")는 null이 반환된다
		
		※ 파일 업로드 cos.jar 라이브러리 추가
		※ 참조
			http://pretyimo.cafe24.com/lectureRead.do?lectureno=409
			http://pretyimo.cafe24.com/lectureRead.do?lectureno=220
	*/
	
	try {
		//1) 첨부된 파일 저장하기
		//첨부된 파일 저장 경로 : /src/main/webapp/storage
		
		//실제 물리적 경로
		String saveDirectory = application.getRealPath("/storage");
		//E:\java202407\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\basic06_myweb\storage
		//out.print(saveDirectory);
		
		//최대 저장 용량 지정(10MB)
		int maxPostSize = 1024 * 1024 * 10;
		
		//한글 인코딩
		String encoding = "UTF-8";
		
		//파일 저장
		//(사용자가 첨부한 파일, 저장 경로, 파일 최대 용량, 한글 인코딩, 중복 파일 존재 시 rename)
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		//2) mr 참조변수가 가리키고 있는 텍스트 정보 가져오기
		out.print(mr.getParameter("uname"));
		out.print("<hr>");
		out.print(mr.getParameter("subject"));
		out.print("<hr>");
		out.print(mr.getParameter("content"));
		out.print("<hr>");
		
		//3) /storage 폴더에 저장된 파일의 정보 확인
		
			//-1 mr에서 <input type="file"> 전부 수거
			//열거형 자료 Enumeratin enum = {"", "", ""}
			//첨부 파일이 여러 개일 경우 자료 열거(enum)을 통해 저장
			//첨부된 파일이 3개라면
			//Enumeration files = {<input type="file">,<input type="file">,<input type="file">}
		Enumeration files = mr.getFileNames();
			
			//-2 -1의 files가 가지고 있는 값 중 개별적 접근을 위해 name 값 가져오기
			// <input type="file" name="filenm"> 에서 filenm 가져오기
			//첨부 파일이 여러개인 경우 enum에 저장되어 있으므로 반복문을 통해 개별 접근 가능
		String item = (String)files.nextElement(); //"filenm" files에서 가리키는 요소 name 값 가져오기
		
			//-3 mr 객체에 있는 -2의 item 이름이 /storage 폴더에 저장되었을때의 다양한 정보 확인
		String ofileName = mr.getOriginalFileName(item);
		out.print("원본 파일명: " + ofileName);
		out.print("<hr>");
		
		String fileName = mr.getFilesystemName(item);
		out.print("rename 파일명: " + fileName);
		out.print("<hr>");
		
			//-4 /storage 폴더에 저장된 파일의 다양한 정보 확인
		File file = mr.getFile(item);//실제 파일 가져오기
		if(file.exists()){//파일이 존재하는지
			//파일이 존재한다면
			out.print("파일명: " + file.getName());
			out.print("<hr>");
			out.print("파일크기: " + file.length() + "byte");
			out.print("<hr>");
		} else {
			out.print("해당 파일 존재하지 않음");
		}//if end
		
		
	} catch(Exception e){
		out.print(e);
		out.print("<p>파일 업로드 실패</p>");
		out.print("<a href='javascript:history.back();'>다시 시도</a>");
	}//try end
%>
</body>
</html>