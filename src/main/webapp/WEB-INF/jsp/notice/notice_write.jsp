<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	/*전체*/
	#wrap{width:100%;height : auto; min-height:100%;background-color:white; font-family: 'Jeju Gothic', sans-serif;
		padding-top: 100px;/* header height */ padding-bottom:200px;/* footer height */min-width: 900px;}
	#wrap a{text-decoration: none;}	
	/*타이틀*/
	.login{font-size:25px; font-weight: 900; color:black;}
	/*메인*/
	#mypage_form{width:50%; margin:0 auto; border-radius: 10px;padding:50px;background: white;
				text-align: center;border: 1px solid gray; min-width: 500px; max-width: 667px;}
			
	.mypage .mypage1{width:40%; height:100%; text-align: left; box-sizing: border-box;
		float:left; margin:0 auto; display: inline-block; vertical-align: middle; padding-left:50px;}
	.mypage .mypage2{width:60%; height:100%; text-align: left; box-sizing: border-box;
		float:left; margin:0 auto; display: inline-block; vertical-align: middle;}
	.mypage {height: 387px;} 
	#p0{text-align:left; font-size:16px; color:#666; padding-bottom:184px;}
	#p1{text-align:left; font-size:16px; color:#666; line-height:50px;}
	#p2{text-align:left; font-size:16px; color:#666; line-height:50px;}
	#p3{text-align:left; font-size:16px; color:#666; line-height:300px;}
	.size{width:80%;height:30px;padding-left:10px;background-color: #f4f4f4;border:none;border-radius: 5px;}	
	.size2{width:80%;padding-left:10px;background-color: #f4f4f4;border:none;border-radius: 5px;}
	textarea{resize:none; width:80%;height:170px;padding-left:10px;padding-top:8px;background-color: #f4f4f4;border:none;border-radius: 5px;}
	/*버튼*/
	.btn2{width:120px; height:40px; font-size:15px;background-color:gray;
		color:#fff; border:none; cursor: pointer; border-radius: 5px;}
	.btn2:hover{background:black; color:white;}
	#wrap hr{margin-top:20px;background:#eee;}
	#wrap label{line-height:40px;}
</style>
<script type="text/javascript">
	function fileCheck(obj){		
		
		var fm =document.boardform;
		var fnm = fm.n_file;
		var filePath = fnm.value;
		var file_name = filePath.substr(filePath.length-3);
		
		if(file_name == 'jpg'|file_name == 'gif' |file_name == 'png'| filePath.substr(filePath.length-4) =='jpeg'){
			
		}else{
			alert("이미지만 업로드 해주시기 바랍니다.");
			filePath.length = 0;
			document.getElementById("n_file").value = "";
			
			return false;
		}
}
</script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div id="wrap">
		<div id="mypage_form">
			<h2 class="login" style="letter-spacing:-1px;">게시판 글 등록</h2>
			<hr><br>
		<form action="noWrite.do" method="post" name="boardform"  enctype="multipart/form-data">
 		        <div class="mypage">
		        	<div class="mypage1">
			        <p id="p1">제목</p>
					<p id="p1">글 비밀번호</p>
			        <p id="p0">내용</p>
			        <p id="p1">파일첨부</p>
			        </div>
			        <div class="mypage2">						
						<input type="hidden" name="m_id" id="m_id" value="${m_id}"/>
					<p id="p2">	<!-- 제목 -->
						<input type="text" name="n_subject" id="n_subject" required="required" class="size"/>
					</p>
					<p id="p2">	<!-- 비밀번호 -->
						<input type="password" name="n_pass" id="n_pass" required="required" class="size" />					
					</p>

					<p id="p2">	<!-- 내용 -->
						<textarea name="n_content" id="n_content" cols="40" rows="100px" required="required"></textarea>
					</p>		
					<p id="p2">	<!-- 파일첨부 -->
						<input type="file" name="uploadFile" id="n_file" accept="image/*" onchange="fileCheck(this)"/>
					</p>
					</div>  
    			</div>
    			    <br><br>			
					<input type="submit" value="등록" class="btn2">&nbsp;&nbsp;
					<input type="reset" value="다시쓰기" class="btn2">&nbsp;&nbsp;
					<input type="button" onclick="history.back()" value="돌아가기" class="btn2">
    		</form>

		</div>
	</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>