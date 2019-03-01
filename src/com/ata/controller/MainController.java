package com.ata.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ata.bean.DriverBean;
import com.ata.bean.ProfileBean;
import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;
import com.ata.service.Administrator;
import com.ata.service.Customer;

@Controller
public class MainController {
	@Autowired  
	Administrator administratorImp;
	
	@Autowired
	Customer customerImp;
	
	//==========ADDING NEW DRIVER======
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String helloUser1(Model m)
	{
		m.addAttribute("driverBean",new DriverBean());
		return "AddDriver";
	}
	@RequestMapping(value="/addDriver",method=RequestMethod.GET)
	public String helloUser(DriverBean driverBean,Model m)
	{
		  String res=administratorImp.addDriver(driverBean);
			m.addAttribute("message",res);
			return "AddDriver";
	
	}
	//=================UPDATING DRIVER==========
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public String modify(@RequestParam("driverID") String driverID,Model m)
	{	DriverBean driverBean=administratorImp.getDriverbyID(driverID);
		m.addAttribute("driver",driverBean);
		return "EditDriver";
	}
	@RequestMapping(value="/modified",method=RequestMethod.GET)
	public String modified(DriverBean driverBean,Model m)
	{	System.out.println("=========="+driverBean.getDriverID());
		administratorImp.modifyDriver(driverBean);
		m.addAttribute("message1","Modified");
		return "Show";
	}
	//=============DELETING DRIVER============
	
	
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String delete(@RequestParam("driverID") String driverID,Model m)
	{	
		administratorImp.deleteDriver(driverID);
		m.addAttribute("message2","Deleted");
		return "Show";	
		}
	@RequestMapping(value="/showDriver",method=RequestMethod.GET)
	public String showAllDriver(DriverBean driverBean,Model m)
	{
		List<DriverBean> li=administratorImp.getAllDriver();
		m.addAttribute("db", li);
		return "Driver";
	}
	
	//=================ROUTE ADD=====================
	@RequestMapping(value="/routeMain",method=RequestMethod.GET)
	public String routenav()
	{
		return "RouteMain";
	}
	
	@RequestMapping(value="/route")
	public String route(Model m){
		m.addAttribute("routeBean",new RouteBean());
		return "AddRoute";
	}
	@RequestMapping(value="/addroute")
	public String addRoute(RouteBean routeBean,Model m){
		String res=administratorImp.addRoute(routeBean);
		m.addAttribute("res",res);
		return "AddRoute";
	}
	
	//=================UPDATING ROUTE==========
		@RequestMapping(value="/modifyRoute",method=RequestMethod.GET)
		public String modifyRoute(@RequestParam("routeID") String routeID,Model m)
		{	
			System.out.println(routeID);
			RouteBean routeBean=administratorImp.viewRoute(routeID);
			m.addAttribute("route",routeBean);
			return "EditRoute";
		}
		@RequestMapping(value="/modifiedRoute",method=RequestMethod.GET)
		public String modifiedRoute(RouteBean routeBean,Model m)
		{	
			administratorImp.modifyRoute(routeBean);
			m.addAttribute("message1","Modified");
			return "EditRoute";
		}
		//=============DELETING ROUTE============
		@RequestMapping(value="/deleteRoute",method=RequestMethod.GET)
		public String deleteRoute(@RequestParam("routeID") String routeID,Model m)
		{	
			administratorImp.deleteRoute(routeID);
			m.addAttribute("message2","Deleted");
			return "RouteMain";	
			}
		//=============SHOW ALL ROUTES==========
		@RequestMapping(value="/showRoute",method=RequestMethod.GET)
		public String showAllRoute(RouteBean routeBean,Model m)
		{
			List<RouteBean> li=administratorImp.getAllRoute();
			m.addAttribute("rb", li);
			return "RouteShow";
		}
		
		//==============Allot Driver======================
		
		@RequestMapping(value="/allotdriver")
		public String allotdriver(ReservationBean reservationBean,DriverBean driverBean,Model m){
			List<ReservationBean> li=administratorImp.viewDetails();
			List<DriverBean> driverlist=administratorImp.getAllDriver();
			m.addAttribute("ab", li);
			m.addAttribute("ab1",driverlist);
			return "AllotDriver";
		}
		
		@RequestMapping(value="/allotDriver")
		public @ResponseBody String allotDriver(@RequestParam("reservationID")String reservationID,@RequestParam("driverID")String driverID,Model m){
			boolean b=administratorImp.allotDriver(reservationID, driverID);
			if(b==true){
				//m.addAttribute("allotd","Driver Alloted");
				return "<h2>Driver Alloted</h2>";
			}
			else{
				m.addAttribute("allotd","Driver Not Alloted");
				return "<h2>Driver Not Alloted</h2>";
			}
		}
		
		//====================View Reservations Customer=================
		@RequestMapping(value="/viewresv")
		public String viewresv(HttpSession session,Model m){
			ProfileBean pbean=(ProfileBean)session.getAttribute("user");
			//RouteBean rbean=(RouteBean)session.getAttribute("");
			//VehicleBean vbean=(VehicleBean)session.getAttribute("");
			List<ReservationBean> li=customerImp.viewBookingDetails(pbean.getUserID());
			//List<ReservationBean> li1=customerImp.viewBookingDetails(rbean.getRouteID());
			//List<ReservationBean> li2=customerImp.viewBookingDetails(vbean.getVehicleID());
			m.addAttribute("reslist",li);
			//m.addAttribute("routelist",li1);
			//m.addAttribute("vehlist",li2);
			return "CustomerBooking";
		}
		
	
		
}
