package com.ata.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.text.DefaultEditorKit.CutAction;

import org.apache.tomcat.util.buf.UDecoder;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ata.bean.CredentialsBean;
import com.ata.bean.CreditCardBean;
import com.ata.bean.ProfileBean;
import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;
import com.ata.service.Administrator;
import com.ata.service.Customer;

@Controller
public class CustomerController {
	
	@Autowired
	Customer customerImpl;
	
	@Autowired
	Administrator admin;
	
	@Autowired
	SessionFactory sessionFactory;
	
	@RequestMapping(value="/showvehtype",method=RequestMethod.GET)
	public @ResponseBody String showVehiclesByType(Model m, @RequestParam("type")String type)
	{
		List<VehicleBean> list=customerImpl.viewVehiclesByType(type);
		m.addAttribute("vehicleTypeList", list);
		String responsetext="<table id='customers'>";
		
		responsetext=responsetext+"<tr><th>Select</th>";
		responsetext=responsetext+"<th>Vehicle ID</th>";
		responsetext=responsetext+"<th>Type</th>";
		responsetext=responsetext+"<th>Name</th>";
		responsetext=responsetext+"<th>Registration No.></th>";
		responsetext=responsetext+"<th>Seating Cap.</th>";
		responsetext=responsetext+"<th>Fare per KM</th></tr>";
		for(VehicleBean vb:list)
		{
		responsetext=responsetext+"<tr><td><input type='radio' name='vehicleID' value="+vb.getVehicleID()+" required></td>";							
		responsetext=responsetext+"<td>"+vb.getVehicleID()+"</td>";
		responsetext=responsetext+"<td>"+vb.getType()+"</td>";
		responsetext=responsetext+"<td>"+vb.getName()+"</td>";
		responsetext=responsetext+"<td>"+vb.getRegistrationNumber()+"</td>";
		responsetext=responsetext+"<td>"+vb.getSeatingCapacity()+"</td>";
		responsetext=responsetext+"<td>"+vb.getFarePerKM()+"</td></tr>";
		}
		responsetext=responsetext+"</table>";
		return responsetext;
	}
	
	@RequestMapping(value="/showvehseat" ,method=RequestMethod.GET)
	public @ResponseBody String showVehiclePage(Model m,  @RequestParam("seatingcapacity")String seatingcapacity)
	{
		List<VehicleBean> list=customerImpl.viewVehicleBySeats(Integer.parseInt(seatingcapacity));
		m.addAttribute("vehicleTypeList", list);
		
		String responsetext="<table id='customers'>";
		responsetext=responsetext+"<tr><th>Select</th>";
		responsetext=responsetext+"<th>Vehicle ID</th>";
		responsetext=responsetext+"<th>Type</th>";
		responsetext=responsetext+"<th>Name</th>";
		responsetext=responsetext+"<th>Registration No.></th>";
		responsetext=responsetext+"<th>Seating Cap.</th>";
		responsetext=responsetext+"<th>Fare per KM</th></tr>";
		for(VehicleBean vb:list)
		{	
		responsetext=responsetext+"<tr><td><input type='radio' name='vehicleID' value="+vb.getVehicleID()+" required></td>";	
		responsetext=responsetext+"<td>"+vb.getVehicleID()+"</td>";
		responsetext=responsetext+"<td>"+vb.getType()+"</td>";
		responsetext=responsetext+"<td>"+vb.getName()+"</td>";
		responsetext=responsetext+"<td>"+vb.getRegistrationNumber()+"</td>";
		responsetext=responsetext+"<td>"+vb.getSeatingCapacity()+"</td>";
		responsetext=responsetext+"<td>"+vb.getFarePerKM()+"</td></tr>";
		}
		responsetext=responsetext+"</table>";
		return responsetext;
	}
	
	@RequestMapping(value="/showdestination",method=RequestMethod.GET)
	public @ResponseBody String showdestination(Model m, @RequestParam("source")String source)
	{
		System.out.println("source is "+source);
		List<RouteBean> list=customerImpl.getSelectedRoutes(source);
		m.addAttribute("RouteList", list);
		String responsetext="<select id='destination' name='destination'><option>Destination</option>";
		for(RouteBean rb:list)
		{
		responsetext=responsetext+"<option value="+rb.getDestination()+" label="+rb.getDestination()+">"+"</option>";
		}
		responsetext=responsetext+"</select>";
		return responsetext;
	}
	
	@RequestMapping("/viewvehicles")
	public String showVehiclesByseat(Model m)
	{
		return "ViewVehicles";
	}
	
	@RequestMapping(value="/bookv")
	public String bookveh(Model m){
		m.addAttribute("vehicleBean",new VehicleBean());
		m.addAttribute("routeBean",new RouteBean());
		m.addAttribute("reservationBean",new ReservationBean());
		return "ViewVehicles";
	}
	
	@RequestMapping(value="/bookvehicle")
	public String bookvehicle(VehicleBean vehicleBean,RouteBean routeBean,ReservationBean reservationBean,@RequestParam("journeydate") String strJourneyDate,HttpSession session,Model m) throws ParseException{
		System.out.println("inside bookvehicle");
		System.out.println("Vehicle ID : "+vehicleBean.getVehicleID());
		System.out.println("Journey Date :"+strJourneyDate);
		ProfileBean bean=(ProfileBean)session.getAttribute("user");
		reservationBean.setUserID(bean.getUserID());
		reservationBean.setBookingDate(new Date(System.currentTimeMillis()));
		reservationBean.setJourneyDate(Date.valueOf(strJourneyDate));
		
		String RouteID=customerImpl.getRouteID(routeBean.getSource(), routeBean.getDestination());
		RouteBean rbean=admin.getRoute(RouteID);
		reservationBean.setRouteID(RouteID);
		
		VehicleBean vbean=admin.viewVehicle(vehicleBean.getVehicleID());
		System.out.println(vbean.getFarePerKM()+"hjhkjh "+rbean.getDistance());
		double fare=vbean.getFarePerKM()*rbean.getDistance();
		reservationBean.setBookingStatus("0");
		reservationBean.setTotalFare(fare);
		
		String s=customerImpl.bookVehicle(reservationBean);
		m.addAttribute("rbean",s);
		return "MakePayment";
	}
	
	@RequestMapping("/makePayment")
	public String makePayment(Model m)
	{
		return "MakePayment";
	}
	
	@RequestMapping("/checkPayment")
	public String checkPayment(@RequestParam("creditcard")String creditcard,@RequestParam("validfrom")String validfrom,@RequestParam("validto")String validto,@RequestParam("balance")String balance,HttpSession httpSession)
	{
		String userID="";
		ProfileBean profileBean=(ProfileBean)httpSession.getAttribute("user");
	    userID=profileBean.getUserID();
		CreditCardBean payment=new CreditCardBean(creditcard, validfrom, validto, Integer.parseInt(balance),"PA1000");
		customerImpl.makePayment(payment);
		return "";
	}
	@RequestMapping(value="/deleteboooking",method=RequestMethod.GET)
	public String delete(@RequestParam("reservationID") String reservationID,Model m)
	{	
		customerImpl.cancelBooking("", reservationID);
		m.addAttribute("message2","Deleted");
		return "Customer";	
		}
	
}
