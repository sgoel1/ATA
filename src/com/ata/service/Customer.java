package com.ata.service;

import java.util.ArrayList;
import java.util.List;

import com.ata.bean.CreditCardBean;
import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;

public interface Customer {
	ArrayList<VehicleBean> viewVehiclesByType(String vehicleType);
	ArrayList<VehicleBean> viewVehicleBySeats(int noOfSeats);
	ArrayList<RouteBean> viewAllRoutes();
	String bookVehicle(ReservationBean reservationBean);
	boolean cancelBooking(String userID, String reservationID);
	List<ReservationBean> viewBookingDetails(String userID);
	ReservationBean printBookingDetails(String reservationID);
	ArrayList<RouteBean> getSelectedRoutes(String source);
	String getRouteID(String source,String destination);
	String makePayment(CreditCardBean payment);
	String updateReservation(String reservationID);
	List getAllSource();
	List getVehicleType();
	List getSeats();
}

