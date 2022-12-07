<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	/*전체*/
	#wrap{width:100%;height : auto; min-height:100%;background-color:white; font-family: 'Jeju Gothic', sans-serif;
		padding-top: 100px;/* header height */ padding-bottom:200px;/* footer height */}
	#wrap a{text-decoration: none;}	
	/*로그인*/
	#login{width:40%; margin:0 auto;}
	#login_form{width:400px; margin:0 auto; border-radius: 10px;padding:50px;background: white;
				text-align: center;border: 1px solid gray;}		
	.login{font-size:25px; font-weight: 900; color:black;}
	.size{width:300px;height:30px;background-color: #f4f4f4;
		border:none;border-radius:10px; padding:5px; color:black;}	
	#wrap hr{margin-top:20px;background:#eee;}
	#wrap label{line-height:40px;}
	
	/*버튼*/
    .btn2{width:100px; heieght:20px; font-size:15px; background:gray; color:white; 
    	border:none; border-radius:8px; padding:7px;}
    .btn2:hover{background:black; color:white;}	
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div id="wrap">
	<div id="login">
  <div id="login_form">
   <form name="deleteForm" action="noDelChk.do" method="post">
    <label for ="id">
    <input type="hidden" name="n_num" id="n_num" value="${n_num }"/>
    
    <p style="text-align: left; font-size:16px; color:#666">글 비밀번호</p>
    <input type="password" name="n_pass" id="n_pass" class="size" autofocus/>
    </label>
    <hr>
    <br>
    <input type="submit" value="삭제" class="btn2"/>
    &nbsp;&nbsp;
    <input type="button" onClick="javascript:history.go(-1)" value="돌아가기" class="btn2"/>
   </form>
  </div>
 </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>