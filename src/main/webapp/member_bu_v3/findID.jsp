<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 findID.jsp -->
<h3><strong>아이디/비밀번호 찾기</strong></h3>
<p>이름과 인증받을 이메일을 입력해주세요</p>

<form name="findidfrm" id="findidfrm" method="post" action="findIDProc.jsp" onsubmit="return findIDCheck()">
	<table class="table form-inline">
		<tr>
			<td><label>이름</label></td>
			<td>									<!-- 쿠키 체크 안했으면 빈 문자열, 쿠키 저장했으면 해당 값 -->
				<input type="text" name="mname" id="mname" maxlength="10" placeholder="이름을 입력해주세요" class="form-control" required>
			</td>
		</tr>
		<tr>
			<td><label>이메일</label></td>
			<td>
				<input type="text" name="email" id="email" maxlength="50" placeholder="인증받을 이메일 주소" class="form-control" required>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<!-- type=image는 기본 속성이 submit -->
				<input type="submit" value="아이디/비밀번호 찾기" class="btn btn-custom1">
			</td>
		</tr>
	</table>
</form>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>