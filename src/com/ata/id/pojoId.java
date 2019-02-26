package com.ata.id;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ata_table_id")
public class pojoId {
@Id
private int genID;
private int userID;
private int driverID;
private int reservationID;
private int routeID;
private int vehicleID;
public int getGenID() {
	return genID;
}
public void setGenID(int genID) {
	this.genID = genID;
}
public int getUserID() {
	return userID;
}
public void setUserID(int userID) {
	this.userID = userID;
}
public int getDriverID() {
	return driverID;
}
public void setDriverID(int driverID) {
	this.driverID = driverID;
}
public int getReservationID() {
	return reservationID;
}
public void setReservationID(int reservationID) {
	this.reservationID = reservationID;
}
public int getRouteID() {
	return routeID;
}
public void setRouteID(int routeID) {
	this.routeID = routeID;
}
public int getVehicleID() {
	return vehicleID;
}
public void setVehicleID(int vehicleID) {
	this.vehicleID = vehicleID;
}

}
