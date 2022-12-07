<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	/*전체*/
	#wrap{width:100%;height : auto; min-height:100%;background-color:white; font-family: 'Jeju Gothic', sans-serif;
		padding-top: 100px;/* header height */ padding-bottom:200px;/* footer height */}
	#wrap a{text-decoration: none;}	
	/*타이틀*/
	.login{font-size:25px; font-weight: 900; color:black;}
	/*메인*/
	#mypage_form{width:400px; margin:0 auto; border-radius: 10px;padding:50px;background: white;
				text-align: center;border: 1px solid gray;}
	.mypage .mypage1{width:45%; height:100%; text-align: left; box-sizing: border-box;
		float:left; margin:0 auto; display: inline-block; vertical-align: middle; padding-left:50px;}
	.mypage .mypage2{width:45%; height:100%; text-align: left; box-sizing: border-box;
		float:left; margin:0 auto; display: inline-block; vertical-align: middle;}
	#p1{text-align:left; font-size:16px; color:#666; line-height:50px;}
	#p2{text-align:left; font-size:16px; color:black; line-height:50px;}	
	/*버튼*/
	.btn2{width:300px;height:40px;font-size:15px;background-color:gray;
		color:#fff; border:none; cursor: pointer; border-radius: 5px;}
	.btn2:hover{background:black; color:white;}
	.btn3{width:140px;height:40px;font-size:15px;background-color:gray;
		color:white;border:none;cursor:pointer;border-radius:5px;}
	.btn3:hover{background:black; color:white;}
	#wrap hr{margin-top:20px;background:#eee;}
	#wrap label{line-height:40px;}
</style>
</head>
<body>
<script>
	function deleteChk(id) {
		if(confirm("탈퇴하시겠습니까?")) {
			alert('탈퇴처리되었습니다');
			location.href = "memDel.do?id=${mem.m_id}";
		}
	}
</script>
<jsp:include page="../common/header.jsp"/>
	<div id="wrap">
		<div id="mypage_form">
				<h2 class="login" style="letter-spacing:-1px;">마이페이지</h2>
		        <hr><br>
		        <div class="mypage">
		        	<div class="mypage1">
			        <p id="p1">아이디</p>
					<p id="p1">비밀번호</p>
			        <p id="p1">이름</p>
			        <p id="p1">전화번호</p>
			        <p id="p1">생년월일</p>
			        <p id="p1">이메일</p>
			        </div>
			        <div class="mypage2">
					<p id="p2">${mem.m_id }</p>
					<p id="p2">********</p>
					<p id="p2">${mem.m_name }</p>
					<p id="p2">${mem.m_tel }</p>		
					<p id="p2">${mem.m_birth }</p>
					<p id="p2">${mem.m_email }</p>
					</div>  
    			</div>
    			<br><br>
            		 <input type="button" onclick="location.href='reservInfo.do?m_id=${mem.m_id }';" 
            		 		value="내 예약확인" class="btn2"/><br><br>			 
					<input type="button" onclick="location.href='memModForm.do?id=${mem.m_id }';" 
					value="수정" class="btn3"/>&nbsp;&nbsp;
					<input type="button" onclick="javascript:deleteChk('${mem.m_id }')" 
					value="탈퇴" class="btn3"/>

		</div>	
	</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>