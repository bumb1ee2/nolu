<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style>

	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		html, body{padding:0; margin:0;}
        body{margin:0 auto;}
        body, table, div, p ,span{font-family: 'Jeju Gothic', sans-serif;}
        
        a{text-decoration: none;color:#333;}
        #con{width:100%;height : auto; min-height:100%;background-color:white;padding:0;padding-bottom:200px;}
       
        #login{width:400px;height:100%;margin:auto; }
        #login_form{border-radius: 10px;padding:30px 50px;background: #fff;text-align: center;border: 1px solid gray;margin-top:100px;}
        .login{font-size:25px;font-weight: 900;color:#333;}
		label{line-height:40px;}
        .size{width:300px;height:30px;padding-left:10px;background-color: #f4f4f4;border:none;border-radius: 5px;}

        .btn2{width:310px;height: 40px;font-size:15px;background-color: gray;color:#fff;border:none;cursor: pointer;border-radius: 5px;}
        .btn2:hover{background:black;}
        #checkBtn {width:62px; height:30px;border:solid 1px gray; border-radius:5px; padding:4px;}
        hr{margin-top:20px;background:#eee;}
        
        .num1{width:219px;}
        
        
		#wrap {min-height: 100vh; position: relative; width: 100%;}
		footer {width: 100%; height: 110px; /* 내용물에 따라 알맞는 값 설정 */ bottom: 0px; position: absolute; border-top:1px solid black;}
		nav {float:left; width:33%; padding-top:0.32%;}
		#nav {width:100%; margin:0 auto; text-align:center;}
		#nav img {width:15%; text-align:center; margin:0 auto; center:50%; margin-top:20px;}
		#bold{font-size:20px;}
		#big{font-size:15px;}        
</style>
<body>
<jsp:include page="../common/header.jsp"/>
<script>
	
$(function() {
	$("#checkBtn").click(function() {
		
		var m_id = $("#m_id").val();
		if(m_id == "") {
			alert('아이디가 입력되지 않았습니다');
			return false;
		} else {
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/idCheck.do",
				data:{"m_id":m_id},
				success:function(data) {
					if(data == "N") {
						result = "사용 가능한 아이디입니다"
						$("#result").html(result).css("display", "inline");
						$("#result").html(result).css("color", "green");
						$("#checkOk").val('Y');
						$("#checkId").val(m_id);
					} else {
						result = "사용 불가능한 아이디입니다"
						$("#result").html(result).css("display", "inline");
						$("#result").html(result).css("color", "red");
						$("#checkOk").val('N');
					} 
				}, error : function(error) {alert(error);}
				
			});
		}
	});
	
});

	
	function checkForm(f) {
		if(f.checkOk.value=="N") {
			alert("아이디 중복확인 필요");
			f.m_id.focus();
			return false;
		}
		if(f.m_id.value != f.checkId.value) {
			$("#result").css("display", "none");
			$("#checkOk").val("N");
			alert('아이디 변경 - 다시 중복확인하세요');
			$("#m_id").val('');
			$("#checkId").val('');
			return false;
		}
		if(f.m_id.value.trim()=="" || f.m_id.value==null) {
			alert("아이디는 필수 입력 항목입니다");
			f.m_id.focus();
			return false;
		}
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
			f.m_pass.focus();
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

	<div id="con">
        <div id="login">
	        <div id="login_form">
				<form name = "joinform" action="${pageContext.request.contextPath}/join.do" method="post">
					<h2 class="login" style="letter-spacing:-1px;">회원가입</h2>
	            	<hr><br>
	    
		            <label for = "id">
		            <p style="text-align: left; font-size:16px; color:#666;">아이디</p>
		            <input type="text" name="m_id" id="m_id" placeholder="중복확인 버튼을 눌러주세요" class="size num1"/>
		            <input type="button" name="checkBtn" id="checkBtn" value="중복확인"/>
		            <input type="hidden" name="checkOk" id="checkOk" value="N"/>
		            <input type="hidden" name="checkId" id="checkId" value=""/>
		            <span id = "result"></span>
		            </label>
	
		            <label for = "pass">
		                <p style="text-align: left; font-size:16px; color:#666;">비밀번호</p>
		                <input type="password" name="m_pass" id="pass" class="size">
		            </label>
	            
		            <label for = "name">
		                <p style="text-align: left; font-size:16px; color:#666;">이름</p>
		                <input type="text" name="m_name" id="name" class="size">
		            </label>
	
		            <label for = "tel">
		                 <p style="text-align: left; font-size:16px; color:#666;">전화번호</p>
		                <input type="text" name="m_tel" id="tel" placeholder="'-'를 제외한 숫자만 입력하세요"  class="size" >
		            </label>
	    
		            <label for = "birth">
		               <p style="text-align: left; font-size:16px; color:#666;">생년월일</p>
		                <input type="text" name="m_birth" id="datepicker" placeholder="YYYY-MM-DD" readonly class="size">
		            </label>
	
		             <label for = "email">
		                 <p style="text-align: left; font-size:16px; color:#666;">이메일</p>
		                    <input type="text" name="m_email" id="email" class="size">
		            </label>
    				<br><br><br>
           			 <p>
           			 <input type="button" onclick="javascript:checkForm(document.joinform)" value="가입하기" class="btn2"/>
           			 </p>
				</form>
				<hr><br>
			</div>
		</div>
	</div>
	
<%@ include file="../common/footer.jsp" %>
</body>
</html>