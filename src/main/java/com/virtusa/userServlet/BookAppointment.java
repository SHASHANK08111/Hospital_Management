package com.virtusa.userServlet;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;
import com.virtusa.dao.DoctorDao;
import com.virtusa.entity.Appointment;
import com.virtusa.entity.Doctor;
import com.virtusa.entity.User;


@WebServlet("/BookAppointment")
public class BookAppointment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  try {
		    DoctorDao ddao=new DoctorDao(DBConnect.getConnection());
		    
		    
		    HttpSession session = req.getSession();
	        User user = (User) session.getAttribute("userObj");
	        int userId = user.getId();
	        
	        String doctorIdInString = req.getParameter("doctor");
	        int doctorId = Integer.parseInt(doctorIdInString);
	        
		    String username = req.getParameter("username");
	        int age = Integer.parseInt(req.getParameter("age"));
	        String disease = req.getParameter("disease");
	        
	        String dob = req.getParameter("appointmentDate");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(dob);
            java.sql.Date appointmentDate = new java.sql.Date(parsedDate.getTime());
	        
            
            
	        String slot = null;
	        String specialistName = req.getParameter("specialist");
	      
		
	        Doctor d=ddao.getDoctorbyId(doctorId);
	
	        String doctorName=d.getFullname();
	        Boolean isApproved=false;
	        String comment=null;
	        String status="Not Completed";
	        
	        
	        Appointment ap=new Appointment(userId,doctorId,username,age,disease,appointmentDate,slot,specialistName, doctorName,isApproved,
			comment,status);
	       
	        HttpSession AppointmentSession = req.getSession();
	        AppointmentSession.setAttribute("appointmentObj",ap);
	        resp.sendRedirect("user/checkAvailableSlot.jsp");
		  } catch (Exception e){
	            e.printStackTrace();
	        }
	}
	

}
