package com.virtusa.controller.adminServlet;

import com.db.DBConnect;
import com.virtusa.dao.SpecialistDoa;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String specName= req.getParameter("specName");

        SpecialistDoa dao = new SpecialistDoa(DBConnect.getConnection());
        boolean f = dao.addSpecialist(specName);


        HttpSession session = req.getSession();
        if(f){
            session.setAttribute("successMessage", "Specialist Added");
            resp.sendRedirect("admin/index.jsp");
        }else{
            session.setAttribute("errorMessage", "someting wrong on server");
            resp.sendRedirect("admin/index.jsp");
        }
    }
}