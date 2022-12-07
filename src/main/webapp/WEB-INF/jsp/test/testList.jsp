<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>
<div align="center"><h2>List</h2>

	ID : ${sessionScope.mid }
	<input type="button" value="로그아웃" onclick="location.href='logout.do'"> <br><br>

	<table border="1" align="center">
		<tr>
			<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회수</td>
		</tr>
		
		<c:forEach var="result" items="${list }">
		<tr>
			<td>${result.bno }</td>
			<td><a href="testDetail.do?bno=${result.bno}">${result.title}</a></td>
			<td>${result.writer }</td>
			<td>${result.regdate }</td>
			<td>${result.hit }</td>
		</tr>
		</c:forEach>	
	</table>

	<br>
	<input type="button" value="글쓰기" onclick="location.href='testRegister.do'">

</div>



</body>
</html>