package com.virtusa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.virtusa.entity.Doctor;

public class DoctorDao {
    private Connection conn;
    public  DoctorDao(Connection conn){
        super();
        this.conn = conn;
    }
    public boolean registerDoctor(Doctor d){
        boolean f = false;
        try{
            String sql = "insert into  DoctorDetails(fullname, dob, qualification, specialist, email, mobNo, password) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, d.getFullname());
            ps.setDate(2, d.getDob());
            ps.setString(3, d.getQualification());
            ps.setString(4, d.getSpecialist());
            ps.setString(5, d.getEmail());
            ps.setString(6, d.getMobNo());
            ps.setString(7, d.getPassword());

            int i = ps.executeUpdate();
            if(i==1){
                f = true;
            }
        }catch (Exception e){

        }
        return f;
    }
    public ArrayList<Doctor> getAllDoctors(){

        ArrayList<Doctor> docList = new ArrayList<>();
        Doctor d = null;
        try{
            String sql = "select * from DoctorDetails order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	d = new Doctor();
            	d.setId(rs.getInt(1));
            	d.setFullname(rs.getString(2));
            	d.setDob(rs.getDate(3));
            	d.setQualification(rs.getString(4));
            	d.setSpecialist(rs.getString(5));
            	d.setEmail(rs.getString(6));
            	d.setMobNo(rs.getString(7));
            	d.setPassword(rs.getString(8));
            	docList.add(d);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return docList;

    }

    //doctor login
    public Doctor doctorLogin(String email, String password){
        Doctor d = null;
        try{
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM DoctorDetails WHERE email='" + email + "' AND password= '" + password + "'");
            while(rs.next()) {
                d = new Doctor();
                d.setId(rs.getInt(1));
                d.setFullname(rs.getString(2));
                d.setEmail(rs.getString(3));
                d.setPassword(rs.getString(4));
                d.setMobNo(rs.getString(5));
            }
        }catch(SQLException e){
                e.printStackTrace();
        }
        return d;
    }

    public ArrayList<Doctor> getAllDoctorsBySpecialistName(String specialist){
    	 ArrayList<Doctor> docList = new ArrayList<>();
         Doctor d = null;
        try{
            String sql = "Select * from DoctorDetails where  specialist=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, specialist);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	d = new Doctor();
            	d.setId(rs.getInt(1));
            	d.setFullname(rs.getString(2));
            	d.setDob(rs.getDate(3));
            	d.setQualification(rs.getString(4));
            	d.setSpecialist(rs.getString(2));
            	d.setEmail(rs.getString(2));
            	d.setMobNo(rs.getString(2));
            	d.setPassword(rs.getString(2));
            	docList.add(d);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return docList;
    }
    
    public Doctor getDoctorbyId(int id){
        Doctor d = null;
        try{
            String sql = "select * from doctor where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	d = new Doctor();
            	d.setId(rs.getInt(1));
            	d.setFullname(rs.getString(2));
            	d.setDob(rs.getDate(3));
            	d.setQualification(rs.getString(4));
            	d.setSpecialist(rs.getString(5));
            	d.setEmail(rs.getString(6));
            	d.setMobNo(rs.getString(7));
            	d.setPassword(rs.getString(8));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    return d;
    }


}
