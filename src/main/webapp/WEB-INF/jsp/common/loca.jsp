<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    <style>
   @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);   
   h1 {font-family: 'Jeju Gothic', sans-serif;text-align:center;line-height:50px; font-size:25px;}
   h2 {text-align:center; line-height:50px; font-size:20px;}

</style>
    
</head>
<body>
<jsp:include page="header.jsp"/>
		<br><br><br><br>
		<h1>NOLUOLLE</h1>
		<h2>찾아오시는 길 <br>
		주소 : 제주시 애월읍 고내리 474-6 <br>
		TEL : 1234 - 1234</h2>
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:500px;height:500px;margin:0 auto;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6932ae19ad9f900853e8f01a89faf72a"></script>
	
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.468467, 126.340367),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
<jsp:include page="footer.jsp"/>
</body>
</html>