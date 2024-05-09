package com.virtusa.adminServlet;

import com.db.DBConnect;
import com.virtusa.dao.AppointmentDao;
import com.virtusa.entity.Appointment;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ViewAppointmentsServlet")
public class GetAppointment extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        AppointmentDao dao = new AppointmentDao(DBConnect.getConnection());
        List<Appointment> appointments = dao.getAppointmentsByUserId(userId);
        request.setAttribute("appointments", appointments);
        request.getRequestDispatcher("admin/UserAppointment.jsp").forward(request, response);
    }
}

