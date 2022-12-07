<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

    body{margin:0 auto;}
    body, table, div {font-family: 'Jeju Gothic', sans-serif;}
    
    .box{width:100%; height : auto; min-height:100%; padding-bottom:200px;}    
	.resContent{height : auto; min-height:100%; margin:10% auto; padding-top:5%; width:80%; border:1px solid gray; border-radius:10px; }
	.choiceR {width:49%;height:200px;float:left; text-align:center;}
	.choiceD {width:49%;height:200px;float:right;text-align:center;}
	.resSearchB{clear:both;display:flex; justify-content:center; height:100px;padding-top:50px;}
	#btn{width:200px;height: 40px;font-size:15px;background-color: gray;color:#fff;border:none;cursor: pointer;border-radius: 5px;}
    #btn:hover{background:black;}
    #btn2{width:200px;height: 40px;font-size:15px;background-color: gray;color:#fff;border:none;cursor: pointer;border-radius: 5px;}
    #btn2:hover{background:black;}
	.resInfo{clear:both;margin:auto;margin-bottom:100px;width:70%;height:400px;text-align:center; border:1px solid gray; border-radius:10px;}
	.resInfoForm{margin-top:15px;}
	.resInfoTable{margin:0 auto;border:none; }
	.resInfoTable input[type="text"] {width:100px;}
	.resInfoTable td {text-align:right; line-height:20px;}
	h1 {text-align:center;}
	h2 {line-height:50px;}
    .roomNum input[type="radio"] {display: none;}
    .roomNum input[type="radio"] + span {display: inline-block;padding: 15px 10px;border: 1px solid #dfdfdf;background-color: #ffffff;text-align: center;cursor: pointer; border-radius:10px;}
    .roomNum input[type="radio"]:checked + span {background-color: #444;color: #ffffff;}
</style>
</head>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script>
	var arr = [];
	var disabledDays = [];
	
	var dateArr = [];
	var dayArr = [];
	var endArr = [];
	var noArr = [];
	
	$(function() {
            	
		
		$('#toDate').attr('disabled', 'disabled');

		function datepickerControl() {
			
			var toMaxDate;
		
			//시작일
			$('#fromDate').datepicker({
				showOn: "both",
				buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
				buttonImageOnly : true,        
				dateFormat: "yy-mm-dd",
				changeMonth: true,
				minDate: 0,
				beforeShowDay: disableAllTheseDays,
		                   
				onClose: 
				
				function( selectedDate ) {
					if($("#fromDate").val() != "") {
						$("#toDate").datepicker( "option", "minDate", selectedDate );

						var dis0 = new Date(disabledDays[0]);
						var fd = new Date($("#fromDate").val());
						var dateArr = [];
						
						if(disabledDays.length>0) {
							if(dis0>fd){
								var date = disabledDays[0];
							}else{
								for(var i = 0; i<disabledDays.length; i++) {
									if(new Date(disabledDays[i]) > fd) {
										dateArr.push(disabledDays[i]);
									}
								}
								var date = dateArr[0];
							}
						}else{
							var date = $(this).datepicker('getDate');
							date.setDate(date.getDate() + 7);
							
						}
						
						toMaxDate = date;
						$('#toDate').datepicker("option", "maxDate", date); // Set as default
						$('#toDate').removeAttr('disabled', 'disabled');
						$("#toDate").datepicker( "option", "disabled", false );
						
						
					}
				}
			});
	
			//종료일
			$('#toDate').datepicker({
				showOn: "both",
				buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
				buttonImageOnly : true,  
				dateFormat: "yy-mm-dd",
				changeMonth: true,
				beforeShowDay: disableAllTheseDays,
		
				onClose: function( selectedDate ) {
					$("#fromDate").datepicker( "option", "maxDate", selectedDate );                  
				}
			});
			
			if($("#toDate").val() == "") {
				$("#fromDate").datepicker( "option", "maxDate", toMaxDate);
			}
		}
			
		
		
		var jsonRst = [];

		$(".r_num").click(function() {
			
			// 초기화
			arr = [];
			disabledDays = [];
			
			dateArr = [];
			dayArr = [];
			endArr = [];
			noArr = [];
			
			var r_num = $(this).val();
            		
        	$.ajax({
				type: "post",
				url: "resAjax.do",
				async: false,
				cache: false,
				dataType: "json",  
				data: {
					"roomnum":$('input[name="r_num"]:checked').val()
				},
				success: function(data){
					
					var jsonData = JSON.stringify(data);
					var jsonParse = JSON.parse(jsonData);
					
					jsonParse.forEach((item)=>{
						jsonRst.push([item.res_checkIn, parseInt(item.res_day)]);
						arr.push([item.res_checkIn, parseInt(item.res_day)]);
					});
					
					if(arr.length > 0) {
						datepickerDateRemove(arr);
						datepickerControl();
						
					} else {
						disabledDays = [];
						datepickerControl();
					}
					
                },
				error: function(request, status, error) {
					console.log(request);
					console.log(status);
					console.log(error);
                }
                	
			}); 
       	
		}); 
		
		
		
		$(".r_num").change(function() {
			
			$(".choiceD").show();
			$(".resInfo").hide();
			$("#toDate").val('');
			$("#fromDate").val('');
			$("#toDate").datepicker("destroy");
			$("#fromDate").datepicker("destroy");
			datepickerControl();
			
		});
		
		
		$("#fromDate").click(function() {
			if($("#toDate").val()) {
				$("#toDate").val("");
				$("#toDate").datepicker("destroy");
				$("#fromDate").datepicker("destroy");
				datepickerControl();
			}
		});
		
		
		
		$("#toDate").change(function() {
			
			if($("#fromDate").val()=="" || $("#fromDate").val()==null) {
				alert('입실일을 먼저 선택하세요');
				$("#toDate").val("");
			}
		});
	
		
		$("#btn").click(function() {
        			
			var rn = $('input:radio[name="r_num"]:checked').val();
				$("#roomNum").val(rn);
			var fd = $('input:text[name="fromDate"]').val();
				$("#res_checkIn").val(fd);
			var td = $('input:text[name="toDate"]').val();
				$("#res_checkOut").val(td);
            	
			if (rn=="" || rn==null) {alert('객실을 선택하세요');}
			else if (fd=="" || fd==null) {alert('입실일을 선택하세요');}
			else if (td=="" || td==null) {alert('퇴실일을 선택하세요');}
			else if (fd==td) {alert('입실일과 퇴실일은 같을 수 없습니다'); $(".resInfo").hide();}
			else{$(".resInfo").show();}
      			
			var start = new Date(fd);
			var end = new Date(td);
			var diffTime = ((end.getTime()-start.getTime())/(24*60*60*1000));
			$("#res_day").val(parseInt(diffTime));
			$("#res_day2").val(diffTime + "박 " + parseInt(diffTime+1) + "일");
			
			
			var rd = $("#res_day").val();
			var pr = $("#price").val();
			var Tprice = rd*pr;
			$("#Tprice").val(Tprice+"원");
			
		});
                    
	});   


	function datepickerDateRemove(arr) {
		for (var i = 0; i<arr.length; i++) {
			var this_date = arr[i][0];
			var this_date2 = new Date(this_date);
			var this_day = arr[i][1]-1;
			var end_date = new Date(this_date);
				end_date = end_date.setDate(end_date.getDate() + this_day);
			var end_date2 = new Date(end_date);
			var no_date = getDateRangeData(this_date2, end_date2);
		
			dateArr.push(this_date);
			dayArr.push(this_day);
			endArr.push((new Date(end_date)).toLocaleDateString());
			noArr.push(no_date);
		}        
		const realNoArr = noArr.reduce(function (acc, cur) {
			return acc.concat(cur);
		});
		
	           
		disabledDays = realNoArr;
		
	}
		
	function getDateRangeData(param1, param2){ 
		var res_day = [];
		var ss_day = new Date(param1);
		var ee_day = new Date(param2);    
			while(ss_day.getTime() <= ee_day.getTime()){
				var _mon_ = (ss_day.getMonth()+1);
				var _day_ = ss_day.getDate();
				res_day.push(ss_day.getFullYear() + '-' + _mon_ + '-' +  _day_);
				ss_day.setDate(ss_day.getDate() + 1);
			}
		return res_day;
	   }
	
	function disableAllTheseDays(date) {
		var m = date.getMonth();
		var d = date.getDate();
		var y = date.getFullYear();
		
		if(disabledDays.length > 0) {
			for (i = 0; i < disabledDays.length; i++) {
				if($.inArray(y + '-' +(m+1) + '-' + d, disabledDays) != -1) {
					return [false];
				}
			} return [true];
		} else {
			return [true];
		}
		
	}
            
	
</script>

<body>
<jsp:include page="../common/header.jsp"/>
<jsp:include page="../common/loginCheck.jsp"/>


<div class="box">
<div class = "resContent">
	<h1>예약하기</h1>
	<div class = "choiceR">
	
	<h2> <br>객실선택<br></h2>
		<label class="roomNum">
	    <input type="radio" name="r_num" class="r_num r101" id="r_num" value="101">
	    <span>101호</span>
		</label>
	 
		<label class="roomNum">
	    <input type="radio" name="r_num" class="r_num r102" id="r_num" value="102">
	    <span>102호</span>
		</label>
	 
		<label class="roomNum">
	    <input type="radio" name="r_num" class="r_num r103" id="r_num" value="103">
	    <span>103호</span>
		</label>
	
		<label class="roomNum">
	    <input type="radio" name="r_num" class="r_num r104" id="r_num" value="104">
	    <span>104호</span>
		</label>
	</div>
		
	<div class = "choiceD" style="display:none">
		<h2> <br>날짜선택<br></h2>
		<form class="calForm" >
          <label for="fromDate">입실일</label>
          <input type="text" name="fromDate" id="fromDate" readonly>
          <br>
          <label for="toDate">퇴실일</label>
          <input type="text" name="toDate" id="toDate" readonly>
        </form>
	</div>
	

	<div class = "resSearchB">
		<input type="button" value="검색하기" id="btn" >

	</div>
	
<jsp:include page="./roomConCheck.jsp"/>
<jsp:include page="./roomPrTest.jsp"/>

	<div class = "resInfo" style="display:none">
		<form name = "resInfoForm" action="rsv.do" class="resInfoForm" method="post">
			<table class = "resInfoTable">
				<tr>
					<td style="text-align:center"><h2>예약정보</h2><br></td>
				</tr>
				<tr><td>예약자 아이디 : <input type="text" name= "m_id" value="${sessionScope.m_id}" readonly style="border: 0px;"></td></tr>
				<tr><td>객실번호 : <input type="text" name="r_num" id="roomNum" readonly style="border: 0px;"></td></tr>
				<tr><td>입실일 : <input type="text" name="res_checkIn" id="res_checkIn" readonly style="border: 0px;"></td></tr>
				<tr><td>퇴실일 : <input type="text" id="res_checkOut" readonly style="border: 0px;"></td></tr>
				
				<tr><td><input type="hidden" name="res_day" id="res_day"></td></tr>
				<tr><td><input type="hidden" id="price" ></td></tr>
				
				<tr><td>숙박일수 : <input type="text" id="res_day2" readonly style="border: 0px;"></td></tr>
				<tr><td>결제금액 : <input type="text" id="Tprice" readonly style="border: 0px;"></td></tr>
					
				<tr>
					<td><br><input type="button" onclick="javascript:resInfoForm.submit()" value="예약하기" id="btn2"/></td>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>



<jsp:include page="../common/footer.jsp"/>
</body>
</html>