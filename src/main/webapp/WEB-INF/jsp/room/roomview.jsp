<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Noluolle</title>
<style>
/*all*/
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);   
   #room {font-family: 'Jeju Gothic', sans-serif; text-align: center; font-size: 16px; height : auto; min-height:100%; padding-bottom: 50px;}
/*img*/
	.room_img img{width:70%; max-width: 900px;}
/*내용*/
	.room_img{padding-top:100px; min-width: 900px;}
	.room_table{width:700px; margin:0 auto; border:1px solid gray; text-align:center;border-collapse: collapse;}
	.room_table th, .room_table td{border:1px solid gray;}
	.room_table td{padding:10px;}
	.room_table th{padding:5px;}
	.red{color:red; font-size: 0.8em;}
	.info{padding-top:20px;}
	.room_info{margin:auto; min-width: 900px}
	p{padding:2px;}
	.amenty1{width:90%; margin:0 auto; word-break: keep-all;}
	.info_table{margin:0 auto; border:0px; border-collapse: collapse; width:700px;}
	.info_table td{padding: 8px;}
	.title{text-align: left;}
	.info_right{text-align: right;}
	.info_table th{border-bottom: 1px solid gray;}
	#amenty{margin-bottom:40px;  padding-top:50px;}
	.other{font-size: 0.9em; color: gray;}
	
/*버튼*/
	.btn2{width:134px;height: 45px;font-size:15px;background-color: gray;color:#fff; border:none;
			 cursor: pointer;border-radius: 5px;}
    .btn2:hover{background:black; }
    .button *{display:inline; padding:0px; text-decoration: none;}
</style>
</head>
<body>
<!-- 상단메뉴 -->
<jsp:include page="../common/header.jsp"/>

<section id="room">
	<div class="room_img">
		<img src="${pageContext.request.contextPath}/images/img_room/${room.r_img2 }"/>
	</div>
	
	<!-- 내용 -->
	<div class="room_info">
		<div class="info">
		<h1>객실정보 안내(${room.r_num}호)</h1>
		<br>
		<p>입실시간 : 15시 ~ 22시 &nbsp;&nbsp;&nbsp;&nbsp;퇴실시간 : 11시<br><br>
		<span class="red">※입실시간 이후 입실은 미리 연락부탁드립니다.</span></p><br>
		</div>
		<table class="room_table">
			<tr>
				<th rowspan="2">객실 명</td>
				<th colspan="2">인원</td>
				<th rowspan="2">객실구성</td>
				<th rowspan="2">요금</td>
				<th rowspan="2">인원추가 요금</td>
			</tr>
			<tr>
				<th>기준</th>
				<th>최대</th>
			</tr>
			<tr>
				<td>${room.r_num }호</td>
				<td>${room.r_base_person }</td>
				<td>${room.r_max_person }</td>
				<td>${room.r_type }</td>
				<td><fmt:formatNumber value="${room.r_base_price}" pattern="#,###"/></td>
				<td>20,000</td>
			</tr>
		</table>
		<p>⊙기준인원 초과시 1인당 2만원이 추가됩니다.(침구 추가제공, 현장결제)<br></p>
		<div class="info" id="amenty">
			<table class="info_table">
				<tr>
				<th class="title">&nbsp;구비시설</th>
				<th class="info_right">+&nbsp;&nbsp;&nbsp;</th>
				</tr>
				<tr>
					<td colspan="2" class="amenty"><p class="amenty1">${room.r_amenty }</p></td>
				</tr>
			</table>
			<p class="other">※환불규정 및 기타 문의사항은 공지게시판을 참고 부탁드립니다.</p>
		</div>
		<!-- 버튼 -->
		<div class="button">
		<a href="${pageContext.request.contextPath}/rooms.do"><input type="button" value="다른 방 보러가기 " class="btn2"></a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath }/reserP.do"><input type="button" value="예약하러가기" class="btn2"></a>
		<br>
		<br>
		</div>
	</div>
</section>
</body>
<!-- footer -->
<jsp:include page="../common/footer.jsp"/>
</html>