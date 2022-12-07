<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>
<style>
/*공통 css*/
a{text-style:none; color:#000;}
*{padding: 0px; margin: 0px;}
ul{list-style:none;}

/*footer css*/
#jfoot{background: white;}
#jfoot img{width: 235px;height: 150px;}
#jfoot ul li a img{width: 100px;height: 100px;}
#jfoot ul li:nth-child(1) img{padding-top: 30px;}
#jfoot ul li:nth-child(2) img{width: 251px; height: 129px; padding-top: 20px;}
#jfoot ul li:nth-child(3) img{width: 265px;
    height: 149px;}
#jfoot ul{display:flex; justify-content: space-between; padding-top:40px;}
#jfoot ul li{padding: 50px; }
</style>
<div id="jfoot">
	<ul>
		<li>
			<a href="${pageContext.request.contextPath}/index.jsp">
			<img src="${pageContext.request.contextPath}/images/nol/logo.png" alt="HOME"></a>
		</li>
		<li>
			<img src="${pageContext.request.contextPath}/images/nol/footer1.jpg">
		</li>
		<li>
			<img src="${pageContext.request.contextPath}/images/nol/footer2.jpg">
		</li>
	</ul>
</div>
</body>


<!--  
<style>

.footer {width:100%; height:100px; bottom:0;
		text-align: left; color: black; font-size:20px;}
.footer *{position: relative; bottom: 0; left:0; right:0; }
.footer table {border-top:1px solid black;}
.footer table table {border:none;}
.footer table img {margin-left:100px;}
</style>
--> 
<!--
<footer class="footer">
	<table width="100%" height="200px" bgcolor="white">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/main.jsp">
				<img src="${pageContext.request.contextPath}/img/logo.png" width="15%" alt="HOME"></a>
			</td>	
			<td>
				<table>
					<tr>
						<td><b>TEL : 1234 - 1234</b></td>
					</tr>
					<tr>
						<td>제주 제주시 애월읍 고내리 474-6</td>
					</tr>
					<tr>
						<td>Email : nolleo_olle@nolleoolle.com</td>
					</tr>
				</table>
			</td>
			<td>
				<table>
					<tr>
		 				<td><b>Hours</b></td>
		 			</tr>
		 			<tr>
		 				<td>
		 					▷입실시간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;◁15:00 ~ 22:00
						</td>
		 			</tr>
		 			<tr>		
						<td>
							▷객실예약(주중)◁&nbsp;09:00 ~ 18:00 
						</td>
					</tr>
	  				<tr>
						<td>
						  	<b>업무시간 외에는 온라인 예약을 이용해주시기 바랍니다.</b>
						</td>
					</tr>
				</table>
			</td>
			<td>
			</td>
		</tr>
	</table>
</footer>-->
