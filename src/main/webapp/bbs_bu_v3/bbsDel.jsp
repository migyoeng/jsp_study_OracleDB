<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 bbsDel.jsp -->

<!-- 글 고유번화(bbsno)와 비밀번호(passwd)가 일치해야 삭제 가능 -->
<h3><strong>게시글 삭제</strong></h3>
<p class="text-right"><a href="bbsList.jsp" class="btn btn-default">글 목록보기</a></p>

<form method="post" action="bbsDelProc.jsp" onsubmit="return pwCheck()">
	<!-- hidden 속성으로 글 번호 가져오기 -->
	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno") %>">
	<table class="table table-responsive">
		<tr>
			<th class="text-center active"><label for="passwd">비밀번호</label></th>
			<td><input type="password" name="passwd" id="passwd" maxlength="10" class="form-control" placeholder="비밀번호를 입력해주세요" required></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="삭제하기" class="btn btn-default">
			</td>
		</tr>
	</table>
</form>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>