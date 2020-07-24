package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CommentDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public CommentDAO() {
		try {
			String jdbcURL = "jdbc:mysql://localhost:3306/FORUM";
			String dbID = "root";
			String dbPassword = "4940";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
