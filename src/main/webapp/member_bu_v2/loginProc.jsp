<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 loginProc.jsp -->
<%
	String id = request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	
	memberDto.setId(id);
	memberDto.setPasswd(passwd);
	
	String mlevel = memberDao.loginProc(memberDto);
	if(mlevel == null){
		out.println("<p>회원 정보가 존재하지 않습니다<br>아이디 및 비밀번호를 다시 한 번 확인해주세요</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</a></p>");
	} else {
		//out.print("로그인 성공<br>");
		//out.print("회원 등급은 " + mlevel + "입니다.");
		
		//다른 페이지에서도 로그인/로그아웃 상태에 대한 정보를 공유할 수 있도록
		session.setAttribute("s_id", id);
		session.setAttribute("s_passwd", passwd);
		session.setAttribute("s_mlevel", mlevel);
		
		//※ 참조 http://pretyimo.cafe24.com/lectureRead.do?lectureno=217
		//쿠키 시작
		//->웹서버가 사용자PC에 저장하는 텍스트 파일로 된 정보
	    //->각 브라우저의 쿠키삭제의 영향을 받는다
	    //->보안에 취약하다
        //->예)아이디저장, 오늘창그만보기, 클릭한상품목록
	    //->예)오늘창그만보기는 자바스크립트 쿠키. 참조)https://www.w3schools.com/js/js_cookies.asp
	
		//<input type="checkbox" name="c_id" value="SAVE">ID 기억하기
		String c_id = Utility.checkNull(request.getParameter("c_id"));
		Cookie cookie = null;
		if(c_id.equals("SAVE")){
			//ID기억하기에 체크 했으면
			//쿠키 인스턴스 생성 new Cookie("변수명", 값)
			cookie = new Cookie("c_id", id);
			//쿠키 유효 기간 1개월
			cookie.setMaxAge(60*60*24*30); //각 브라우저의 쿠키삭제에 영향 미침
		} else {
			cookie = new Cookie("c_id", "");
			cookie.setMaxAge(0);
		}//if end
		
		//요청한 사용자 PC에 쿠키값 저장
		response.addCookie(cookie);
		
		//쿠키 끝
		
		//로그인 완료 후 첫 페이지로 이동
		//http://localhost:9090/basic06_myweb/index.jsp
		String root = Utility.getRoot(); // /basic06_myweb 반환
		
		//클라이언트를 다른 페이지로 리다이렉트 / http 응답을 클라이언트에게 보내고, 클라이언트는 지정한 URL로 이동
		response.sendRedirect(root + "/index.jsp");
		
	}//if end
%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>