<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 	String menu = (String)session.getAttribute("menu");
    String id = (String)session.getAttribute("m_id");
    boolean isAdmin = false;
    boolean isUser = false;
    if(id != null) {
    	if(id.equals("admin")) {
    		isAdmin = true;
    	} else {
    		isUser = true;
    	}
    }
    String reservation = "";
    String login = "";
    String join = "";
    String reservationManage = "";
    String roomManage = "";

%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/3442ebfa65.js" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">	
    <title>놀러올레</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
html{font-size:15px;}
.container{backgroudn:white; width:100%; height:100px;}
.navbar * {margin: 0 auto; font-family: 'Jeju Gothic', sans-serif; font-size: 1rem; color:black; z-index:1; }
.navbar {display: flex; justify-content: space-between; align-items: center; width:100%; height:0px;
		text-align: center; padding:0; margin:0 auto; z-index:1;
		font-family: 'Jeju Gothic', sans-serif; font-size: 1rem; color:black; z-index:1;}
.navbar a {text-decoration: none;}
.navbar__logo {font-size: 1rem;}
.navbar__menu {display: flex; list-style: none; padding-left: 0;  padding-bottom: 5px;}
.navbar__menu li {padding: 8px 12px;}
.navbar__menu li:hover {border-radius: 4px;}
.navbar__icons {list-style: none; color: var(--text-color); display: flex; padding-left: 0;}
.navbar__icons li {padding: 8px 12px;}
.navbar__toggleBtn {display: none; position: absolute; right: 32px; font-size: 1rem;}

.navbar ul {text-align: center; }
.navbar li {list-style: none; display:inline-block; margin-right: 15px; transition:all 0.3s ease-in-out;}
.navbar ul li:hover .submenu {height: 70px;}
.navbar ul li:hover .submenu a {color: black;}

/*로고*/
.outer-div {width : 100%; height : 150px; position:relative; text-align:center; margin:0 auto;}
.inner-div {width : 80px; height : 80px; position:absolute; top: 50%; left: 50%; margin: -50px 0 0 -50px;}
.inner-div a img {padding-top : 20px;}

/*서브메뉴*/
.submenu {overflow:hidden; position:absolute; left: 0; right: 0; width: 100%; background-color: lightGray;
   	 	  height: 0; line-height: 15px; box-sizing:border-box; transition:height 0.3s ease-in-out;
    	  transition-delay: 0.1s; margin-top: 20px;}
.submenu a {text-decoration: none; display: block; padding: 0 3px 0 3px; margin: 0 0 10px; 
			position: relative; margin-top: 20px; font-size: 1rem;}
.submenu a:hover {text-decoration:none;}
/* ::before {content: ""; position: absolute; width: 100%; height: 3px; bottom: -10px; left: 0px;
    		transition: all 0.2s ease-in-out; transform: scale(0, 0); visibility: hidden;} */

/* 서브메뉴 애니메이션 */
.frame button a {color:white; text-decoration: none;}
.button {border: none; background: transparent; cursor: pointer; transition: all 0.3s ease; outline: none;}
.button:hover {/* color: white; */ background: transparent; box-shadow:none;}
.button:before, .button:after{content:''; position:absolute; top:0; right:0; height:1px; width:0; background: white; transition:400ms ease all;}
.button:after{right:inherit; top:inherit; left:0; bottom:0;}
.button:hover:before, .button:hover:after{width:100%; transition:800ms ease all;}


/* 버튼 */
.btn{width:150px; height: 30px; font-size:0.85rem; background-color:gray;
	color:white; border:none; cursor: pointer; border-radius: 5px; padding:3px;}
.btn:hover{background:black; color:white;}
</style>
</head>
<c:set var="id" value="<%=id %>"/>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">	<!-- 마우스 우클릭, 텍스트 블럭지정 복사, 드래그 금지 -->
	<div class='outer-div' oncontextmenu='return false'>
	  <div class='inner-div'>
	  	<a href="${pageContext.request.contextPath}/main.do">
	    <img src="${pageContext.request.contextPath}/images/nol/logo.png" width="100%" alt="logo"></a>
	  </div>
	</div>
    <nav class="navbar">
        <ul class="navbar__menu">
        	<li>
        	<c:choose>
		    <c:when test="${id ne null }">
		    <c:if test="${id eq 'admin' }">
        	<a href="#"><i class="fa-solid fa-person-simple"></i></a>
        		<ul class="submenu">
			        <li><a href="${pageContext.request.contextPath}/hotel_intro.do"><button class="button">펜션 소개</button></a></li>
			        <li><a href="${pageContext.request.contextPath}/loca.do"><button class="button">찾아 오시는 길</button></a></li>
			        <li><a href="${pageContext.request.contextPath}/tour.do"><button class="button">주변 관광지</button></a></li>                   		
		        	<li><a href="${pageContext.request.contextPath}/rooms.do"><button class="button">둘러 보기</button></a></li>
		       		<li><a href="${pageContext.request.contextPath}/roomview.do?r_num=101"><button class="button">101</button></a></li>
		    		<li><a href="${pageContext.request.contextPath}/roomview.do?r_num=102"><button class="button">102</button></a></li>
		    		<li><a href="${pageContext.request.contextPath}/roomview.do?r_num=103"><button class="button">103</button></a></li>
		    		<li><a href="${pageContext.request.contextPath}/roomview.do?r_num=104"><button class="button">104</button></a></li>
        			<li><a href="${pageContext.request.contextPath}/reserP.do"><button class="button">예약하기</button></a></li>
        		</ul>
		    </c:if>
		    </c:when>
		    </c:choose>          		
        	</li>
        	<li>
        	<a href="#">펜션 소개</a>
        	<ul class="submenu">
			        <li><a href="${pageContext.request.contextPath}/hotel_intro.do"><button class="button">펜션 소개</button></a></li>
			        <li><a href="${pageContext.request.contextPath}/loca.do"><button class="button">찾아 오시는 길</button></a></li>
			        <li><a href="${pageContext.request.contextPath}/tour.do"><button class="button">주변 관광지</button></a></li>            
            </ul>
            </li>
            
            <li class="frame">
        	<a href="#">객실 소개</a>
		      <ul class="submenu">
		        <li><a href="${pageContext.request.contextPath}/rooms.do"><button class="button">둘러 보기</button></a></li>
		        <li><a href="${pageContext.request.contextPath}/roomview.do?r_num=101"><button class="button">101</button></a></li>
		    	<li><a href="${pageContext.request.contextPath}/roomview.do?r_num=102"><button class="button">102</button></a></li>
		    	<li><a href="${pageContext.request.contextPath}/roomview.do?r_num=103"><button class="button">103</button></a></li>
		    	<li><a href="${pageContext.request.contextPath}/roomview.do?r_num=104"><button class="button">104</button></a></li>
		      </ul>
     		 </li>
     		 
   	 		<li class="frame"><a href="${pageContext.request.contextPath}/reserP.do"><button class="button">예약하기</button></a></li>
   	 		
		    <li class="frame"><a href="#">게시판</a>
		      <ul class="submenu">
		        <li><a href="${pageContext.request.contextPath}/noList.do"><button class="button">공지사항</button></a></li>
		      </ul>
		    </li>        

		         
   			<li> 
		    	<c:choose>
		    	<c:when test="${id ne null }">
		    		<c:if test="${id eq 'admin' }">
		    			<a href="${pageContext.request.contextPath}/memberList.do">회원관리</a>
		    		</c:if>
		    	</c:when>
		    	</c:choose>     
   			 </li>
   			<li> 
		    	<c:if test="${id eq 'admin' }">
		    		<a href="${pageContext.request.contextPath}/reservList.do">예약관리</a>
		    	</c:if>      
   			 </li>
  			  <li> 
		    	<c:if test="${id eq 'admin' }">
		    		<a href="${pageContext.request.contextPath}/roomAdmin.do">객실관리</a>
		    	</c:if>    
   			 </li>
   			 <li class="frame">
		    	<c:choose>
		    	<c:when test="${id eq null }">
		    		<a href="${pageContext.request.contextPath}/login.do" class="btn">로그인</a>&nbsp;&nbsp;
		    		<a href="${pageContext.request.contextPath}/joinForm.do" class="btn">회원가입</a>
		    	</c:when>
		    	<c:otherwise>
		    		<a href = "${pageContext.request.contextPath}/memInfo.do?id=${id}" class="btn">마이페이지</a>&nbsp;&nbsp;
		    		<a href="${pageContext.request.contextPath}/logout.do" class="btn">로그아웃</a>
		    	</c:otherwise>
		    	</c:choose>  
  			  </li>       
 		</ul>    
    </nav>
</body>
</html>