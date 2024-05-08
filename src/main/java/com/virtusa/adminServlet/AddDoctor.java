package com.virtusa.adminServlet;

import com.db.DBConnect;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.virtusa.dao.DoctorDao;
import com.virtusa.entity.Doctor;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String fullName = req.getParameter("fullname");

          
            
            String dob = req.getParameter("dob");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(dob);

        
            java.sql.Date dobSqlDate = new java.sql.Date(parsedDate.getTime());
            System.out.println(dob);
            System.out.println(dobSqlDate);
            

            String qualification = req.getParameter("qualification");
            String spec = req.getParameter("specialist");
            String email= req.getParameter("email");
            String mobno = req.getParameter("mobno");
            String password = req.getParameter("password");



            Doctor d = new Doctor(fullName, dobSqlDate, qualification, spec, email, mobno, password);

            DoctorDao dao = new DoctorDao(DBConnect.getConnection());
            HttpSession session = req.getSession();
            if(dao.registerDoctor(d)){
                session.setAttribute("succMsg", "Doctor Added Successfully");

                resp.sendRedirect("admin/AddDoctor.jsp");
            }
            else{
                session.setAttribute("errorMsg", "Something wrong in server");
                resp.sendRedirect("admin/AddDoctor.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}

