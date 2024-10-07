<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="auth.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 loginForm.jsp -->
<style>
	.form-inline{
		max-width: 550px;
		margin: 0 auto;
	}
	label{
		display: inline-block;
	}
	#loginfrm td{
		vertical-align: middle;
	}
</style>

<%
	if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")){
		//로그인을 하지 않은 상태의 경우
		
		//ID저장 쿠키 확인 시작
		Cookie[] cookies = request.getCookies(); //사용자 PC에 저장된 모든 쿠키값 가져오기
		String c_id = "";
		if(cookies != null){
			//쿠키 값이 하나라도 있으면
			for(int i=0; i<cookies.length; i++){
				//모든 쿠키 값 탐색 및 비교
				Cookie cookie = cookies[i];
				if(cookie.getName().equals("c_id") == true){ //c_id인 변수명이 존재하는지(loginProc.jsp)
					//존재하면 변수에 담긴 값 가져오기
					c_id = cookie.getValue(); 
				}//if end
			}//for end
		}//if end
		
		//쿠키 확인 끝
%>
	<h3><strong>로그인</strong></h3>
	<form name="loginfrm" id="loginfrm" method="post" action="loginProc.jsp" onsubmit="return loginCheck()">
		<table class="table form-inline">
			<tr>
				<td><label>아이디</label></td>
				<td>									<!-- 쿠키 체크 안했으면 빈 문자열, 쿠키 저장했으면 해당 값 -->
					<input type="text" name="id" id="id" value="<%=c_id %>" maxlength="10" placeholder="아이디" class="form-control" required>
				</td>
				<td rowspan="2">
					<!-- type=image는 기본 속성이 submit -->
					<input type="submit" value="로그인" class="btn btn-custom1">
				</td>
			</tr>
			<tr>
				<td><label>비밀번호</label></td>
				<td>
					<input type="password" name="passwd" id="passwd" maxlength="10" placeholder="비밀번호" class="form-control" required>
				</td>
			</tr>
			<tr>
				<td colspan="3">											<!-- c_id가 빈 값이 아니라면 -->
					<label><input type="checkbox" name="c_id" value="SAVE" <%if(!c_id.isEmpty()){out.print("checked");} %>> ID 기억하기</label>
				</td>
			</tr>
			<tr>
				<td colspan="3" rowspan="2">아직 회원이 아니신가요?<br>
					<a href="agreement.jsp">회원가입</a>
					&nbsp;|&nbsp;
					<a href="#">아이디/비밀번호 찾기</a>
				</td>
			</tr>
		</table>
	</form>
<%
	} else {
		//로그인을 한 상태의 경우
		out.println("<h3><strong>로그아웃</strong></h3>");
		out.println("<strong>" + s_id + "</strong>님, 로그아웃 하시겠습니까?<br>");
		out.println("<a href='logout.jsp'>[로그아웃]</a>");
	}//if end
%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>