
package sorce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class find_id_pw {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	// 1. 스스로 객체를 생성
	//2. 외부에서 생성자를 호출 할 수 없도록 생성자에 private 줘버림
	public find_id_pw() {
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

	// join 메서드
	public int join(ACC_USER ac) {
		int result = 0;
		
		String sql = "insert into ACC_USER values(?,?,?,?,null,null)";
		
		try {
			
			//pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ac.getUSER_ID());
			pstmt.setString(2, ac.getUSER_PW());
			pstmt.setString(3, ac.getUSER_NAME());
			pstmt.setString(4, ac.getUSER_EMAIL());
			
			//sql 실행
			result = pstmt.executeUpdate();
			
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
	/*
	 * // login메서드 public int login(String mail) { String sql =
	 * "select USER_EMAIL from account_book where USER_EMAIL = ? "; try { pstmt =
	 * conn.prepareStatement(sql);// pstmt 생성 pstmt.setString(1, mail); rs =
	 * pstmt.executeQuery(); // sql실행 if(rs.next()) { // 로그인 성공
	 * if(rs.getString(1).equals(mail)) { return 1; }else return 0;
	 * 
	 * } return -1; }catch (Exception e) { e.printStackTrace(); } return -2; }
	 * 
	 * // 회원정보를 조회하는 메서드 public ACC_USER getInfo(String id) { ACC_USER vo = null;
	 * 
	 * String sql = "select * from members where id = ?";
	 * 
	 * try { conn = DriverManager.getConnection(url, id, pw); pstmt =
	 * conn.prepareStatement(sql); pstmt.setString(1, id);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * if(rs.next()) { vo = new ACC_USER();
	 * 
	 * vo.setUSER_ID(id); vo.getUSER_EMAIL("email");
	 * 
	 * } } catch(Exception e) {
	 * 
	 * } finally { try { if(conn != null) conn.close(); if(pstmt != null)
	 * pstmt.close(); if(rs != null) rs.close(); } catch(Exception e) {
	 * e.printStackTrace(); } }
	 * 
	 * return vo; }
	 * 
	 * // update메서드 public int update(ACC_USER vo) { int result = 0;
	 * 
	 * String sql = "update members set pw = ?, name = ?, phone1 = ?, phone2 = ?," +
	 * "phone3 = ?, gender = ? where id = ?";
	 * 
	 * try { conn = DriverManager.getConnection(url, id, pw);
	 * 
	 * pstmt = conn.prepareStatement(sql); pstmt.setString(1, vo.getPw());
	 * pstmt.setString(2, vo.getName()); pstmt.setString(3, vo.getPhone1());
	 * pstmt.setString(4, vo.getPhone2()); pstmt.setString(5, vo.getPhone3());
	 * pstmt.setString(6, vo.getGender()); pstmt.setString(7, vo.getId());
	 * 
	 * result = pstmt.executeUpdate(); // 성공시 1반환, 실패시 0반환 } catch(Exception e) {
	 * e.printStackTrace(); } finally { try { if(conn != null) conn.close();
	 * if(pstmt != null) pstmt.close(); } catch(Exception e) { e.printStackTrace();
	 * } }
	 * 
	 * return result; }
	 * 
	 * // delete메서드 public int delete(String id) { int result = 0;
	 * 
	 * String sql = "delete from members where id = ?";
	 * 
	 * try { conn = DriverManager.getConnection(url, id, pw);
	 * 
	 * pstmt = conn.prepareStatement(sql); pstmt.setString(1, id);
	 * 
	 * result = pstmt.executeUpdate(); } catch(Exception e) { e.printStackTrace(); }
	 * finally { try { if(conn != null) conn.close(); if(pstmt != null)
	 * pstmt.close(); } catch(Exception e) { e.printStackTrace(); } }
	 * 
	 * return result; }
	 */
}