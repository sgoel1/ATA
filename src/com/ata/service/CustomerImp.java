package com.ata.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.stereotype.Repository;

import com.ata.bean.CreditCardBean;
import com.ata.bean.DriverBean;
import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;

@Transactional
@Repository
public class CustomerImp implements Customer {
	@Autowired
	SessionFactory sessionfactory;


	@Override
	public String bookVehicle(ReservationBean reservationBean) {
		String s=Character.toString(reservationBean.getBoardingPoint().charAt(0)).toUpperCase();
		String d=Character.toString(reservationBean.getDropPoint().charAt(0)).toUpperCase();
		Query q=sessionfactory.getCurrentSession().createSQLQuery("Select reservationID from ata_tbl_id");
		int val=(int) q.list().get(0);
		reservationBean.setReservationID(s+d+val);
		sessionfactory.getCurrentSession().save(reservationBean);
		SQLQuery query=sessionfactory.getCurrentSession().createSQLQuery("update ata_tbl_id set reservationid=reservationid+1");
		query.executeUpdate();
		return "Reservation Done Successfully with ID : "+reservationBean.getReservationID();
	}

	@Override
	public boolean cancelBooking(String userID, String reservationID) {
		ReservationBean rb=(ReservationBean)sessionfactory.getCurrentSession().get(ReservationBean.class, reservationID);
		if(rb!=null){
			sessionfactory.getCurrentSession().delete(rb);
		}
		return true;
	}
	

	@Override
	public List<ReservationBean> viewBookingDetails(String userID) {
		Query query=sessionfactory.getCurrentSession().createQuery("from ReservationBean where userID=:userID");
		query.setParameter("userID", userID);
		List<ReservationBean> list=query.list();
		return list;
	}

	@Override
	public ReservationBean printBookingDetails(String reservationID) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ArrayList<VehicleBean> viewVehiclesByType(String vehicleType) {
	Criteria crit = sessionfactory.getCurrentSession().createCriteria(VehicleBean.class).add(Restrictions.eq("type", vehicleType));
	ArrayList<VehicleBean> result = (ArrayList<VehicleBean>) crit.list();
	return result;
	}

	@Override
	public ArrayList<VehicleBean> viewVehicleBySeats(int noOfSeats) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(VehicleBean.class).add(Restrictions.eq("seatingCapacity", noOfSeats));
		ArrayList<VehicleBean> result = (ArrayList<VehicleBean>) crit.list();
		return result;
	}

	@Override
	public ArrayList<RouteBean> viewAllRoutes() {
		ArrayList<RouteBean> list=(ArrayList<RouteBean>) sessionfactory.getCurrentSession().createCriteria(RouteBean.class).list();
		return list;
	}

	@Override
	public ArrayList<RouteBean> getSelectedRoutes(String source) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(RouteBean.class).add(Restrictions.eq("source", source));
		ArrayList<RouteBean> result = (ArrayList<RouteBean>) crit.list();
		return result;
	}
	
	@Override
	public String getRouteID(String source,String destination){
		Query q=sessionfactory.getCurrentSession().createSQLQuery("Select routeID from ata_tbl_route where source=:source and destination=:destination");
		q.setParameter("source",source);
		q.setParameter("destination", destination);
		String routeID=(String)(q.list().get(0));
		System.out.println(routeID);
		return routeID;
	}
	

	@Override
	@Transactional
	public int makePayment(CreditCardBean payment) {
		sessionfactory.getCurrentSession().save(payment);
		return 0;
	}

}
