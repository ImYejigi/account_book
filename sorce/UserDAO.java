package sorce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		public UserDAO() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url ="jdbc:oracle:thin:@localhost:1521:xe";
				String id = "yejik";
				String pw = "qwer1234";
				conn = DriverManager.getConnection(url,id,pw);
			}catch(Exception e) {
				System.out.println("드라이버 호출 에러");
			}
		}
		
		public int login(String userID, String userPW) {
			String SQL = "SELECT USER_PW FROM ACC_USER WHERE USER_ID=?";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(userPW))
						return 1;
					else
						return 0;
				}
				return -1;
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -2;
		}
		
		public int join(ACC_USER ac) {
			int result = 0;
			
			String sql = "insert into ACC_USER values(?,?,?,?,SYSDATE)";
			
			try {
				
				//pstmt 생성
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, ac.getUSER_ID());
				pstmt.setString(2, ac.getUSER_PW());
				pstmt.setString(3, ac.getUSER_NAME());
				pstmt.setString(4, ac.getUSER_EMAIL());
				
				//sql 실행
				result = pstmt.executeUpdate();
				return result;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(conn != null) conn.close();
					if(pstmt != null) pstmt.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			result = -1;
			return result;
		}
}
