package com.virtusa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
            String sql = "insert into Doctor(fullname, dob, qualification, specialist, email, mobNo, password) values(?,?,?,?,?,?,?)";
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
            String sql = "select * from doctor order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                d = new Doctor();
                d.setId(rs.getInt(1));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    return docList;
    }
}
