<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsReply.jsp -->
<h3><strong>답변 작성</strong></h3>
<p class="text-right"><a href="bbsList.jsp" class="btn btn-default">글 목록보기</a></p>

<form name="bbsfrm" id="bbsfrm" method="post" action="bbsReplyProc.jsp" onsubmit="return bbsCheck()">
	<!-- 부모 페이지(bbdRead.jsp)에서 넘겨받은 글 번호 -->
	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno") %>">
	<input type="hidden" name="col" value="<%= col%>">
	<input type="hidden" name="word" value="<%= word%>">
	<table class="table table-responsive">
		<tr>
			<th class="text-center active"><label for="wname">작성자</label></th>
			<td><input type="text" name="wname" id="wname" maxlength="20" class="form-control" placeholder="이름을 입력해주세요" required></td>
		</tr>
		<tr>
			<th class="text-center active"><label for="subject">제목</label></th>
			<td><input type="text" name="subject" id="subject" maxlength="100" class="form-control" placeholder="제목을 입력해주세요" required></td>
		</tr>
		<tr>
			<th class="text-center active"><label for="content">내용</label></th>
			<td><textarea id="summernote" name="content" id="content" class="form-control" placeholder="내용을 입력해주세요" required></textarea></td>
		</tr>
		<tr>
			<th class="text-center active"><label for="passwd">비밀번호</label></th>
			<td><input type="password" name="passwd" id="passwd" maxlength="10" class="form-control" placeholder="비밀번호를 입력해주세요" required></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="답글 작성 완료" class="btn btn-default btn-custom">
				<input type="reset" value="재작성" class="btn btn-default">
			</td>
		</tr>
	</table>
</form>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>