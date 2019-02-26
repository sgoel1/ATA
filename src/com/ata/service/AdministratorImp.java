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
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;

@Repository
public class AdministratorImp implements Administrator {
	
	@Autowired
	SessionFactory sessionfactory;
	
	@Override
	@Transactional
	public String addVehicle(VehicleBean vehicleBean) {
		String s=Character.toString(vehicleBean.getName().charAt(0));
		String d=Character.toString(vehicleBean.getName().charAt(1));
		SQLQuery q=sessionfactory.getCurrentSession().createSQLQuery("Select vehicleID from ata_tbl_id where genID=:genID");
		q.setInteger("genID", 72);
		int val=q.getFirstResult();
		vehicleBean.setVehicleID(s+d+val);
		System.out.println("sessiofactory: "+sessionfactory);
		sessionfactory.getCurrentSession().save(vehicleBean);
		sessionfactory.getCurrentSession().createSQLQuery("update ata_tbl_id set routeid=routeid+1 where genID=72");
		return "Object added";
	}
	
	@Override
	@Transactional
	public int deleteVehicle(String vehicleID) {
		VehicleBean vehicleBean=(VehicleBean)sessionfactory.getCurrentSession().get(VehicleBean.class, vehicleID);
		sessionfactory.getCurrentSession().delete(vehicleBean);
		
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
		String s=Character.toString(routeBean.getSource().charAt(0));
		String d=Character.toString(routeBean.getDestination().charAt(0));
		SQLQuery q=sessionfactory.getCurrentSession().createSQLQuery("Select routeID from ata_tbl_id where genID=:genID");
		q.setInteger("genID", 72);
		Integer val=(Integer)q.getFirstResult();
		routeBean.setRouteID(s+d+val);
		sessionfactory.getCurrentSession().save(routeBean);
		sessionfactory.getCurrentSession().createSQLQuery("update ata_tbl_id set routeid=routeid+1 where genID=72");
		return "Route Added Successfully with ID "+routeBean.getRouteID();
	}
	
	@Transactional
	@Override
	public int deleteRoute(String routeID) {
		RouteBean routeBean=(RouteBean)sessionfactory.getCurrentSession().get(RouteBean.class,routeID);
		if(routeBean!=null){
			sessionfactory.getCurrentSession().delete(routeBean);
			return 1;
		}
		return 0;
	}

	@Override
	public RouteBean viewRoute(String routeID) {
		RouteBean routeBean=(RouteBean)sessionfactory.getCurrentSession().get(RouteBean.class,routeID);
		if(routeBean!=null){
			return routeBean;
		}
		return null;
	}

	@Override
	public boolean modifyRoute(RouteBean routeBean) {
		RouteBean rbean=(RouteBean)sessionfactory.getCurrentSession().get(RouteBean.class,routeBean.getRouteID());
		if(rbean!=null){
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
	
	@Transactional
	@Override
	public String addDriver(DriverBean driverBean) {
		String s=Character.toString(driverBean.getName().charAt(0));
		String d=Character.toString(driverBean.getName().charAt(1));
		SQLQuery q=sessionfactory.getCurrentSession().createSQLQuery("Select driverID from ata_tbl_id where genID=:genID");
		q.setInteger("genID", 72);
		int val=q.getFirstResult();
		driverBean.setDriverID(s+d+val);
		sessionfactory.getCurrentSession().save(driverBean);
		return "User Added "+driverBean.getDriverID();
	}
	@Transactional
	@Override
	public int deleteDriver(String driverID) {
		DriverBean db=(DriverBean)sessionfactory.getCurrentSession().get(DriverBean.class, driverID);
		sessionfactory.getCurrentSession().delete(db);
		if(db!=null)
		return 1;
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
	}

	
	


