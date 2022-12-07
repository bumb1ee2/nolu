<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	/*전체*/
	html, body {left:0; right:0; margin:0; padding:0;}
	#wrap{width:100%;height : auto; min-height:100%;background-color:white; font-family: 'Jeju Gothic', sans-serif;
		padding-top: 26px;/* header height */ padding-bottom:200px;/* footer height */}
	#wrap a{text-decoration: none;}	
	#wrap_box{width:70%; padding:0; margin:0 auto; padding:40px;}
	/*타이틀*/	
	#wrap h2{font-size:25px; text-align:center; float:center; padding:20px;}
	/*검색창*/
	.search {width:70%; bottom:0; text-align:right; float:right; margin-bottom:20px;}
	input[type=text]{height:20px;}	
	/*메인*/
	.content {text-align:center;}
	.resTable {width:100%; margin:0 auto; border:1px solid gray; border-radius:10px; padding:30px;}
	.resTable tr {height:30px;}
	/*[이전][다음]버튼*/
	.menu{text-align:center; margin:0; padding:0;}
	.menu li{display:inline; }
	.menu li #icon img{width: 20px; height: 20px; }
	.menu a{display: inline-block; padding:10px; text-decoration:none;}
	.menu #a{color:black; text-decoration:none;}
	/*페이징*/
	#paging{color: gray; text-decoration:none;}
	#paging a {color: gray; text-decoration:none; }	
	/*버튼*/
    .btn2{width:50px; heieght:20px; font-size:12px; background:gray; color:white; 
    	border:none; border-radius:8px; padding:7px;}
    .btn2:hover{background:black; color:white; cursor:pointer;}	
</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>
<div id="wrap">
<div id="wrap_box">
	<h2>회원 관리</h2>
	<br><br>	
	<div class="content">
		<form method="post" name="form_del">
			<table class="resTable">
				<thead>
					<tr>
						<th>아이디</th>	<!-- m_id -->
						<th>이름</th>		<!-- m_name -->
						<th>연락처</th>	<!-- m_tel -->
						<th>생년월일</th>	<!-- m_birth -->
						<th>이메일</th>	<!-- m_email -->
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(memList) == 0}">
							<tr>
								<td id="td" colspan="6">조회된 사용자가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${fn:length(memList) > 0}">
							<c:forEach var="member" items="${memList}">
								<tr>
									<td>${member.m_id}</td>		<!-- 아이디 -->
									<td>${member.m_name}</td>	<!-- 이름 -->
									<td>${member.m_tel}</td>	<!-- 연락처 -->
									<td>${member.m_birth}</td>	<!-- 생년월일 -->
									<td>${member.m_email}</td>	<!-- 이메일 -->
									<td>
										<a href="memDelAdmin.do?id=${member.m_id}"><input type="button" value="탈퇴" class="btn2"></a>
									</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</form>		
	</div>
</div>
</div>
</body>
<%@ include file="../common/footer.jsp" %>
</html>