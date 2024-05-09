package com.virtusa.entity;

public class Slot {
	
	int id;
	String slotTime;
	public Slot(String slotTime) {
		super();
		this.slotTime = slotTime;
	}
	
	public Slot() {
		super();
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSlotTime() {
		return slotTime;
	}
	public void setSlotTime(String slotTime) {
		this.slotTime = slotTime;
	}

}
