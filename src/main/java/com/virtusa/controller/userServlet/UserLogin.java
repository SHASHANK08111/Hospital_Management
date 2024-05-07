package com.virtusa.controller.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import com.db.DBConnect;
import com.virtusa.dao.UserDao;
import com.virtusa.entity.User;

import javax.servlet.http.*;

@WebServlet("/user-login")
public class UserLogin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			String email=req.getParameter("email");
			String password=req.getParameter("password");

			UserDao userdao=new UserDao(DBConnect.getConnection());
			HttpSession session=req.getSession();
			
			
			User u=userdao.userLogin(email, password);
			
			if(u!=null) {
				session.setAttribute("userObj", u);
				resp.sendRedirect("user/index.jsp");
			}else {
				session.setAttribute("errorMessage", "Invalid username or password");
				resp.sendRedirect("user-login.jsp");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
