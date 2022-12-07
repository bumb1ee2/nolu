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
<script type="text/javascript">
 function fileCheck(obj){		
		
		var fm =document.modifyform;
		var fnm = fm.n_file;
		var filePath = fnm.value;
		var file_name = filePath.substr(filePath.length-3);
		
		if(file_name == 'jpg'|file_name == 'gif' | file_name == 'png'| filePath.substr(filePath.length-4) =='jpeg'){
			
		}else{
			alert("이미지만 업로드 해주시기 바랍니다.");
			filePath.length = 0;
			document.getElementById("n_file").value = ""; //파일값 없애기
			
			return false;
		}
}
 
</script>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	/*전체*/
	#wrap{width:100%;height:100%;background-color:white; font-family: 'Jeju Gothic', sans-serif;
		padding-top: 100px;/* header height */ padding-bottom:50px;/* footer height */min-width: 900px;}
	#wrap a{text-decoration: none;}	
	/*타이틀*/
	.login{font-size:25px; font-weight: 900; color:black;}
	/*메인*/
	#mypage_form{width:50%; margin:0 auto; border-radius: 10px;padding:50px;background: white;
				text-align: center;border: 1px solid gray;min-width: 500px; max-width: 667px;}
			
	.mypage .mypage1{width:40%; height:100%; text-align: left; box-sizing: border-box;
		float:left; margin:0 auto; display: inline-block; vertical-align: middle; padding-left:50px;}
	.mypage .mypage2{width:55%; height:100%; text-align: left; box-sizing: border-box;
		float:left; margin:0 auto; display: inline-block; vertical-align: middle;}
	.mypage {height: 490px;}
	#p0{text-align:left; font-size:16px; color:#666; padding-bottom:196px;}
	#p1{text-align:left; font-size:16px; color:#666; line-height:50px;}
	#p2{text-align:left; font-size:16px; color:#666; line-height:50px;}
	#p3{text-align:left; font-size:16px; color:#666; line-height:300px;}
	.size{width:80%;height:30px;padding-left:10px;background-color: #f4f4f4;border:none;border-radius: 5px;}	
	.size2{width:80%;padding-left:10px;background-color: #f4f4f4;border:none;border-radius: 5px;}
	textarea{width:80%;height:170px;padding-left:10px; padding-top:8px; background-color: #f4f4f4;border:none;border-radius: 5px; resize: none;}
	.con_img{max-width:80%; height: 50px;}
	/*버튼*/
	.btn2{width:80px;height:30px;font-size:15px;background-color:gray;
		color:#fff; border:none; cursor: pointer; border-radius: 5px;}
	.btn2:hover{background:black; color:white;}
	#wrap hr{margin-top:20px;background:#eee;}
	#wrap label{line-height:40px;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div id="wrap">
    <form action="noMod.do" method="post" name="modifyform" enctype="multipart/form-data" >
	<div id="mypage_form">
	<h2 class="login" style="letter-spacing:-1px;">게시판 글 수정</h2>
      <hr><br>
     	<div class="mypage">
     		<div class="mypage1">
	     		<p id="p1">글쓴이</p>
	     		<p id="p1">상단 고정여부</p>
				<p id="p1">비밀번호</p>
				<p id="p1">제목</p>
				<p id="p0">내용</p>
				<p id="p1">&nbsp;</p>
				<p id="p1">파일첨부</p>     	
     		</div>
     		<div class="mypage2">
     			<p id="p2">
     				<input type="hidden" name="n_num" value="${article.n_num }" class="size"/>
     			</p>
	     		<p id="p2">	<!-- 글쓴이 -->
	     			<input type="hidden" name="m_id" id="m_id" value="${article.m_id}" class="size"/>
	     			<c:if test="${id eq 'admin'}">Noluolle</c:if>
				</p>     	
				<p id="p2">	<!-- 상단 고정여부 -->
					<c:choose>
						<c:when test="${article.n_fix eq 'Y' }">
					       네&nbsp;&nbsp;<input type="radio" name="n_fix" value="Y" checked>&nbsp;&nbsp;&nbsp;
					       아니오&nbsp;&nbsp;<input type="radio" name="n_fix" value="N" >
						</c:when>
							<c:otherwise>
							네&nbsp;&nbsp;<input type="radio" name="n_fix" value="Y" >&nbsp;&nbsp;&nbsp;
							아니오&nbsp;&nbsp;<input type="radio" name="n_fix" value="N" checked>
							</c:otherwise>
					</c:choose>
				</p>     	
				<p id="p2">	<!-- 비밀번호 -->
					<input name="n_pass" type="password" id="n_pass" class="size"/>
				</p>
				<p id="p2">	<!-- 제목 -->
					<input name="n_subject" type="text" id="n_subject" value="${article.n_subject}" class="size"/>
				</p>
				<p id="p2">	<!-- 내용 -->
					<textarea name="n_content" id="n_content" cols="40" rows="100px" required="required">${article.n_content}</textarea>
					<!-- 올렸던 사진이 있다면 -->
					<c:if test="${article.n_file ne null }">
      					<br><img src="${pageContext.request.contextPath}/images/notice/${article.n_file }" id="con_img" class="con_img"/>
      					<input type="hidden" name="n_file1" value="${article.n_file }" id="n_file1"/>
      					&nbsp;&nbsp;<button type="button" onclick="change()" id="delBtn" class="del">삭제</button>
      					<!-- button 기본 type은 submit이라 다른거와 같이실행되서 button으로 타입 지정함-->
      				</c:if>
      				<script>
					function change() {
						document.getElementById("n_file1").value ='';
						document.getElementById("con_img").src ='';
						alert("삭제되었습니다.");
						document.getElementById("delBtn").style.visibility="hidden";
						  };
					</script>
				</p>
				<p id="p2">	<!-- 파일 첨부 -->
					<input type="file" name="uploadFile" id="n_file" accept="image/*" onchange="fileCheck(this)"/>
	     		</p>
     		</div>
    	 </div>
     	<br><br>
			<input type="submit" src="javascript:modifyform.submit()" value="수정" class="btn2">&nbsp;&nbsp;
		<!-- <input type="button" src="javascript:history.go(-1)" value="뒤로" class="btn2"> -->
			<input type="button" onclick="location.href='noList.do'"
		      value="목록으로" class="btn2" />
	</div>
</form>
</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>