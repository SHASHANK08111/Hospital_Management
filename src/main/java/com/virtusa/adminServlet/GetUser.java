package com.virtusa.adminServlet;
import com.db.DBConnect;
import com.virtusa.dao.UserDao;
import com.virtusa.entity.User;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserServlet")
public class GetUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDao userDao = new UserDao(DBConnect.getConnection());
        List<User> users = userDao.getAllUsers();
        request.setAttribute("users", users);


        request.getRequestDispatcher("admin/UserDetails.jsp").forward(request, response);
    }
}

