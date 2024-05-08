package com.virtusa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.virtusa.entity.Appointment;

public class AppointmentDao {

	private Connection conn;
	
	public AppointmentDao(Connection conn) {
		this.conn=conn;
	}
	
	public boolean saveAppointmentToDB(Appointment ap) {
		Boolean f=false;
		
		try {
			String sql="INSERT INTO appointment (userId, doctorId, username, age, disease, appointmentDate, slot, specialistName, doctorName, isApproved, comment, status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, ap.getUserId());
			ps.setInt(2, ap.getDoctorId());
			ps.setString(3, ap.getUsername());
			ps.setInt(4, ap.getAge());
			ps.setString(5, ap.getDisease());
			ps.setDate(6,ap.getAppointmentDate());
			ps.setString(7, ap.getSlot());
			ps.setString(8, ap.getSpecialistName());
			ps.setString(9, ap.getDoctorName());
			ps.setBoolean(10, ap.getIsApproved());
			ps.setString(11, ap.getComment());
			ps.setString(12, ap.getStatus());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		
		return f;
	}

	public ArrayList<Appointment> appointmentsToAttend(){
		ArrayList<Appointment> appointmentList = new ArrayList<Appointment>();
		Appointment appointment = null;
		try{
			String sql = "select * from appointments where status=false";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				appointment = new Appointment();
				appointment.setAppointmentId(rs.getInt(1));
				appointment.setUserId(rs.getInt(2));
				appointment.setDoctorId(rs.getInt(3));
				appointment.setUsername(rs.getString(4));
				appointment.setAge(rs.getInt(5));
				appointment.setDisease(rs.getString(6));
				appointment.setAppointmentDate(rs.getDate(7));
				appointment.setSlot(rs.getString(8));
				appointment.setSpecialistName(rs.getString(9));
				appointment.setDoctorName(rs.getString(10));
				appointment.setComment(rs.getString(11));
				appointment.setStatus(rs.getString(12));


				//appointment.setSpecialistName(rs.getString(2));
				appointmentList.add(appointment);
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return appointmentList;
	}
}
