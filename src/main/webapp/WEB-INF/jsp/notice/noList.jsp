<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	body, table, div, p ,span{font-family: 'Jeju Gothic', sans-serif;}
	/*전체*/
	.main{width:100%; height : auto; min-height:100%; padding:0; padding-top: 65px;/* header height */ padding-bottom:200px; min-width: 900px;}
	.main hr{margin-top:20px;background:#eee;}
	/*타이틀*/
	.main h2{font-size:25px; text-align:center; float:center; padding:20px;}
	/*메인*/
	.content {text-align:center;}
	.resTable {width:70%; margin:0 auto; margin-bottom:50px; border:1px solid gray; border-radius:10px; padding:30px; min-width: 600px; max-width: 900px;}
	.resTable a {text-decoration:none;}
	.resTable tr {height:30px;}
	.resTable #mainTitle{background:gray; border:none; border-radius:5px; text-align:left; padding-left:10px;}
	.resTable #mainTitle a{text-decoration:none; color:white; }
	.resTable #title{text-align:left; padding-left:10px;}
	.resTable #title a{color:black;}
	/*고정글*/
	.mega{width: 20px; height: 20px; margin-left:5px;}
	/*답글*/
	.re{width:20px; height:20px; margin-left:5px;}
	/*[이전][다음]버튼*/
	.menu{text-align:center; margin:0; padding:0;}
	.menu li{display:inline; }
	.menu li #icon img{width: 20px; height: 20px; }
	.menu a{display: inline-block; padding-bottom:10px; text-decoration:none;}
	.menu #a{color:black; text-decoration:none;}
	/*페이징*/
	#paging{color: gray; text-decoration:none;}
	#paging a {color: gray; text-decoration:none; }
	/*버튼*/
    .btn2{width:100px; heieght:20px; font-size:15px; background:gray; color:white; 
    	border:none; border-radius:8px; padding:7px; margin-top:15px;}
    .btn2:hover{background:black; color:white;}	
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<!-- 게시판 리스트 -->
<div class="main">
	<h2>공지사항</h2>
	<br><br>
<c:choose>
<c:when test="${noList ne null }">

	<div class="content">
		<table class="resTable">
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		</thead>
			<tbody>
			<c:forEach var="up" items ="${upList }" begin="0" end="4">
			<tr>
				<td>
				<img src="${pageContext.request.contextPath}/images/nol/megaphone.png" class="mega"/>
				<input type="hidden" value="${up.n_num }"></td>
				<td id="mainTitle">
				<a href="noDetail.do?n_num=${up.n_num }">
				※${up.n_subject }</a></td>
				<td>
				<c:if test="${up.m_id eq 'admin' }">Noluolle</c:if></td>
				<td>${up.n_date }</td>
				<td>${up.n_readcount }</td>
			</tr>
			</c:forEach>
			<c:forEach var="notice" items ="${noList }">
			<tr>
				<td>${notice.n_num }</td>
				<td id="title">
				<a href="noDetail.do?n_num=${notice.n_num }">${notice.n_subject }</a></td>
				<td>
				<c:if test="${notice.m_id eq 'admin' }">Noluolle</c:if>
				<c:if test="${notice.m_id ne 'admin' }">${notice.m_id }</c:if>
				</td>
				<td>${notice.n_date }</td>
				<td>${notice.n_readcount }</td>
			</tr>
			</c:forEach>
		</table>	
		
		<c:if test="${m_id eq 'admin' }">
	<br><a href="${pageContext.request.contextPath}/noWriteForm.do">
		<button class="btn2">글쓰기</button></a>
		</c:if>
</c:when>
	<c:otherwise>
		<table class="resTable">
		<tr>
			<td>
			<section id="emptyArea" align="center">등록된 글이 없습니다.</section>
			</td>
		<c:if test="${m_id eq 'admin' }">
		<tr>
			<td>
			<a href="${pageContext.request.contextPath}/noWriteForm.do">
			<button class="btn2">글쓰기</button></a>
			</td>
			</tr>
		</c:if>
		</tr>
		</table>
	</c:otherwise>
</c:choose>
</div>
</div>
</div>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>