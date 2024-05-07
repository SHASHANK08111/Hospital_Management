package com.virtusa.dao;

import com.virtusa.entity.Specialist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SpecialistDoa {
    private Connection conn;

    public SpecialistDoa(Connection conn){
        super();
        this.conn = conn;
    }
    
    
    public boolean addSpecialist(String spec){
        boolean f = false;
        try{
            String sql = "insert into specialist(specialistName) values(?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, spec);

            int i = ps.executeUpdate();
            if(i==1){
                f = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    
    public ArrayList<Specialist> getAllSpecialist(){
        ArrayList<Specialist> list = new ArrayList<Specialist>();
        Specialist s = null;
        try{
            String sql = "Select * from specialist";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                s = new Specialist();
                s.setId(rs.getInt(1));
                s.setSpecialistName(rs.getString(2));
                list.add(s);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

}
 