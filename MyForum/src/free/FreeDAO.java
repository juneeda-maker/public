package free;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class FreeDAO {
		
		private Connection conn;
		private ResultSet rs;
		
		public FreeDAO() {
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
		public String getDate() { //현재시간 가져오는 함수
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
				return " "; //데이터 베이스 오류
			}
		public int getNext() { //글의 번호 정해주는 함숭
			String SQL = "SELECT bbsID FROM FREE ORDER BY bbsID DESC";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1)+1;
				}
				return 1;
			}catch(Exception e){
				e.printStackTrace();
			}
			return -1;
		}
		public int write(String bbsTitle, String userID, String bbsContent) {
			String SQL = "INSERT INTO FREE VALUES(?,?,?,?,?,?)"; //마지막에 쓰인 글 번호 겟
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, bbsTitle);
				pstmt.setString(3, userID);
				pstmt.setString(4, getDate());
				pstmt.setString(5, bbsContent);
				pstmt.setInt(6, 1); //첫 작성시 글은 삭제가 안된 형태
				return pstmt.executeUpdate(); //첫번째 게시물인 경우	
			}catch(Exception e){
				e.printStackTrace();
			}
			return -1;
		}
	}


