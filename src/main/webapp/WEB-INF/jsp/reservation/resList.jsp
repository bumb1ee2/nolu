<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	/*전체*/
	#wrap{width:100%;height : auto; min-height:100%;background-color:white; font-family: 'Jeju Gothic', sans-serif;
		padding-top: 80px;/* header height */ padding-bottom:200px;/* footer height */}
	#wrap a{text-decoration: none;}	
	#wrap_box{width:70%; height:100%; padding:0; margin:0 auto;}
	/*타이틀*/	
	#wrap h2{font-size:25px; text-align:center; float:center; padding:5px; margin-bottom:0px;}
	/*검색창*/
	.search {width:70%; bottom:0; text-align:right; float:right; margin-bottom:20px;}
	/*메인*/
	.content {text-align:center;}
	.resTable {width:100%; height:100%; margin:0 auto; border:1px solid gray; border-radius:10px; padding:30px;}
	.resTable tr {height:30px;}
	/*버튼*/
    .btn2{width:50px; heieght:20px; font-size:12px; background:gray; color:white; 
    	border:none; border-radius:8px; padding:7px;}
    .btn2:hover{background:black; color:white;}	
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div id="wrap">
<div id="wrap_box">
	<h2>예약 관리</h2>
	<br><br>
	<div class="content">
			<table class="resTable">
				<thead>
					<tr>
						<th>예약번호</th>		<!-- res_num -->
						<th>예약자</th>		<!-- m_id -->
						<th>예약일</th>		<!-- res_date -->
						<th>체크인</th>		<!-- res_checkIn -->
						<th></th>			<!-- ~ 들어갈 행 -->
						<th>체크아웃</th>		<!-- res_day -->
						<th>방번호</th>		<!-- r_num -->
						<th>결제상태</th>		<!-- res_state -->
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(reservationList) == 0}">
							<tr>
								<td id="td" colspan="8">예약된 객실이 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${fn:length(reservationList) > 0}">
							<c:forEach var="reservation" items="${reservationList}">
								<tr>
									<form name="resModForm${reservation.res_num }" action="resMod.do" method="post">
									<input type="hidden" name="res_num" value="${reservation.res_num}"/>
									<td>${reservation.res_num}</td>			<!-- 예약번호 -->
									<td>${reservation.m_id}</td>			<!-- 예약자 -->
									<td><fmt:formatDate value="${reservation.res_date }" pattern="yyyy-MM-dd"/></td>		<!-- 예약일 -->
									<td><fmt:formatDate value="${reservation.res_checkIn }" pattern="yyyy-MM-dd"/></td>		<!-- 체크인 -->
									<td>&nbsp;~&nbsp;</td>							
									<td><fmt:formatDate value="${reservation.res_checkOut }" pattern="yyyy-MM-dd"/></td>	<!-- 체크아웃 -->
									<td>${reservation.r_num}</td>			<!-- 방번호 -->						
 									<td>										
										<select id="res_state" name="res_state">
										<c:choose>
											<c:when test="${reservation.res_state == '결제대기' }">
												<option value="결제대기" selected="selected">결제대기</option>
												<option value="예약완료">예약완료</option>
												<option value="예약취소">예약취소</option>
											</c:when>
											<c:when test="${reservation.res_state == '예약완료' }">
												<option value="결제대기">결제대기</option>
												<option value="예약완료" selected="selected">예약완료</option>
												<option value="예약취소">예약취소</option>
											</c:when>
											<c:otherwise>
												<option value="결제대기">결제대기</option>
												<option value="예약완료">예약완료</option>
												<option value="예약취소" selected="selected">예약취소</option>
											</c:otherwise>
										</c:choose>
										</select>
									</td>
									<td>
										<a href="javascript:resModForm${reservation.res_num }.submit()" class="btn2">수정</a>&nbsp;
										<a href="resDel.do?res_num=${reservation.res_num }" class="btn2">삭제</a>									
									</td>									
									</form>	
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
		</table>		
	</div>
	
</div>
</div>

<script>
	
</script>
</body>
<%@ include file="../common/footer.jsp" %>
</html>