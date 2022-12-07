<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>놀러올레</title>

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body {
	margin: 0 auto;
}

body, table, div, p, span {
	font-family: 'Jeju Gothic', sans-serif;
}

a {
	text-decoration: none;
	color: #333;
}

#con {
	width: 100%;
	height: auto;
	min-height: 100%;
	background-color: white;
	padding-bottom: 200px;
}

#login {
	width: 400px;
	margin: 0 auto;
}

#login_form {
	border-radius: 10px;
	padding: 50px;
	background: #fff;
	text-align: center;
	border: 1px solid gray;
	margin-top: 100px;
}

.login {
	font-size: 25px;
	font-weight: 900;
	color: #333;
}

.size {
	width: 300px;
	height: 30px;
	padding-left: 10px;
	background-color: #f4f4f4;
	border: none;
	border-radius: 5px;
}

.btn2 {
	width: 300px;
	height: 40px;
	font-size: 15px;
	background-color: gray;
	color: #fff;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.btn2:hover {
	background: black;
	color: white;
	cursor: pointer;
}

hr {
	margin-top: 20px;
	background: #eee;
}

label {
	line-height: 40px;
}
</style>

</head>

<body>

	<%@ include file="../common/header.jsp"%>

	<div id="con">

		<div id="login">
			<div id="login_form">
				<form name="loginform"method="post">
					<h2 class="login" style="letter-spacing: -1px;">LOGIN</h2>
					<hr>

					<label for="id">
						<p style="text-align: left; font-size: 16px; color: #666">아이디</p>
						<input type="text" name="m_id" id="id" class="size" autofocus />

					</label> <label for="pass">
						<p style="text-align: left; font-size: 16px; color: #666">비밀번호
						</p> <input type="password" name="m_pass" id="pass" class="size" />
					</label>

					<hr>
					<br>
					<!-- <input type="button" onclick="javascript:loginform.submit()" value="로그인" class="btn2"/> -->
					<button onclick="javascript:login_btn()" class="btn2">로그인</button>
					<br>
					<br> <input type="button"
						onclick="location.href='joinForm.do';" value="회원가입" class="btn2" />
				</form>
			</div>
		</div>

	</div>

	<jsp:include page="../common/footer.jsp" />

	<script>
		$("#login_form").keypress(function(e) {
			if (e.keyCode === 13) {
				Login();
			}
		});
		
		function login_btn() {
			document.loginform.action="${pageContext.request.contextPath}/loginCheck.do"
			document.loginform.submit();
		}
	</script>

</body>

</html>