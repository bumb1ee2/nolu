<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<style>
   @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);  
	/*전체*/
   #wrap {margin:0 auto; padding:0; height : auto; min-height:100%; font-family: 'Jeju Gothic', sans-serif; max-width: 1200px;}	
   #wrap { position:relative;
   		padding-top: 100px;/* header height */ padding-bottom:200px;/* footer height */}
   #wrap a {text-decoration-line: none; color: black; text-align: center;}		
	/*타이틀*/
	.over{width:100%; height: 50px;}
	/*메인*/
	.list{width:1200px; margin-left:10px; display:flex; justify-content: space-between; flex-wrap: wrap;}
	.item_img img{width:220px; height: 220px; border-radius: 70%; margin-top: 30px;}
	.item_img {border: 1px solid lightgray; height: 280px; text-align:center;}
	.item {width:24%; margin-bottom: 15px; }
	.item_title{margin-top:10px;}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="wrap">
		<div class="top">
			<div class="over"></div>
			<p><span style="font-size: 60px">TOUR</span></p>
			<p><br></p>
			<p><span style="font-size: 30px">한국의 몰디브 제주에</span></p>
			<p><span style="font-size: 30px">오신것을 환영합니다.</span></p>
		</div>
		<div class="list" style="display: ; position: relative;">
			<div class="over"></div>
			<div class="item">
				<a class="fade_link  " href="https://www.981park.com/" target="_blank" rel = "noopener noreferrer" style="display: block">
					<div class="item_img">
						<img src="${pageContext.request.contextPath}/images/nol/tour_1.jpg">
					</div>
					<div class="item_title">
						<h4>9.81파크</h4>
					</div>
				</a>
			</div>
			<div class="item">
				<a class="fade_link  " href="http://www.jeju.go.kr/hangpadori/index.htm" target="_blank" rel = "noopener noreferrer" style="display: block">
					<div class="item_img">
						<img src="${pageContext.request.contextPath}/images/nol/tour_2.jpg">
					</div>
					<div class="item_title">
						<h4>항파두리 항몽유적지</h4>
					</div>
				</a>
			</div>
			<div class="item">
				<a class="fade_link  " href="https://www.flowerbirdpark.com/" target="_blank" rel = "noopener noreferrer" style="display: block">
					<div class="item_img">
						<img src="${pageContext.request.contextPath}/images/nol/tour_3.jpg">
					</div>
					<div class="item_title">
						<h4>화조원</h4>
					</div>
				</a>
			</div>
			<div class="item">
				<a class="fade_link  " href="https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_200000000007344" target="_blank" rel = "noopener noreferrer" style="display: block">
					<div class="item_img">
						<img src="${pageContext.request.contextPath}/images/nol/tour_4.jpg">
					</div>
					<div class="item_title">
						<h4>이호테우</h4>
					</div>
				</a>
			</div>
			<div class="item" >
				<a class="fade_link  " href="https://www.visitjeju.net/kr/detail/view?contentsid=CONT_000000000500697" target="_blank" rel = "noopener noreferrer" style="display: block">
					<div class="item_img">
						<img src="${pageContext.request.contextPath}/images/nol/tour_5.jpg">
					</div>
					<div class="item_title">
						<h4>협재해수욕장</h4>
					</div>
				</a>
			</div>
			<div class="item">
				<a class="fade_link  " href="https://www.camelliahill.co.kr/" target="_blank" rel = "noopener noreferrer" style="display: block">
					<div class="item_img">
						<img src="${pageContext.request.contextPath}/images/nol/tour_6.jpg">
					</div>
					<div class="item_title">
						<h4>카멜리아힐</h4>
					</div>
				</a>
			</div>
			<div class="item">
				<a class="fade_link  " href="http://scubacorea.co.kr/" target="_blank" rel = "noopener noreferrer" style="display: block">
					<div class="item_img">
						<img src="${pageContext.request.contextPath}/images/nol/tour_7.jpg">
					</div>
					<div class="item_title">
						<h4>애월스쿠버다이빙</h4>
					</div>
				</a>
			</div>
			<div class="item">
				<a class="fade_link  " href="https://artemuseum.com/" target="_blank" rel = "noopener noreferrer" style="display: block">
					<div class="item_img">
						<img src="${pageContext.request.contextPath}/images/nol/tour_8.jpg">
					</div>
					<div class="item_title">
						<h4>아르떼뮤지엄</h4>
					</div>
				</a>
			</div>
			<div class="item">
				<a class="fade_link  " href="http://www.rosestar.kr/" target="_blank" rel = "noopener noreferrer" style="display: block">
					<div class="item_img">
						<img src="${pageContext.request.contextPath}/images/nol/tour_9.jpg">
					</div>
					<div class="item_title">
						<h4>제주 불빛정원</h4>
					</div>
				</a>
			</div>
		</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>