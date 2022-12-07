<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/3442ebfa65.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">	
<title>놀러올레</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
/*전체*/
body{height:100%;}
html, body {margin:0; padding:0;}
#wrap *{font-family:'Jeju Gothic', sans-serif;}	
#wrap{width:100%; height : auto; min-height:100%; /* footer height */}
#wrap a{text-decoration: none; color:white; z-index:-1;}	
video {position: absolute; top: 0; left: 0; bottom:0; width: 100%; padding:0; margin:0; height : auto; min-height:100%; z-index: -3; 
		o-object-fit: cover; object-fit: cover; -o-object-position: center; object-position: center;}
/* 중간 메인 */
#main{width:100%; margin:0 auto;text-align:center;}
#title {width: 20%; height:100%; margin:0 auto; border:1px solid black; padding: 50px; 
	margin-top: 10%;}
#title a {text-decoration:none; color:rgba(0,0,0,0.7);}
#title:hover {background-color:rgba(255,255,255,0.3); transition-duration: 0.5s;}
#title h2 {vertical-align: center; text-align: center; font-size:40px;}


/*푸터*/
.footerBox{width:100%; left: 0; bottom: 0; background-color:white; position : relative; transform : translateY(-100%);}
.footerBox{width:100%; }
#footer{width:100%; height:150px; margin:0; padding:0; bottom: 0; left:0; right:0;
border-top:1px solid black; margin:0 auto; text-align: center;}
#left{width:19%; height:100%; text-align:center; float:left; margin:0 auto;}
#left img{width:100px; padding-top:25px; padding-left:15%; margin:0 auto;}
#middle{width:40%; height:100%; margin:0 auto; text-align:left; float:left;}
#middle p{padding-top:20px; padding-left:40%; line-height:1px;}
#right{width:40%; height:100%; text-align:left; float:left;}
#right p{padding-top:12px; padding-left:25%; line-height:1px;}
#bold{ font-size:20px;}
#big{font-size:15px;}
</style>
</head>
<%@ include file="common/main_header.jsp" %>
<body>

	<video autoplay muted loop>
		<source src="${pageContext.request.contextPath}/images/nol/Sea.mp4" type="video/mp4">
	</video>
<div id="wrap">	
	<div id="main">
		<div id="title">
			<a href="${pageContext.request.contextPath}/main.do">
			<h2>NoluOlle</h2></a>
		</div>
	</div>
</div>
</body>
</html>