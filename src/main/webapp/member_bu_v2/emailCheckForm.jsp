<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>idCheckForm</title>
	
	<!-- jQuery -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
		@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Stylish&display=swap');
		
		body {
			font: 16px "Gowun Batang", dotum, sans-serif;
		}
		h4{
			padding: 20px;
		}
		div{
			text-align: center;
		}
		.form-control{
			display: inline;
			width: 35%;
		}
		.btn{
			margin-top: 20px;
		}
	</style>
</head>
<body>
	<div class="container">
		<h4><strong>이메일 중복 확인</strong></h4>
		<form method="post" action="emailCheckProc.jsp" onsubmit="return blankCheck()" >
			<label>이메일 입력:
			<input type="text" name="email1" id="email1" maxlength="10" required autofocus class="form-control">
			@
			<select name="email2"  id="email2" class="form-control">
				<option value="0" selected>직접 입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="hanmail.com">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="greenit.co.kr">greenit.co.kr</option>
			</select>
			</label>
			<br>
			<input type="submit" value="중복 확인" class="btn">
		</form>
	</div>
	
	<script>
		//아이디 중복확인 시 아이디 입력 값 체크
		function blankCheck() {
			let email1 = document.getElementById("email1").value;
			let email2 = document.getElementById("email2").value;
			email1 = email1.trim();
			email2 = email2.trim();
			let email = email1 + "@" + email2;
			const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
			
			if(pattern.test(email) === false){
				alert("이메일을 다시 한번 확인해주세요");
				return false;
			}//if end
			
			return true;
		}//blankCheck() end
		
	</script>
</body>
</html>