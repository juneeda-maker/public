package debate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DebateDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public DebateDAO() {
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
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO DEBATE(bbsID, bbsTitle, userID, bbsDate, bbsContent, bbsAvailable)VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList<Debate> getList(int pageNumber){
		String SQL = "SELECT * FROM DEBATE WHERE bbsID <? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Debate>list = new ArrayList<Debate>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Debate debate = new Debate();
				debate.setBbsID(rs.getInt(1));
				debate.setBbsTitle(rs.getString(2));
				debate.setUserID(rs.getString(3));
				debate.setBbsDate(rs.getString(4));
				debate.setBbsContent(rs.getString(5));
				debate.setBbsAvailable(rs.getInt(6));
				list.add(debate);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM DEBATE WHERE bbsID<?AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext()-(pageNumber-1)*10);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					return true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		return false;
	}
	public Debate getDebate(int bbsID) {
		String SQL= "SELECT * FROM DEBATE WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Debate debate = new Debate();
				debate.setBbsID(rs.getInt(1));
				debate.setBbsTitle(rs.getString(2));
				debate.setUserID(rs.getString(3));
				debate.setBbsDate(rs.getString(4));
				debate.setBbsContent(rs.getString(5));
				debate.setBbsAvailable(rs.getInt(6));
				return debate;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}


