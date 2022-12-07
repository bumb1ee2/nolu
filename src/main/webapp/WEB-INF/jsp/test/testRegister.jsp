<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
</head>
<body>
<div align="center"><h2>Register</h2>
	<form action="insertTest.do" method="post">
		<table border="1" align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" style="width:200px;" name="title"></td>
			</tr>	
			<tr>
				<td>작성자</td>
				<td><input type="text" style="width:200px;" name="writer" value="${sessionScope.mid }" readonly></td>
			</tr>	
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="height:200px; width:200px;" ></textarea></td>
			</tr>	
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="button" value="이전" onclick="location.href='testList.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>