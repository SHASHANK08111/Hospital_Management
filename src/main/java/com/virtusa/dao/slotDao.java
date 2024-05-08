package com.virtusa.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.virtusa.entity.Slot;
import com.virtusa.entity.Specialist;

public class slotDao {
	private Connection conn;

	public slotDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	 public ArrayList<Slot> getAvailableSlot(Date date1,int doctorId1){
	        ArrayList<Slot> slotList = new ArrayList<Slot>();
	        
	        try{
	            String sql ="SELECT * FROM slot WHERE slotTime NOT IN (SELECT slot FROM appointment WHERE appointmentDate = ? AND doctorId = ?)";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setDate(1, date1);
                ps.setInt(2, doctorId1);
	            ResultSet rs = ps.executeQuery();
	            while(rs.next()){
	            	Slot s=new Slot();
	            	s.setId(rs.getInt(1));
	            	s.setSlotTime(rs.getString(2));
	            	slotList.add(s);
	            }
	        }catch (Exception e){
	            e.printStackTrace();
	        }
	        return slotList;
	    }
	
	

}
