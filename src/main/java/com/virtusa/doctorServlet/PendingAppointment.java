package com.virtusa.doctorServlet;

import com.db.DBConnect;
import com.virtusa.dao.AppointmentDao;
import com.virtusa.entity.Appointment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/pendingAppointment")
public class PendingAppointment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        AppointmentDao ap = new AppointmentDao(DBConnect.getConnection());
        ArrayList<Appointment> appointmentArrayList = ap.appointmentsToAttend();

        req.setAttribute("appointments", appointmentArrayList);

        req.getRequestDispatcher("doctor/PendingAppointment.jsp").forward(req, resp);
    }
}
