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
		String sql= "select r_num, r_base_price from room";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			if(rs.getInt(1)==101) {
				int pr101 = rs.getInt(2);
				%>
				<script>
					$(".r101").click(function() {
	        		var pr101 = "<%=pr101%>";
						$("#price").val(pr101);
					
					});
				</script>
				<%
			}else if(rs.getInt(1)==102) {
				int pr102 = rs.getInt(2);
				%>
				<script>
					$(".r102").click(function() {
	        		var pr102 = "<%=pr102%>";
						$("#price").val(pr102);
					});
				</script>
				<%
			}else if(rs.getInt(1)==103) {
				int pr103 = rs.getInt(2);
				%>
				<script>
					$(".r103").click(function() {
	        			var pr103 = "<%=pr103%>";
						$("#price").val(pr103);
					});
				</script>
				<%
			}else if(rs.getInt(1)==104) {
				int pr104 = rs.getInt(2);
				%>
				<script>
					$(".r104").click(function() {
	        			var pr104 = "<%=pr104%>";
						$("#price").val(pr104);
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