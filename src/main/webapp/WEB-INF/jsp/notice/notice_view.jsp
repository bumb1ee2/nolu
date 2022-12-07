<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
 <%
 //줄바꿈기능
 pageContext.setAttribute("br", "<br/>");
 pageContext.setAttribute("cn", "\n");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<style type="text/css">
	 @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	 /*전체*/
	#wrap{width:100%; height: 100%; padding:0; background-color:white; min-height:100%;
		min-width:870px; position:relative; font-family: 'Jeju Gothic', sans-serif;
		padding-top: 80px;/* header height */ padding-bottom:80px;/* footer height */margin:0 auto;}
	/*구분선*/
	#wrap hr{margin-top:20px;background:#eee;}
	/*타이틀*/
	#wrap h2 {font-size:20px; text-align:center;}
	/*내용*/
	#wrap a {text-decoration: none;color:#333;}
	#wrap label{line-height:40px;}
	#write{width:50%;height:100%;margin:auto; max-width: 668px; min-width: 590px;}
	#write_form{border-radius: 10px;padding:50px;background: #fff;text-align: left;border: 1px solid gray;}
	#p{padding-top:20px; padding-bottom:30px;}
	label{line-height:40px;}
	#button{text-align:center;}
	.size{width:300px;height:30px;padding-left:10px;background-color: #f4f4f4;border:none;border-radius: 5px;}
	.con_img{max-width:100%;}
	.v_content{min-height: 210px; line-height: 25px;}
	/*버튼*/
    .btn2{width:100px; heieght:20px; font-size:12px; background:gray; color:white; 
    	border:none; border-radius:8px; padding:7px; margin:5px;}
    .btn2:hover{background:black; color:white;}	
	.btn3{width:120px; height:40px; font-size:12px; background:gray; color:white;
		border:none; border-radius:8px; padding:7px; margin:5px;}
	.btn3:hover{background:black; color:white;}	
	hr{margin-top:20px;background:#eee;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<c:choose>
	<c:when test="${article.n_subject eq null }">
	<script>
		alert("더이상 글이 없습니다.");
		history.back();
	</script>
	</c:when>
	<c:otherwise>
	 <div id="wrap">
  <div id="write">
   <div id="write_form">
    <h2>글 내용 상세보기</h2>
    <hr><br>
    <label for="title">
     <p style="text-align: left; font-size:16px; color:#666;" id="p">
      제목:
      ${article.n_subject}
      <br></p>
    </label>
    <div class="v_content">
      ${fn:replace(article.n_content,cn,br)}
    <label for="">
     <c:choose>
      <c:when test="${empty article.n_file || article.n_file eq ''}">
       <br>
      </c:when>
      <c:otherwise>
      	<br>
      	<img src="${pageContext.request.contextPath}/images/notice/${article.n_file }" class="con_img"/>
      </c:otherwise>
     </c:choose>
    </label>
    </div>
    <hr><br>
	    <div id="button">
		    <p>
		     <c:if test="${id eq 'admin' }">
		     <input type="button" onclick="location.href='noModForm.do?n_num=${article.n_num}'"
		      value="수정" class="btn2" />
			 <input type="button" onclick=delNotice(); value="삭제" class="btn2"></input>
		     </c:if>
		     <input type="button" onclick="location.href='noList.do'"
		      value="목록" class="btn2" />
		     </P>
		     <P><br>
		      	<input type="button" onclick="location.href='selectBf.do?n_num=${article.n_num }'"
					       value="◀이전글" class="btn3" />
		      <input type="button" onclick="location.href='selectNx.do?n_num=${article.n_num }'"
		      			 value="다음글▶" class="btn3" />
		    </p>
	    </div>
   </div>
  </div>
 </div>
	</c:otherwise>
</c:choose>
  <c:set var="n_num" value="${article.n_num}"/>
<script>

function delNotice(){
    if(confirm("글을 삭제 하시겠습니까?")){ // 확인 버튼을 눌렀을 때
    	location.href="noDel.do?n_num=${article.n_num}"
    }else{  // 취소 버튼을 눌렀을 때
        alert("취소 되었습니다.");
        return false;
    }
}
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>