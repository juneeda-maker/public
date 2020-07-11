package free;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



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
		public ArrayList<Free> getList(int pageNumber){ //특정한 리스트 반환
			String SQL = "SELECT * FROM FREE WHERE bbsID<? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10"; //삭제되지 않은 글들만 가져
			ArrayList<Free>list = new ArrayList<Free>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext()-(pageNumber-1)*10);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Free free = new Free();
					free.setBbsID(rs.getInt(1));
					free.setBbsTitle(rs.getString(2));
					free.setUserID(rs.getString(3));
					free.setBbsDate(rs.getString(4));
					free.setBbsContent(rs.getString(5));
					free.setBbsAvailable(rs.getInt(6));
					list.add(free);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		public boolean nextPage(int pageNumber) {
			String SQL = "SELECT * FROM FREE WHERE bbsID<? AND bbsAvailable= 1 ORDER BY bbsID DESC LIMIT 10";
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
	}


