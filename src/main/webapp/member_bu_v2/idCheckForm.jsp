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
		div{
			text-align: center;
		}
		h4{
			padding: 20px;
		}
		.form-control{
			display: inline;
			width: 50%;
		}
		.btn{
			margin-top: 20px;
		}
	</style>
</head>
<body>
	<div class="container">
		<h4><strong>아이디 중복 확인</strong></h4>
		<form method="post" action="idCheckProc.jsp" onsubmit="return blankCheck()">
				<label>아이디 입력:
				<input type="text" name="id" id="id" maxlength="10" required autofocus class="form-control">
				</label>
				<br>
				<input type="submit" value="중복 확인" class="btn">
		</form>
	</div>
	
	<script>
		//아이디 중복확인 시 아이디 입력 값 체크
		function blankCheck() {
			let id = document.getElementById("id").value;
			id = id.trim();
			if(id.length<5){
				alert("아이디는 5~10글자 이내로 입력해 주세요");
				return false;
			}//if end
			
			return true;
		}//blankCheck() end
	</script>
</body>
</html>