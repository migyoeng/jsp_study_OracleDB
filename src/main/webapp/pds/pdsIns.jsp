<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsIns.jsp -->
<h3>사진 업로드 결과</h3>

<%
	try {
		//1) 첨부된 파일 저장
		String saveDirectory = application.getRealPath("/storage");
		int maxPostSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

		//2) 1)에서 저장한 파일의 파일명, 크기 가져오기
		String fileName = "";	//파일명
		long fileSize = 0;		//파일 크기
		File file = null;		//실제 파일을 담을 변수
		String item = "";		//input의 name 속성 값을 담을 변수
		
		Enumeration files = mr.getFileNames(); //mr에서의 <input type="file"> 가져오기
		while(files.hasMoreElements()){	//여러개의 파일 첨부하는 경우 하나씩 가져오기
			item = (String)files.nextElement(); //name="filename"에 첨부된 파일을 변수에 저장
			fileName = mr.getFilesystemName(item);//mr객체에서 item이 가진 실제 파일명 가져오기
			
			//가져온 파일명이 하나라도 존재한다면
			if(fileName != null){
				//mr에서 실제 파일 가져오기
				file = mr.getFile(item);
				//파일이 존재하는지
				if(file.exists()){
					//존재하면 파일 크기 저장
					fileSize = file.length();
				}//if end
			}//if end
			
		}//while() end

		//3) tb_pds 테이블에 저장
		String wname = mr.getParameter("wname").trim();
		String subject = mr.getParameter("subject").trim();
		String passwd = mr.getParameter("passwd").trim();
		
		//dto객체에 저장
		pdsDto.setWname(wname);
		pdsDto.setSubject(subject);
		pdsDto.setPasswd(passwd);
		pdsDto.setFilename(fileName);
		pdsDto.setFilesize(fileSize);
		
		int cnt = pdsDao.create(pdsDto);
		if(cnt == 0){
			out.println("<p>사진 등록에 실패했습니다");
			out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
		} else {
			out.println("<script>");
			out.println("alert('사진 업로드가 완료되었습니다');");
			out.println("location.href='pdsList.jsp';");//목록 페이지로 이동
			out.println("</script>");
		}//if end

	} catch(Exception e){
		out.print(e);
		out.print("<p>사진 업로드 실패</p>");
		out.print("<a href='javascript:history.back();'>다시 시도</a>");
	}//end
%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>