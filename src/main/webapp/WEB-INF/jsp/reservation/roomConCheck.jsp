<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*"%>
<%@ page import = "javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>놀러올레</title>
</head>
	
<%
request.setCharacterEncoding("UTF-8");

ArrayList<Integer>RoomC = new ArrayList<Integer>();
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
	
	try { 
		String driver="org.postgresql.Driver";
		Class.forName(driver);
		String url = "jdbc:postgresql://localhost:5433/testdb";
		String userName="postgres";
		String passWord="1234";
		Connection con = DriverManager.getConnection(url, userName, passWord);
		String sql= "select r_num from room where r_state='비활성화'";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getInt(1)==101) {
				%>
				<script>
					$(".r101").click(function() {
						alert("객실 점검중으로 현재 선택이 불가능합니다");
						return false;
					});
				</script>
				<%
			}else if(rs.getInt(1)==102) {
				%>
				<script>
					$(".r102").click(function() {
						alert("객실 점검중으로 현재 선택이 불가능합니다");
						return false;
					});
				</script>
				<%
			}else if(rs.getInt(1)==103) {
				%>
				<script>
					$(".r103").click(function() {
						alert("객실 점검중으로 현재 선택이 불가능합니다");
						return false;
					});
				</script>
				<%
			}else if(rs.getInt(1)==104) {
				%>
				<script>
					$(".r104").click(function() {
						alert("객실 점검중으로 현재 선택이 불가능합니다");
						return false;
					});
				</script>
				<%
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
		
	} finally {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
%>

  
</body>
</html>