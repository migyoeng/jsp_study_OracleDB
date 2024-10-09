<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 blank.jsp -->
<h3><strong>사진 업로드하기</strong></h3>

<p class="text-right">
	<a href="pdsList.jsp" class="btn btn-default">목록보기</a>
</p>

<form method="POST" action="pdsIns.jsp" enctype="multipart/form-data" onsubmit="return pdsCheck()">
	<table class="table table-responsive">
		<tr>
		    <th>이름</th>
		    <td style="text-align: left">
		         <input type="text" name="wname" id="wname" size="20" maxlength="100" class="form-control" required autofocus>
		    </td>
		</tr>
		<tr>
		    <th>제목</th>
		    <td style="text-align: left">
		    	<textarea rows="5" cols="30" name="subject" id="subject" class="form-control"></textarea>
		    </td>
		</tr>
	<tr>
		    <th>비밀번호</th>
		    <td style="text-align: left">
		        <input type="password" name="passwd" id="passwd" maxlength="15" class="form-control">
		    </td>
		</tr>
		<tr>
		    <th>첨부파일</th>
		    <td style="text-align: left">
		        <input type="file" name="filename" id="filename" class="form-control">
		    </td>
		</tr>
		<tr>
		    <td colspan="2">
		    	  <input type="submit" value="사진 올리기" class="btn btn-default btn-custom1">
		    	  <input type="reset"  value="취소"      class="btn btn-default">
		    </td>
		</tr>	
	</table>
</form>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>