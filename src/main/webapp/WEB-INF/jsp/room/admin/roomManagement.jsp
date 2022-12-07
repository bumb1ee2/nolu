<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import ="com.sun.org.apache.bcel.internal.generic.Select" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	/*전체*/
	#wrap{width:100%;height : auto; min-height:100%; background-color:white; font-family: 'Jeju Gothic', sans-serif;
		padding-top: 123px;/* header height */ padding-bottom:200px;/* footer height */min-width: 800px;}
	#wrap a{text-decoration: none;}	
	#wrap_box{width:100%; padding:0; margin:0 auto;}
	/*타이틀*/	
	#wrap h1{font-size:25px; text-align:center; float:center; padding:5px; margin-bottom:0px;}
	/*메인*/
	.content {text-align:center;}
	.resTable {width:580px; margin:0 auto; border:1px solid gray; border-radius:10px;}
	.resTable tr {height:30px;}
	/*버튼*/
    .btn2{width:80px; heieght:20px; font-size:12px; background:gray; color:white; 
    	border:none; border-radius:5px; padding:7px; margin:3px; }
    .btn2:hover{background:black; color:white;}	
    /*내부*/
    #r_state{ width:180px; height: 25px; text-align: center; }
</style>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<div id="wrap">
<div id="wrap_box">
	<h1>객실 현황</h1>
	<br>
	<div class="content">
		<table class="resTable">
			<thead>
			<tr>
				<th>객실명</th>
				<th>객실상태</th>
				<th>객실 세부사항</th>
			</tr>
			</thead>
			<tbody>
				<c:if test="${rooms == null }">
				<tr>
					<td colspan="3">객실이 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${rooms != null }">	
					<c:forEach var="room" items ="${rooms }" varStatus="status">
					<tr>
						<form name="roomDetailForm${room.r_num }" action="roomState.do" method="post">
						<td width="50px;">${room.r_num }호 <input type="hidden" name="r_num" id="r_num" value="${room.r_num }"/></td>
						<td width="10px;">
							<select id="r_state" name="r_state">
								<c:choose>
									<c:when test="${room.r_state =='활성화' }">
										<option value="활성화" selected="selected">활성화</option>
										<option value="비활성화">비활성화</option>
									</c:when>
										<c:otherwise>
											<option value="활성화">활성화</option>
											<option value="비활성화" selected="selected">비활성화</option>
										</c:otherwise>
								</c:choose>
							</select>
						</td>
						<td width="140px;">
							<a href="javascript:roomDetailForm${room.r_num }.submit()" style="">
							<button class="btn2">저장</button></a>
							<a href="${pageContext.request.contextPath }/roomDetail.do?r_num=${room.r_num }">
							<input type="button" value="수정하기"  class="btn2"/>
							
						</td>
						</form>
					</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>	
	</div>
</div>
</div>
<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
</html>