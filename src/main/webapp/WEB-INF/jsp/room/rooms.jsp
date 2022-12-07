<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<style>
/*all*/
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);   
   #all {font-family: 'Jeju Gothic', sans-serif; height : auto; min-height:100%;  }
/*top*/
	.top{text-align: center; margin: 50px; padding-top:40px;}
	.pre{font-size: 50px; margin:15px;}
/*rooms*/
	.room{width: 825px; display: flex; align-items:center; 
			margin:0 auto; border:1px solid black; }
	.room *{vertical-align:middle;}
	#productImage{width:400px; }
	#room102, #room104{flex-direction: row-reverse;}
	#room104{margin-bottom: 80px;}
	.list{width:400px; text-align: center; line-height: 17px;}
	.allroom{margin-top: 40px;}
	.color{width:25px; height:40px; border:1px solid pink;  background:lightgrey;}
	.title{font-size: 20px; font-weight: bold;}
/*버튼*/
	.btn2{width:100px;height: 40px;font-size:15px;background-color: gray;color:#fff;border:none;cursor: pointer;border-radius: 5px; margin-top: 10px;}
    .btn2:hover{background:black;}
</style>
</head>
  
<body>
<jsp:include page="../common/header.jsp"/>

<section id="all">
	<div class="top">
		<p class="pre">PREVIEW</p>
		<P>객실 미리보기</P>
	</div>
	<div class="rooms">
		<c:forEach var="rooms" items ="${rooms }" varStatus="status">
			<div class="allroom">
			<div class="room" id="room${rooms.r_num }">
				<span class="list">
					<p><span class="title">ROOM ${rooms.r_num }</span><br>
					- ${rooms.r_num }호 객실 -<br><br>
					객실타입 : ${rooms.r_type }<br>
					인원 : 기준인원 ${rooms.r_base_person }&nbsp;/&nbsp;최대인원 ${rooms.r_max_person }
					</p>
					<a href="${pageContext.request.contextPath }/roomview.do?r_num=${rooms.r_num }"><input type="button" value="보러가기" class="btn2"></a>
				</span>
					<img src="${pageContext.request.contextPath}/images/img_room/${rooms.r_img1 }" id="productImage">
				<div class="color"></div>
			</div>
			</div>
		</c:forEach>
	</div>
</section>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>