<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>
<%@ page import = "org.json.simple.*"%>
<%@ page import = "java.io.PrintWriter" %>

<%
	request.setCharacterEncoding("UTF-8"); 
	int roomnum =Integer.parseInt(request.getParameter("roomnum"));
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String driver="org.postgresql.Driver";
		Class.forName(driver);
		String url = "jdbc:postgresql://localhost:5433/testdb";
		String userName="postgres";
		String passWord="1234";
		Connection con = DriverManager.getConnection(url, userName, passWord);
		
		String sql = "select res_checkIn, res_day from reservation where r_num=? order by res_checkIn ASC";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, roomnum);
		rs = pstmt.executeQuery();
		JSONArray jsonArr = new JSONArray();
		
		while(rs.next()) {
			String res_checkIn = rs.getString("res_checkIn");
			String res_day = rs.getString("res_day");
			JSONObject obj = new JSONObject();
			obj.put("res_checkIn", res_checkIn);
			obj.put("res_day", res_day);
			jsonArr.add(obj);
			
		}
		out.print(jsonArr);
	} catch (Exception e) {
		e.printStackTrace();
	} 
	

%>