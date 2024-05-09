package com.virtusa.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.virtusa.entity.Appointment;

public class AppointmentDao {

    private static Connection conn;

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

    public  List<Appointment> getAppointmentsByUserId(String userId) {
        List<Appointment> appointments = new ArrayList<>();
        String sql = "SELECT * FROM appointments WHERE userId = ?";
        try(PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Appointment user = new Appointment();
                    user.setAppointmentId(rs.getInt("userId"));
                    user.setUsername(rs.getString("username"));
                    user.setAppointmentDate(rs.getDate("appointmentDate"));
                    user.setSlot(rs.getString("slot"));
                    user.setDoctorName(rs.getString("doctorName"));
                    user.setStatus(rs.getString("status"));

                    appointments.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(appointments);
        System.out.println("-----------");
        return appointments;
    }
}
