package com.virtusa.doctorServlet;

import com.db.DBConnect;
import com.virtusa.dao.DoctorDao;
import com.virtusa.entity.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/doctor-login")
public class DoctorLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String email=req.getParameter("email");
            String password=req.getParameter("password");
            DoctorDao doctorDao = new DoctorDao(DBConnect.getConnection());
            HttpSession session=req.getSession();
            Doctor d = doctorDao.doctorLogin(email, password);
            if(d!=null) {
                session.setAttribute("doctorObj", d);
                resp.sendRedirect("doctor/doctorIndex.jsp");
            }else {
                session.setAttribute("errorMessage", "Invalid username or password");
                resp.sendRedirect("doctor-login.jsp");

            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
