package com.ata.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ata.bean.DriverBean;
import com.ata.bean.ReservationBean;
import com.ata.service.Administrator;
import com.ata.service.Customer;

@Controller
@RequestMapping(value="/Admin")
public class AdminDriverController {
	
	
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
		  String driverAdd="<div class='alert alert-success alert-dismissible fade in' style='width: 500px; margin-left: 30%'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>"+res+"</div>";
		m.addAttribute("res", driverAdd);
		  return "Admin";
	
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
	{	
		administratorImp.modifyDriver(driverBean);
		String res="Modified";
		String driverModify="<div class='alert alert-success alert-dismissible fade in' style='width: 500px; margin-left: 30%'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>"+res+"</div>";
		m.addAttribute("res", driverModify);
		return "Admin";
	}
	//=============DELETING DRIVER============
	
	
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String delete(@RequestParam("driverID") String driverID,Model m)
	{	
		administratorImp.deleteDriver(driverID);
		String res="Deleted";
		String driverDelete="<div class='alert alert-success alert-dismissible fade in' style='width: 500px; margin-left: 30%'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>"+res+"</div>";
		m.addAttribute("res", driverDelete);
		return "Admin";	
		}
	@RequestMapping(value="/showDriver",method=RequestMethod.GET)
	public String showAllDriver(DriverBean driverBean,Model m)
	{
		List<DriverBean> li=administratorImp.getAllDriver();
		m.addAttribute("db", li);
		return "Driver";
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
				m.addAttribute("allotd","Driver Alloted");
				return "<h2>Driver Alloted</h2>";
			}
			else{
				m.addAttribute("allotd","Driver Not Alloted");
				return "<h2>Driver Not Alloted</h2>";
			}
		}
	

}
