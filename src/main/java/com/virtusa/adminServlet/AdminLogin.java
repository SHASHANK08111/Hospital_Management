package com.virtusa.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.virtusa.entity.User;

import javax.servlet.http.*;

@WebServlet("/admin-login")
public class AdminLogin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			HttpSession session=req.getSession();
			if("admin@gmail.com".equals(email)&& "admin".equals(password)) {
				session.setAttribute("adminObj", new User());
				resp.sendRedirect("admin/index.jsp");
			}else {
				session.setAttribute("errorMessage", "invalid email and password");
				resp.sendRedirect("admin-login.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
