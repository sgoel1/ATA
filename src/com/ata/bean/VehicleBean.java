package com.ata.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="ata_tbl_vehicle")
public class VehicleBean {
	
	@Id
	private String vehicleID;
	
	@Column(name="Name")
	private String name;
	
	@Column(name="Type")
	private String type;
	
	@Column(name="REGISTRATIONNUMBER")
	private String registrationNumber;
	
	@Column(name="SEATINGCAPACITY")
	private int seatingCapacity;
	
	@Column(name="FAREPERKM")
	private double farePerKM;
	
	public VehicleBean() {}
	public VehicleBean(String vehicleID, String name, String type, String registrationNumber, int seatingCapacity,
			double farePerKM) {
		super();
		this.vehicleID = vehicleID;
		this.name = name;
		this.type = type;
		this.registrationNumber = registrationNumber;
		this.seatingCapacity = seatingCapacity;
		this.farePerKM = farePerKM;
	}
	public String getVehicleID() {
		return vehicleID;
	}
	public void setVehicleID(String vehicleID) {
		this.vehicleID = vehicleID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRegistrationNumber() {
		return registrationNumber;
	}
	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}
	public int getSeatingCapacity() {
		return seatingCapacity;
	}
	public void setSeatingCapacity(int seatingCapacity) {
		this.seatingCapacity = seatingCapacity;
	}
	public double getFarePerKM() {
		return farePerKM;
	}
	public void setFarePerKM(double farePerKM) {
		this.farePerKM = farePerKM;
	}
	
}

