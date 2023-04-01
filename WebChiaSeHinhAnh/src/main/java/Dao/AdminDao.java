package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.adminAccount;
import context.DBContext;

public class AdminDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	// admin login
	public adminAccount adminLogin(String user, String pass) {
		String query = "select * from adminAccount where adUsername = ? and adPassword = ?";
		try {

			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			while (rs.next()) {
				adminAccount a = new adminAccount(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5));
				return a;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
