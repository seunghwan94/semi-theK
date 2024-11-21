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


public class UserDto {
	public int insert(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		
			String sql = "INSERT  INTO tbl_user (id,pw,nick_name) values (?,?,?)";
			
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			int idx= 1;
			
			pstmt.setString(idx++, user.getId());
			pstmt.setString(idx++, user.getPw());
			pstmt.setString(idx++, user.getNickname());
			
			return pstmt.executeUpdate();
		}catch (SQLException | ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return 0;
		
	}

}
