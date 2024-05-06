package com.virtusa.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;
import com.virtusa.dao.UserDao;
import com.virtusa.entity.User;

@WebServlet("/user-register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String fullName=req.getParameter("firstname");
		String lastName=req.getParameter("lastname");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		String phoneNumber=req.getParameter("phonenumber");
		
		User u=new User(fullName,lastName,email,password,phoneNumber);
		UserDao userdao=new UserDao(DBConnect.getConnection());
		
		HttpSession session=req.getSession();
		boolean f=userdao.userRegister(u);
		
		if(f) {
			System.out.println("1");
			session.setAttribute("successMessage","Register Successful" );
			resp.sendRedirect("user-registration.jsp");
		}else {
			session.setAttribute("errorMessage","Something Wrong in registration" );
			resp.sendRedirect("user-registration.jsp");
			System.out.println("1");
		}

	}

	
	
}
