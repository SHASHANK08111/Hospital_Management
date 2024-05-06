package com.virtusa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import com.virtusa.entity.User;

public class UserDao {
	
	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean userRegister(User u) {
		boolean f=false;
		try {
			 String query="INSERT INTO users (firstname, lastname, email, password, phonenumber) VALUES(?,?,?,?,?)";		
			 PreparedStatement ps=conn.prepareStatement(query);
			 ps.setString(1, u.getFirstName()); // First Name
			 ps.setString(2, u.getLastName()); // Last Name
			 ps.setString(3, u.getEmail()); // Email
			 ps.setString(4, u.getPassword()); // Password
			 ps.setString(5, u.getPhoneNumber()); // Phone Number
			 
			 int i =ps.executeUpdate();
			 if(i==1) {
				 f=true;
			 }
			 
			 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User userLogin(String email1,String password1) {
		User u=null;
		try {
			Statement st=conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='" + email1 + "' AND password= '" + password1 + "'");
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setFirstName(rs.getString(2));
				u.setLastName(rs.getString(3));
				u.setEmail(rs.getString(4));
				u.setPassword(rs.getString(5));
				u.setPhoneNumber(rs.getString(6));
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return u;
		
	}

}
