package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public UserDAO() {
			try {
				String driver = "oracle.jdbc.driver.OracleDriver";
				String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
				String dbID = "scott";
				String dbPassword = "tiger";
				Class.forName(driver);
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public int login(String userID, String userPassword) {
			String SQL = "SELECT userPassword FROM TEST WHERE userID=?";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword))
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
		
		public int join(UserDTO user) {
			String SQL="INSERT INTO TEST VALUES (?,?,?,?)";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, user.getUserID());
				pstmt.setString(2, user.getUserPassword());
				pstmt.setString(3, user.getUserNmae());
				pstmt.setString(4, user.getUserEmail());
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
}
