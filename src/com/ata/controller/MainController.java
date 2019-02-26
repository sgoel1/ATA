package com.ata.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ata.bean.DriverBean;
import com.ata.bean.RouteBean;
import com.ata.service.Administrator;




@Controller
public class MainController {
	@Autowired  
	Administrator administratorImp;
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
		return "RouteShow";
	}
	
	//=================UPDATING ROUTE==========
		@RequestMapping(value="/modifyRoute",method=RequestMethod.GET)
		public String modifyRoute(@RequestParam("routeID") String routeID,Model m)
		{	RouteBean routeBean=administratorImp.viewRoute(routeID);
			m.addAttribute("route",routeBean);
			return "EditRoute";
		}
		@RequestMapping(value="/modifiedRoute",method=RequestMethod.GET)
		public String modifiedRoute(RouteBean routeBean,Model m)
		{	
			administratorImp.modifyRoute(routeBean);
			m.addAttribute("message1","Modified");
			return "Route";
		}
		//=============DELETING ROUTE============
		@RequestMapping(value="/deleteRoute",method=RequestMethod.GET)
		public String deleteRoute(@RequestParam("routeID") String routeID,Model m)
		{	
			administratorImp.deleteRoute(routeID);
			m.addAttribute("message2","Deleted");
			return "Route";	
			}
		@RequestMapping(value="/showRoute",method=RequestMethod.GET)
		public String showAllRoute(RouteBean routeBean,Model m)
		{
			List<RouteBean> li=administratorImp.getAllRoute();
			m.addAttribute("db", li);
			return "Driver";
		}
	
	
}
