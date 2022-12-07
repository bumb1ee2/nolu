<%@page import="java.text.DateFormat"%>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	/*전체*/
	#wrap{width:100%;height : auto; min-height:100%;background-color:white; font-family: 'Jeju Gothic', sans-serif;
		padding-top: 50px;/* header height */ padding-bottom:200px;/* footer height */}
	#wrap a{text-decoration: none;}	
	#wrap_box{width:70%; padding:0; margin:0 auto; padding:40px; min-width: 800px;}
	/*타이틀*/	
	#wrap h2{font-size:25px; text-align:center; float:center; padding:20px;}
	/*검색창*/
	input[type=text]{height:20px;}
	.search {width:70%; bottom:0; text-align:right; float:right; margin-bottom:20px;}
	/*메인*/
	.content {text-align:center;}
	.resTable {width:90%; margin:0 auto; border:1px solid gray; border-radius:10px; font-size: 15px; min-width: 550px; max-width: 800px;}
	.resTable tr {height:30px;}
	.res_p{line-height: 20px;}
	/*버튼*/
    .btn2{width:130px; heieght:18px; font-size:15px; background:Gray; color:#fff; font-weight:bold;
    	border:none; border-radius:8px; text-align:center; padding:10px; padding-left:10px; padding-right:10px;}
    .btn2:hover{background:black; color:white;}
</style>



</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div id="wrap">
	<div id="wrap_box">
	<h2>${sessionScope.m_id}님의 예약내역 </h2>
		<div class="content">
			<table class="resTable">
				<thead>
					<tr>
						<th>예약일</th>
						<th>객실</th>
						<th>숙박기간</th>
						<th>결제금액</th>
						<th>진행상황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="res" items="${res }">
					<tr>
						<td><fmt:formatDate value="${res.res_date }" pattern="yyyy-MM-dd"/>
						</td>
						<td>${res.r_num }
						</td>						
						<td>
							<fmt:formatDate value="${res.res_checkIn }" pattern="yyyy-MM-dd"/>
							~ <fmt:formatDate value="${res.res_checkOut }" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<fmt:formatNumber value="${res.price}" pattern="#,###"/>원
						</td>
						<td>${res.res_state }</td>
					</tr>
					</c:forEach>

						<c:if test="${sessionScope.m_id eq null }">
					<tr>
						<td colspan="5"> <br>
						예약내역이 없습니다.<br><br>
						<input type="button" value="예약하러 가기" class="btn" onclick="location.href='${pageContext.request.contextPath}/reserP.do';"/><br><br>
						</td>
						</c:if>
					</tr>
				</tbody>
			</table>
			<p class="res_p">
			<br><br>
			※예약일 기준 1년 이내의 예약건만 조회됩니다.<br>
			※농협은행 377-0606-8282-1 로 입금 부탁드립니다.<br>
			문의사항은 TEL: 1234-1234 로 연락주시기 바랍니다.<br><br></p>
			<input type="button" value="메인화면" class="btn2" onclick="location.href='${pageContext.request.contextPath}/main.do';"/>
			<input type="button" value="뒤로가기" class="btn2" onclick="history.back()">
			<br><br><br>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>