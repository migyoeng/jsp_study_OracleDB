<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 blank.jsp -->
<h3>회원가입 결과</h3>

<%
	//1) 사용자가 입력 요청한 값 가져오기
	String id = request.getParameter("id").trim();
	String passwd = request.getParameter("passwd").trim();
	String mname = request.getParameter("mname").trim();
	String email = request.getParameter("email").trim();
	String tel = request.getParameter("tel").trim();
	String zipcode = request.getParameter("zipcode").trim();
	String address1 = request.getParameter("address1").trim();
	String address2 = request.getParameter("address2").trim();
	String job = request.getParameter("job").trim();
	
	//2) dto 객체에 저장
	memberDto.setId(id);
	memberDto.setPasswd(passwd);
	memberDto.setMname(mname);
	memberDto.setEmail(email);
	memberDto.setTel(tel);
	memberDto.setZipcode(zipcode);
	memberDto.setAddress1(address1);
	memberDto.setAddress2(address2);
	memberDto.setJob(job);
	
	//3) member 테이블에 추가하기
	int cnt = memberDao.create(memberDto);
	if(cnt == 0){
		out.print("회원가입에 실패했습니다");
		out.print("<p><a href='javascript:history.back()'>[다시 시도]</></p>");
	} else {
		out.print("<script>");
		out.print("alert('회원가입이 성공적으로 완료되었습니다');");
		out.println("location.href='loginForm.jsp';");
		out.print("</script>");
	}//if end

%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>