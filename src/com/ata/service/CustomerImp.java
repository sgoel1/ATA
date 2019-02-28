package com.ata.service;

import java.util.ArrayList;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;

@Repository
public class CustomerImp implements Customer {
	@Autowired
	SessionFactory sessionfactory;

	@Override
	public ArrayList<VehicleBean> viewVehiclesByType(String vehicleType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<VehicleBean> viewVehicleBySeats(int noOfSeats) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<RouteBean> viewAllRoutes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String bookVehicle(ReservationBean reservationBean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean cancelBooking(String userID, String reservationID) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ReservationBean viewBookingDetails(String reservationID) {
		ReservationBean db = (ReservationBean) sessionfactory
				.getCurrentSession().get(ReservationBean.class, reservationID);
		return db;
	}

	@Override
	public ReservationBean printBookingDetails(String reservationID) {
		// TODO Auto-generated method stub
		return null;
	}

}
