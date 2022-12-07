<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify</title>
</head>
<body>

<div align="center"><h2>Modify</h2>
	<form action="updateTest.do" method="post">
		<table border="1" align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" style="width:200px;" name="title" value="${vo.title }">
					<input type="hidden" name="bno" value="${vo.bno }">
				</td>
			</tr>	
			<tr>
				<td>작성자</td>
				<td><input type="text" style="width:200px;" name="writer" value="${vo.writer }"></td>
			</tr>	
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="height:200px; width:200px;" >${vo.content }</textarea></td>
			</tr>	
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="button" value="이전" onclick="location.href='testList.do'">
				</td>
			</tr>
		</table>
	</form>
	
	<script>
	</script>
</div>
</body>
</html>