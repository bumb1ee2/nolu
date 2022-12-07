<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail</title>
</head>
<body>
<div align="center"><h2>Detail</h2>
	<table border="1" align="center">
		<tr>
			<td>번호</td><td>${vo.bno }</td>
		</tr>
		<tr>
			<td>제목</td><td>${vo.title }</td>
		</tr>	
		<tr>
			<td>작성자</td><td>${vo.writer }</td>
		</tr>	
		<tr>
			<td>작성시간</td><td>${vo.regdate }</td>
		</tr>	
		<tr>
			<td>조회수</td><td>${vo.hit }</td>
		</tr>	
		<tr>
			<td>내용</td><td style="width:200px; height:200px;">${vo.content }</td>
		</tr>	
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="목록" onclick="location.href='testList.do'">
				<input type="button" value="수정" onclick="location.href='modify.do?bno=${vo.bno }'">
				<input type="button" value="삭제" onclick="location.href='deleteTest.do?bno=${vo.bno }'">
			</td>
		</tr>
	</table>
</div>
</body>
</html>