package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DBConnect {

	public static Connection getConnection() {
		Connection con=null;
			try {
				ResourceBundle message = ResourceBundle.getBundle("messages");
				System.out.println(message.getString("SQL_URL"));
				System.out.println(message.getString("SQL_USER"));
				System.out.println(message.getString("SQL_PASSWORD"));

				con=DriverManager.getConnection(message.getString("SQL_URL"),message.getString("SQL_USER"),message.getString("SQL_PASSWORD"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return con;
	}
}
