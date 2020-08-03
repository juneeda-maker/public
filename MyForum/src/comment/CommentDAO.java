package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import free.Free;



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
	public int getNext() { //글의 번호 정해주는 함수
		String SQL = "SELECT bbsID FROM DEBATE ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int write(String ruserID, String content) {
		String SQL = "INSERT INTO DEBATE(rnum, rboard, ruserID, content, rdate)VALUES(?,?,?,?,?)";
		try {
			Free objfree = new Free();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, objfree.getBbsID());
			pstmt.setString(3, ruserID);
			pstmt.setString(4, content);
			pstmt.setString(5, getDate());
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}	

