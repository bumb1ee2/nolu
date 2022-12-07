<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
	#wrap{width:100%;height : auto; min-height:100%;background-color:white; font-family: 'Jeju Gothic', sans-serif;
		padding-top: 100px;/* header height */ padding-bottom:200px;/* footer height */}
	#wrap a{text-decoration: none;}	
	/*로그인*/
	#login{width:400px; margin:0 auto;}
	#login_form{width:400px; margin:0 auto; border-radius: 10px;padding:50px;background: white;
				text-align: center;border: 1px solid gray;}
	.login{font-size:25px; font-weight: 900; color:black;}
	.size{width:300px;height:30px;background-color: #f4f4f4;
		border:none;border-radius:10px; padding:5px; color:black;}	
	/*버튼*/
	.btn{width:300px;height: 40px;font-size:15px;background-color:gray;
		color:#fff; border:none; cursor: pointer; border-radius: 5px;}
	.btn:hover{background:black;}
	#wrap hr{margin-top:20px;background:#eee;}
	#wrap label{line-height:40px;}
</style>
<body>
<script>
function checkForm(f) {
	if(f.m_pass.value.trim()=="" || f.m_pass.value==null) {
		alert("비밀번호는 필수 입력 항목입니다");
		f.m_pass.focus();
		return false;
	}
	if(f.m_name.value.trim()=="" || f.m_name.value==null) {
		alert("이름은 필수 입력 항목입니다");
		f.m_name.focus();
		return false;
	}
	if(f.m_tel.value.trim()=="" || f.m_tel.value==null) {
		alert("전화번호는 필수 입력 항목입니다");
		f.m_tel.focus();
		return false;
	}
	if(f.m_birth.value.trim()=="" || f.m_birth.value==null) {
		alert("생년월일은 필수 입력 항목입니다");
		f.m_birth.focus();
		return false;
	}
	if(f.m_email.value.trim()=="" || f.m_email.value==null) {
		alert("이메일은 필수 입력 항목입니다");
		f.m_email.focus();
		return false;
	}
	
	f.submit();
}

$(function(){
	$("#datepicker").datepicker({dateFormat: 'yy-mm-dd'
           ,showOtherMonths: true 
           ,showMonthAfterYear:true 
           ,changeYear: true 
           ,changeMonth: true                         
           ,yearRange: 'c-100:c+10'
           ,yearSuffix: "년" 
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
           ,dayNamesMin: ['일','월','화','수','목','금','토']
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
           ,minDate: "-100Y" 
           ,maxDate: "-0D" 	
	});
});
</script>
 <jsp:include page="../common/header.jsp"/>
<div id="wrap">
	<div id="login">
		<div id="login_form">
				<form name = "modForm" action="memMod.do" method="post">
					<h2 class="login" style="letter-spacing:-1px;">회원정보수정</h2>
	            	<hr><br>
	    
		            <label for = "id">
		            <p style="text-align: left; font-size:16px; color:#666;">아이디</p>
		            <input type="text" name="m_id" id="id" value="${mem.m_id }" readonly  class="size"/>
		            </label>
	
		            <label for = "pass">
		                <p style="text-align: left; font-size:16px; color:#666;">비밀번호</p>
		                <input type="password" name="m_pass" id="pass" value="${mem.m_pass }" class="size">
		            </label>
	            
		            <label for = "name">
		                <p style="text-align: left; font-size:16px; color:#666;">이름</p>
		                <input type="text" name="m_name" id="name" value="${mem.m_name }" class="size">
		            </label>
	
		            <label for = "tel">
		                 <p style="text-align: left; font-size:16px; color:#666;">전화번호</p>
		                <input type="text" name="m_tel" id="tel" value="${mem.m_tel }"  class="size" >
		            </label>
	    
		            <label for = "birth">
		               <p style="text-align: left; font-size:16px; color:#666;">생년월일</p>
		                <input type="text" name="m_birth" id="datepicker" value="${mem.m_birth }" readonly class="size">
		            </label>
	
		             <label for = "email">
		                 <p style="text-align: left; font-size:16px; color:#666;">이메일</p>
		                    <input type="text" name="m_email" id="email" value="${mem.m_email }" class="size">
		            </label>
    				<br><br><br>
           			 <p><input type="button" onclick="javascript:checkForm(document.modForm)" value="수정하기" class="btn"/>
				</form>
			<hr><br>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>