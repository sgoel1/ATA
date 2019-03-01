package com.ata.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ata.bean.DriverBean;
import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;

public interface Administrator {
	String addVehicle(VehicleBean vehicleBean);

	int deleteVehicle(String vehicleID);

	VehicleBean viewVehicle(String vehicleID);

	boolean modifyVehicle(VehicleBean vehicleBean);

	String addDriver(DriverBean driverBean);

	int deleteDriver(String driverID);
	
	boolean allotDriver(String reservationID, String driverID);

	boolean modifyDriver(DriverBean driverBean);

	public List<DriverBean> getAllDriver();

	public DriverBean getDriverbyID(String id);

	String addRoute(RouteBean routeBean);

	int deleteRoute(String routeID);

	RouteBean viewRoute(String routeID);

	boolean modifyRoute(RouteBean routeBean);
	
	public RouteBean getRoute(String routeID);

	public List<VehicleBean> showAllVehicles();

	public List<RouteBean> getAllRoute();
	
	public List<ReservationBean> viewDetails();

	ArrayList<ReservationBean> viewBookingDetails(Date journeyDate, String source, String destination);

}
