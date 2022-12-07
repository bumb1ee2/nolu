<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
/*전체*/
#container{font-family: 'Jeju Gothic', sans-serif; margin:0 auto; height : auto; min-height:100%;
			width:100%; padding-top: 50px;/* header height */ padding-bottom:200px;/* footer height */}
#hotelIntro{width:80%; margin:0 auto; height : auto; min-height:100%; margin-top:100px;}


/*슬라이드*/
@keyframes tonext {
  75% {
    left: 0;
  }
  95% {
    left: 100%;
  }
  98% {
    left: 100%;
  }
  99% {
    left: 0;
  }
}

@keyframes tostart {
  75% {
    left: 0;
  }
  95% {
    left: -300%;
  }
  98% {
    left: -300%;
  }
  99% {
    left: 0;
  }
}

@keyframes snap {
  96% {
    scroll-snap-align: center;
  }
  97% {
    scroll-snap-align: none;
  }
  99% {
    scroll-snap-align: none;
  }
  100% {
    scroll-snap-align: center;
  }
}

*::-webkit-scrollbar {
  width: 0;
}

*::-webkit-scrollbar-track {
  background: transparent;
}

*::-webkit-scrollbar-thumb {
  background: transparent;
  border: none;
}

* {
  -ms-overflow-style: none;
}

ol, li {
  list-style: none;
  margin: 0;
  padding: 0;
}

.carousel {
  position: relative;
  height:500px;
  padding-bottom:100px;
  filter: drop-shadow(0 0 10px #0003);
  perspective: 100px;
  box-sizing: border-box;
  scrollbar-color: transparent transparent; /* thumb and track color */
  scrollbar-width: 0px;  
}

.carousel__viewport {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: flex;
  overflow-x: scroll;
  counter-reset: item;
  scroll-behavior: smooth;
  scroll-snap-type: x mandatory;
}

.carousel__viewport img {
  width:100%; height:100%;
}

.carousel__slide {
  position: relative;
  flex: 0 0 100%;
  width: 100%;
  background-image: url("${pageContext.request.contextPath}/img/intro4.jpg");
}
  counter-increment: item;
}

.carousel__slide:nth-child(even) {
background-image: /* url("${pageContext.request.contextPath}/img/intro2.jpg"); */
}

.carousel__slide:before {
  content: counter(item);
  position: absolute;
  top: 100%;
  left: 100%;
  transform: translate3d(-50%,-50%,100px);
  color: rgba(255,255,255,0);
}

.carousel__snapper {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  scroll-snap-align: center;
}

@media (hover: hover) {
  .carousel__snapper {
    animation-name: tonext, snap;
    animation-timing-function: false;
    animation-duration: 2.5s;
    animation-iteration-count: infinite;
  }

  .carousel__slide:last-child .carousel__snapper {
    animation-name: tostart, snap;
  }
}

@media (prefers-reduced-motion: reduce) {
  .carousel__snapper {
    animation-name: none;
  }
}

.carousel:hover .carousel__snapper,
.carousel:focus-within .carousel__snapper {
  animation-name: none;
}

.carousel__navigation {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  text-align: center;
}

.carousel__navigation-list,
.carousel__navigation-item {
  display: inline-block;
}

.carousel::before,
.carousel__prev {
  left: -1rem;
}

.carousel::after,
.carousel__next {
  right: -1rem;
}

.carousel::before,
.carousel::after {
  content: '';
  z-index: -1;
  background-color: #fff;
  background-size: 1.5rem 1.5rem;
  background-repeat: no-repeat;
  background-position: center center;
  color: black;
  font-size: 2.5rem;
  line-height: 4rem;
  text-align: center;
  pointer-events: none;
}






             
/*메인*/
#main{width: 80%; margin: 0 auto; padding: 0px; overflow: hidden; 
	white-space: nowrap; box-sizing: border-box;}
#main h2{font-size:40px;}
#main p{font-size:20px;}
#image{text-align:center; padding:50px; padding-top:0px;}
/*작은 이미지*/
#img1{width:40%;  padding-right:50px; border-radius:80%; overflow: hidden; width:200px; height:200px;}
#img2{width:40%;  padding-left:50px; border-radius:80%; overflow: hidden; width:200px; height:200px;}
#img3{width:40%;  padding-top:50px; border-radius:80%; overflow: hidden; width:200px; height:200px;}
/*푸터*/
.footerBox{width:100%; left: 0; bottom: 0; background-color:white; position : relative; transform : translateY(-100%);}
#footer{width:100%; height:150px; margin:0; padding:0; bottom: 0; left:0; right:0;
border-top:1px solid black; margin:0 auto; text-align: center;}
#left{width:19%; height:100%; text-align:center; float:left; margin:0 auto;}
#left img{width:100px; padding-top:25px; padding-left:15%; margin:0 auto;}
#middle{width:40%; height:100%; margin:0 auto; text-align:left; float:left;}
#middle p{padding-top:20px; padding-left:40%; line-height:1px;}
#right{width:40%; height:100%; text-align:left; float:left;}
#right p{padding-top:12px; padding-left:25%; line-height:1px;}
#bold{ font-size:20px;}
#big{font-size:15px;}
</style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<div id="hotelIntro">
		<div id="main">		
			<section class="carousel" aria-label="Gallery">
			  <ol class="carousel__viewport">
			    <li id="carousel__slide1"
			        class="carousel__slide">
			      <div class="carousel__snapper">
					<img src="${pageContext.request.contextPath}/images/nol/intro1.jpg">
			      </div>
			    </li>
			    <li id="carousel__slide2"
			        class="carousel__slide">
			      <div class="carousel__snapper"></div>
					<img src="${pageContext.request.contextPath}/images/nol/intro2.jpg">
			    </li>
			    <li id="carousel__slide3"
			        class="carousel__slide">
			      <div class="carousel__snapper"></div>
					<img src="${pageContext.request.contextPath}/images/nol/intro3.jpg">
			    </li>
			    <li id="carousel__slide4"
			        class="carousel__slide">
			      <div class="carousel__snapper"></div>
					<img src="${pageContext.request.contextPath}/images/nol/intro4.jpg">
			    </li>
			  </ol>
			  <aside class="carousel__navigation">
			    <ol class="carousel__navigation-list">
			      <li class="carousel__navigation-item">
			      </li>
			      <li class="carousel__navigation-item">
			      </li>
			      <li class="carousel__navigation-item">
			      </li>
			      <li class="carousel__navigation-item">
			      </li>
			    </ol>
			  </aside>
			</section>			
		</div>
		
		
		
		<div id="main">
			<h2>놀러올레만의 모던한 객실</h2>
				<p>
					놀러올레의 객실은 모던하면서도 품격 있는 라이프 스타일 공간으로<br>
					고객님들께 집과 같이 보다 쾌적한 환경에서 지내실 수 있는 객실을 제공합니다.
				</p>			
			<div id="image">
				<img src="${pageContext.request.contextPath}/images/nol/intro5.jpg" id="img1">
				<img src="${pageContext.request.contextPath}/images/nol/intro6.jpg" id="img3">
				<img src="${pageContext.request.contextPath}/images/nol/intro7.jpg" id="img2">			
			</div>
		</div>
		<div id="main">
			<h2>다양한 서비스</h2>
				<p>
					다양한 소셜 라이프(Social life)를 즐길 수 있는 라운지부터 해안가를 바라보는 수영장,<br>
					시원한 바닷바람을 맞으며 사랑하는 사람들, 반려동물과 마음껏 뛰놀 수 있는 뜰이 있습니다.
				</p>			
			<div id="image">
				<img src="${pageContext.request.contextPath}/images/nol/intro8.jpg" id="img1">
				<img src="${pageContext.request.contextPath}/images/nol/intro9.jpg" id="img3">
				<img src="${pageContext.request.contextPath}/images/nol/intro10.jpg" id="img2">			
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>

<script>
$(function(){ 
	$("#video1").bind("ended", function() {
		document.getElementById("video2").play();
	});
$("#video2").bind("ended", function() {
    	document.getElementById("video3").play();
    });
$("#video3").bind("ended", function() {
		document.getElementById("video1").play();
	});	
}); 
</script>
<script>
// Slide every slideDelay seconds
      const slideDelay = 3000;
      const dynamicSlider = document.getElementById("slider");
      var curSlide = 0;
      window.setInterval(()=>{
        curSlide++;
        if (curSlide === dynamicSlider.childElementCount) {
          curSlide = 0;
        }
// Actual slide
        dynamicSlider.firstElementChild.style.setProperty("margin-left", "-" + curSlide + "00%");
      }, slideDelay);
</script>
</body>
</html>