package geocni;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Testdb {
	public static void main(String[] args) throws Exception {
		System.out.println("****************");
		Connection conn = null;
		
		String url = "jdbc:postgresql://localhost:5433/testdb";
		String user = "postgres";
		String pass = "1234";
		
		ResultSet rs = null;
		Statement st = null;
		String sql = "select * from member";
		
		try {
			Class.forName("org.postgresql.Driver");
			System.out.println("Driver Loading Success");
			
			try {
				conn = DriverManager.getConnection(url, user, pass);
				System.out.println("Connect Success");
				
				st = conn.createStatement();
				rs = st.executeQuery(sql);
				
				while (rs.next()) {
					String m_id = rs.getString("m_id");
					String passwd = rs.getString("m_pass");
					
					System.out.println(m_id + "/" + passwd);
				}
				
				System.out.println("executeQuery success");
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println(e);
				System.out.println("DB Connect Error");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
