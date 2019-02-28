package com.ata.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ata.bean.DriverBean;
import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;

@Transactional
@Repository
public class AdministratorImp implements Administrator {
	
	@Autowired
	SessionFactory sessionfactory;
	
	@Override
	@Transactional
	public String addVehicle(VehicleBean vehicleBean) {
		String s=Character.toString(vehicleBean.getName().charAt(0)).toUpperCase();
		String d=Character.toString(vehicleBean.getName().charAt(1)).toUpperCase();
		Query q=sessionfactory.getCurrentSession().createSQLQuery("Select vehicleID from ata_tbl_id");
		int val=(int) q.list().get(0);
		vehicleBean.setVehicleID(s+d+val);
		sessionfactory.getCurrentSession().save(vehicleBean);
		SQLQuery query=sessionfactory.getCurrentSession().createSQLQuery("update ata_tbl_id set vehicleid=vehicleid+1");
		query.executeUpdate();
		return "Vehicle Added Successfully with ID : "+vehicleBean.getVehicleID();
	}
	
	@Override
	@Transactional
	public int deleteVehicle(String vehicleID) {
		VehicleBean vehicleBean=(VehicleBean)sessionfactory.getCurrentSession().get(VehicleBean.class, vehicleID);
		if(vehicleBean!=null){
			sessionfactory.getCurrentSession().delete(vehicleBean);
			SQLQuery query=sessionfactory.getCurrentSession().createSQLQuery("update ata_tbl_id set vehicleid=vehicleid-1");
			query.executeUpdate();
			return 1;
		}
		return 0;
	}

	@Override
	public VehicleBean viewVehicle(String vehicleID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public List<VehicleBean> showAllVehicles() {
		List<VehicleBean> list=sessionfactory.getCurrentSession().createCriteria(VehicleBean.class).list();
		return list;
	}
	
	@Transactional
	@Override
	public boolean modifyVehicle(VehicleBean vehicleBean) {
		System.out.println(vehicleBean.getVehicleID());
		VehicleBean bean=(VehicleBean)sessionfactory.getCurrentSession().get(VehicleBean.class, vehicleBean.getVehicleID());
		if(bean!=null){
			bean.setVehicleID(vehicleBean.getVehicleID());
			bean.setName(vehicleBean.getName());
			bean.setType(vehicleBean.getType());
			bean.setFarePerKM(vehicleBean.getFarePerKM());
			bean.setRegistrationNumber(vehicleBean.getRegistrationNumber());
			bean.setSeatingCapacity(vehicleBean.getSeatingCapacity());
			sessionfactory.getCurrentSession().update(bean);
			return true;
		}
		return false;
	}
	
		
	@Transactional
	@Override
	public String addRoute(RouteBean routeBean) {
		String s=Character.toString(routeBean.getSource().charAt(0)).toUpperCase();
		String d=Character.toString(routeBean.getDestination().charAt(0)).toUpperCase();
		Query q=sessionfactory.getCurrentSession().createSQLQuery("Select routeID from ata_tbl_id");
		int val=(int) q.list().get(0);
		routeBean.setRouteID(s+d+val);
		sessionfactory.getCurrentSession().save(routeBean);
		SQLQuery query=sessionfactory.getCurrentSession().createSQLQuery("update ata_tbl_id set routeid=routeid+1");
		query.executeUpdate();
		return "Route Added Successfully with ID "+routeBean.getRouteID();
	}
	
	@Transactional
	@Override
	public int deleteRoute(String routeID) {
		RouteBean routeBean=(RouteBean)sessionfactory.getCurrentSession().get(RouteBean.class,routeID);
		if(routeBean!=null){
			sessionfactory.getCurrentSession().delete(routeBean);
			SQLQuery query=sessionfactory.getCurrentSession().createSQLQuery("update ata_tbl_id set routeid=routeid-1");
			query.executeUpdate();
			return 1;
		}
		return 0;
	}
	@Transactional
	@Override
	public RouteBean viewRoute(String id) {
		RouteBean rb=(RouteBean)sessionfactory.getCurrentSession().get(RouteBean.class,id);
		
			return rb;
		
	}
	@Transactional
	@Override
	public boolean modifyRoute(RouteBean routeBean) {
		RouteBean rbean=(RouteBean)sessionfactory.getCurrentSession().get(RouteBean.class,routeBean.getRouteID());
		if(rbean!=null){
			rbean.setRouteID(routeBean.getRouteID());
			rbean.setDestination(routeBean.getDestination());
			rbean.setDistance(routeBean.getDistance());
			rbean.setSource(routeBean.getSource());
			rbean.setTravelDuration(routeBean.getTravelDuration());
			sessionfactory.getCurrentSession().update(rbean);
			return true;
		}
		return false;
	}
	@Transactional
	@Override
	public List<RouteBean>getAllRoute() {
		
		List<RouteBean>li1=sessionfactory.getCurrentSession().createCriteria(RouteBean.class).list();
		return li1;
	}
	//=====================DRIVER=================
	@Transactional
	@Override
	public String addDriver(DriverBean driverBean) {
		
		String s=Character.toString(driverBean.getName().charAt(0)).toUpperCase();
		String d=Character.toString(driverBean.getName().charAt(1)).toUpperCase();
		Query q=sessionfactory.getCurrentSession().createSQLQuery("Select driverID from ata_tbl_id");
		int val=(int) q.list().get(0);
		driverBean.setDriverID(s+d+val);
		sessionfactory.getCurrentSession().save(driverBean);
		SQLQuery query=sessionfactory.getCurrentSession().createSQLQuery("update ata_tbl_id set driverid=driverid+1");
		query.executeUpdate();
		return "Driver Added with ID : "+driverBean.getDriverID();
	}
	@Transactional
	@Override
	public int deleteDriver(String driverID) {
		DriverBean db=(DriverBean)sessionfactory.getCurrentSession().get(DriverBean.class, driverID);
		if(db!=null){
			sessionfactory.getCurrentSession().delete(db);
			SQLQuery query=sessionfactory.getCurrentSession().createSQLQuery("update ata_tbl_id set driverid=driverid-1");
			query.executeUpdate();
			return 1;
		}
		else
			return 0;
		
	}
	@Transactional
	@Override
	public boolean modifyDriver(DriverBean driverBean) {
		DriverBean db=(DriverBean)sessionfactory.getCurrentSession()
				.get(DriverBean.class, driverBean.getDriverID());
		if(db!=null){
			db.setName(driverBean.getName());
			db.setStreet(driverBean.getStreet());
			db.setLocation(driverBean.getLocation());
			db.setCity(driverBean.getCity());
			db.setState(driverBean.getState());
			db.setPincode(driverBean.getPincode());
			db.setMobileNo(driverBean.getMobileNo());
			db.setLicenseNumber(driverBean.getLicenseNumber());
			sessionfactory.getCurrentSession().update(db);
			return true;
		}
		 
		return false;
	}
	@Transactional
	@Override
	public List<DriverBean> getAllDriver() {
		
		List<DriverBean>li=sessionfactory.getCurrentSession().createCriteria(DriverBean.class).list();
		return li;
	}
	@Transactional
	@Override
	public DriverBean getDriverbyID(String id) {
		
		DriverBean db=(DriverBean)sessionfactory.getCurrentSession().get(DriverBean.class, id);
		return db;
	}

	@Override
	public boolean allotDriver(String reservationID, String driverID) {
		ReservationBean reservationBean=(ReservationBean)sessionfactory.getCurrentSession().get(ReservationBean.class, reservationID);
		System.out.println(reservationBean.getDriverID());
		if(reservationBean!=null){
			reservationBean.setDriverID(driverID);
			reservationBean.setBookingStatus("1");
			System.out.println(driverID);
			sessionfactory.getCurrentSession().update(reservationBean);
			return true;
		}
		return false;
	}

	@Override
	public List<ReservationBean> viewDetails() {
		Query q=sessionfactory.getCurrentSession().createQuery("from ReservationBean where bookingstatus=:bookingstatus");
		q.setParameter("bookingstatus", "0");
		List<ReservationBean> list=q.list();
		return list;
	}
}

