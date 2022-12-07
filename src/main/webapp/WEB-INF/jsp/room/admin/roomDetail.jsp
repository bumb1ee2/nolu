<%@page import="java.util.ArrayList" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	#detail{font-family: 'Jeju Gothic', sans-serif; text-align: center;width:100%; height : auto; min-height:100%; padding-top: 80px; 
			padding-bottom: 80px; min-width: 900px;}
/*테이블 설정*/	
	.resTable {width:700px; margin:0 auto; border:1px solid gray; border-radius:10px;}
	.resTable tr {height:30px;}
	.resTable th{padding: 10px;}
	.last{height: 41px; }
	.last *{display: inline;}
	.resTable_file{width: 110px;}
/*버튼설정*/	
	#detail a{text-decoration: none;}
    .btn2{width:100px; height: 32px;font-size:15px;background-color: gray;color:#fff;
    		border:none; cursor: pointer; border-radius: 5px;}
    .btn2:hover{background:black;}
/*내부설정*/
	.room_img1{width:200px; padding-top: 10px; }
	.room_img2{width:200px; padding-top: 10px; }
	.input_t, #r_amenty{float: left;}
	.input_t{width: 70%;}
	summary{font-size: 20px;}
	#r_amenty{resize: none; word-break: keep-all; }
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$("#r_amenty").val("text");
	var text=$("#textarea").val("${room.r_amenty}");
	
//이미지파일인지 체크	
function fileCheck(obj){		
	$('.room_img').css("display", "none");
		var fm =document.roomdetailform;
		var fnm = fm.n_file;
		var filePath = fnm.value;
		var file_name = filePath.substr(filePath.length-3);
		
		if(file_name == 'jpg' |file_name == 'png'| filePath.substr(filePath.length-4) =='jpeg'){
			
		}else{
			alert("이미지만 업로드 해주시기 바랍니다.");
			filePath.length = 0;
			document.getElementById("n_file").value = "";
			
			return false;
		}
		
}
function fileCheck2(obj){		
	
	var fm =document.roomImgform;
	var fnm = fm.n_file2;
	var filePath = fnm.value;
	var file_name = filePath.substr(filePath.length-3);
	
	if(file_name == 'jpg' |file_name == 'png'| filePath.substr(filePath.length-4) =='jpeg'){
		
	}else{
		alert("이미지만 업로드 해주시기 바랍니다.");
		filePath.length = 0;
		document.getElementById("n_file2").value = "";
		
		return false;
	}
}
</script>
</head>
<body>
<jsp:include page="../../common/header.jsp"/>
<div id="detail">	
<h1>${room.r_num }호 상세페이지</h1>
<br>
	<form action="roomMod.do" name="roomdetailform" method="post" enctype="multipart/form-data">
	<input type="hidden" name="r_num" value="${room.r_num }"/>
	<input type="hidden" name="r_state" value="${room.r_state }"/>
		<table class="resTable">
		<tr>
			<th><label for="r_base_person">기준인원</label></th>
			<td><input type="text" name="r_base_person" value="${room.r_base_person }" class="input_t"></td>
			<th><label for="r_max_person">최대인원</label></th>
			<td><input type="text" name="r_max_person" value="${room.r_max_person }" class="input_t"></td>
		</tr>
		<tr>
			<th><label for="r_base_price">금액</label></th>
			<td><input type="text" name="r_base_price" value="${room.r_base_price }" class="input_t"></td>
			<th><label for="r_type">객실구성</label></th>
			<td>
			<input type="text" name="r_type" value="${room.r_type }" class="input_t"></td>
		</tr>
		<tr>
			<th><label for="r_amenty">구비시설</label></th>
			<td colspan="3">
			<textarea rows="4" cols="76" id="r_amenty" name="r_amenty">${room.r_amenty }</textarea>
			</td>
		</tr>
		<tr>
			<th><label for="filename">메인 사진</label></th>
			<td colspan="2">
			<input type="file" name="uploadFile" id="n_file" accept="image/*" onchange="fileCheck(this)"/>
			<input type="hidden" name="r_img1" id="r_img1" value="${room.r_img1 }"/>
			</td>
			<td>
			<img src="${pageContext.request.contextPath}/images/img_room/${room.r_img1 }" class="room_img1">
			</td>
		</tr>
		<tr>
			<td colspan="4" class="last">
				<a href="javascript:roomdetailform.reset()"><input type="button" value="다시쓰기" class="btn2"></a>
				<a href="javascript:roomdetailform.submit()"><input type="button" value="수정하기" class="btn2"></a>
				<a href="javascript:history.go(-1)"><input type="button" value="되돌아가기" class="btn2"></a>
			</td>
		</tr>
		</table>
	</form>
	<br>
	<br>
	<details>
	<summary>객실 소개 사진 수정하기</summary>
	<form action="roomImgMod.do" name="roomImgform" enctype="multipart/form-data" method="post">
	<table class="resTable">
		<tr>
			<th class="resTable_file"><label for="filename">내부 사진</label></th>
			<td colspan="3" >
			<input type="file" name="uploadFile" id="n_file2" accept="image/*" onchange="fileCheck2(this)"/>
			<input type="hidden" name="r_num" value="${room.r_num }"/>
			<input type="hidden" name="r_img2" id="r_img2" value="${room.r_img2 }"/>
				<img src="${pageContext.request.contextPath}/images/img_room/${room.r_img2 }" class="room_img2">
			</td>
		</tr>
		<tr>
			<td colspan="2" >
				<a href="javascript:history.go(-1)"><input type="button" value="되돌아가기" class="btn2"></a>
				<a href="javascript:roomImgform.submit()"><input type="button" value="수정하기" class="btn2"/></a>
			</td>
		</tr>
	</table>
	</form>
	</details>
<br>
<br>
</div>
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>