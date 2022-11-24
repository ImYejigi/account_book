package sorce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CAL_TYPE_DAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public CAL_TYPE_DAO() {
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
	public int join(CAL_TYPE ct) {
		int result = 0;
		
		String sql = "insert into CAL_TYPE values(?,?,?,?,null,null,cal_seq.nextval)";
		
		try {
			
			//pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ct.getUSER_ID());
			pstmt.setString(2, ct.getCAL_TYPE_ID());
			pstmt.setString(3, ct.getCAL_TYPE_NAME());
			pstmt.setString(4, ct.getCAL_AMOUNT());
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
