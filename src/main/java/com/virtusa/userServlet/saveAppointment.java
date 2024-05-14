package com.virtusa.userServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;
import com.virtusa.dao.AppointmentDao;
import com.virtusa.entity.Appointment;

@WebServlet("/saveAppointment")
public class saveAppointment extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  try {
	
            
	        String slot = req.getParameter("slot");
	      
	        
	        HttpSession appointmentSession = req.getSession();
	        HttpSession session = req.getSession();
	        Appointment ap = (Appointment) appointmentSession.getAttribute("appointmentObj");
	        
	        ap.setSlot(slot);
	        AppointmentDao adao=new AppointmentDao(DBConnect.getConnection());
	        boolean f=adao.saveAppointmentToDB(ap);
	        if(f){
                session.setAttribute("succMsg", "Appointment Added Successfully");
                resp.sendRedirect("user/BookAppointment.jsp");
                session.removeAttribute("appointmentObj");
            }
            else{
                session.setAttribute("errorMsg", "Something wrong in server");
                resp.sendRedirect("user/BookAppointment.jsp");
            }
	        
	        
		  } catch (Exception e){
	            e.printStackTrace();
	        }
	}

}
