package com.Login;

import java.sql.*;
import com.DB.connection.Connect;
public class Validate {
	public static boolean checkUser(int empid, String pass) {
		boolean st = false;
		try {

			Connection con = Connect.getconnection();
			PreparedStatement ps = con.prepareStatement("select * from registeruser where Emp_id=? and password=?");
			ps.setInt(1, empid);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			st = rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return st;
	}

	public static String getName(int emp) {
		String name = null;
		try {
			Connection con = Connect.getconnection();
			PreparedStatement ps = con.prepareStatement("select * from registeruser where Emp_id=?");
			ps.setInt(1, emp);
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){
			name=rs.getString("username");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return name;

	}
	public static int getflag(int emp) {
		int flag=0;
		try {
			Connection con = Connect.getconnection();
			PreparedStatement ps = con.prepareStatement("select * from registeruser where Emp_id=?");
			ps.setInt(1, emp);
			ResultSet rs=ps.executeQuery();  
			while(rs.next()){
			flag=rs.getInt("flag");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	public static void sessionTrack(int emp) {try {
		java.util.Date date= new java.util.Date();
		 String timestamp=new Timestamp(date.getTime()).toString();
		Connection con = Connect.getconnection();
		PreparedStatement ps = con.prepareStatement("INSERT INTO usersession (Emp_id,Timestamp) VALUES (?,?)");
		ps.setInt(1, emp);
		ps.setString(2, timestamp);
		
		ps.executeUpdate();
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	}
}