package dto;


import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import utils.DBConn;
import vo.User;
import vo.UserDetail;
import vo.UserDetailLog;
import vo.UserLog;


public class UserDto {
	
	public int insert(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
	
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		
			String sql = "INSERT INTO tbl_user (id,pw,att,nick_name) values (?,?,?,?)";
			
			
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			int idx= 1;
			
			pstmt.setString(idx++, user.getId());
			pstmt.setString(idx++, user.getPw());
			pstmt.setString(idx++, user.getNickName());
			
			return pstmt.executeUpdate();
		}catch (SQLException | ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch (SQLException ignore) {}
		
		}
		return 0;
	}
	public int insert(UserDetail userDetail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
	
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		
			String sql = "INSERT INTO tbl_user_detail (id) values (?)";
			
			
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			int idx= 1;
			
			pstmt.setString(idx++, userDetail.getId());
			return pstmt.executeUpdate();
		}catch (SQLException | ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch (SQLException ignore) {}
		
		}
		return 0;
	}
	public int insert(UserLog userLog) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
	
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		
			String sql = "INSERT INTO tbl_user_log (user_id) values (?)";
			
			
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			int idx= 1;
			
			pstmt.setString(idx++, userLog.getUserId());
			return pstmt.executeUpdate();
		}catch (SQLException | ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch (SQLException ignore) {}
		
		}
		return 0;
	}
	private static final UserDto dto = new UserDto(); 
	
	public static UserDto getInstance() { //싱글턴 메서드 
		return dto;
	}
	
	private UserDto() {} //기본 생성자

	public User selectOne(String id) throws ClassNotFoundException, SQLException {
		User user = null;
		String sql = "select * from tbl_user where id =?";
		try(Connection conn = DBConn.getConnection(); PreparedStatement pstmt=conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) { //다음 행이 있는지 없는지
				user = User.builder()
						.id(rs.getString("id"))
						.pw(rs.getString("pw"))
						.nickName(rs.getString("nickname"))
						.build();
			}
		}catch (ClassNotFoundException | SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
	}
	public int update(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "update tbl_user set pw = ? where id = ?";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			int idx = 1;
			
			pstmt.setString(idx++, user.getPw());
			pstmt.setString(idx++, user.getId());
			return pstmt.executeUpdate();
				
			}catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}finally {
				try {
					pstmt.close();
					conn.close();
				} catch (SQLException ignore) {
				}
			}
				return 0;
	}
	
}
