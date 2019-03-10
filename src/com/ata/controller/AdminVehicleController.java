package com.ata.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ata.bean.ReservationBean;
import com.ata.bean.RouteBean;
import com.ata.bean.VehicleBean;
import com.ata.service.Administrator;

@Controller
@RequestMapping(value="/Admin")
public class AdminVehicleController {
	
	@Autowired
	Administrator administratorDao;
	
	@RequestMapping("/vehicle")
	public String vehicle(){
		return "VehicleMain";
	}
	
	
	//==================Update Vehicle=======================
	@RequestMapping("/displayEdit")
	public String displayVehicle(Model m, @RequestParam("vehicleID")String vehicleID, @RequestParam("type")String type,@RequestParam("name")String name,@RequestParam("registrationNumber")String registrationNumber,@RequestParam("seatingCapacity")String seatingCapacity,@RequestParam("farePerKM")String farePerKM)
	{
		m.addAttribute("vehicleEditBean", new VehicleBean(vehicleID,name,type,registrationNumber,Integer.parseInt(seatingCapacity),Double.parseDouble(farePerKM)));
		return "UpdateVehicle";
	}
	
	@RequestMapping("/updatevdb")
	public String updateTodb(VehicleBean vehicleEditBean,Model m)
	{
		String msg = "";
		boolean status=false;
		boolean res = administratorDao.modifyVehicle(vehicleEditBean);
		if(res)
		{
			msg = "successfully modified Vehicle with id :"+vehicleEditBean.getVehicleID();
			status = true;
		}
		else
		{
			msg="failed :( to modify !! ";
			
		}
		
		m.addAttribute("status",status);
		m.addAttribute("res",msg);
		return showAllVehicles(m);
	}
	
	//====================Add Vehicle=========================
	
	/*@RequestMapping("/display")
	public String addVehicle(Model m)
	{
		m.addAttribute("vehicleBean", new VehicleBean());
		return "AddVehicle";
	}*/
	
	@RequestMapping("/addvdb")
	public String addTodb(VehicleBean vehicleBean,Model m)
	{
		String res=administratorDao.addVehicle(vehicleBean);
		//String vehicleAdd="<div class='alert alert-success alert-dismissible fade in' style='width: 500px; margin-left: 30%'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>"+res+"</div>";
		m.addAttribute("status",true);
		m.addAttribute("res",res);
		return showAllVehicles(m);
	}
	
	
	//====================Delete Vehicle==========================
	@RequestMapping("/delvdb")
	public String deleteFromdb(@RequestParam("vehicleID")String vehicleID,Model m)
	{
		String msg = "";
		boolean status=false;
		try{
		int res=administratorDao.deleteVehicle(vehicleID);
		if(res==1){
			msg = "successfully deleted Vehicle with id :"+vehicleID;
			status = true;
		}
		else{
			msg="failed :( to delete !! ";
		}
		m.addAttribute("status",status);
		m.addAttribute("res",msg);
		return showAllVehicles(m);
	}
	catch(Exception e){
		m.addAttribute("status",status);
		m.addAttribute("res","Could not delete Vehicle "+vehicleID);
		return showAllVehicles(m);
	}
	}
	
	//====================Show All Vehicles===================
	@RequestMapping("/showall")
	public String showAllVehicles(Model m)
	{
		List<VehicleBean> list=administratorDao.showAllVehicles();
		m.addAttribute("vehicleList", list);
		//System.out.println(list.get(1).getName());
		return "Navigation";
	}
	
	//=====================Admin view Bookings===================
	@RequestMapping(value="/viewdestination",method=RequestMethod.GET)
	public @ResponseBody String showdestination(Model m, @RequestParam("source")String source)
	{
		List<RouteBean> list=administratorDao.getSelectedRoutes(source);
		m.addAttribute("RouteList", list);
		String responsetext="<select id='destination'><option>Destination</option>";
		for(RouteBean rb:list)
		{
		responsetext=responsetext+"<option value='"+rb.getDestination()+"'>"+rb.getDestination()+"</option>";
		}
		responsetext=responsetext+"</select>";
		return responsetext;
	}
	
	@RequestMapping("/viewBooking")
	public @ResponseBody String viewBookingDetails(@RequestParam("source")String source, @RequestParam("destination")String destination, @RequestParam("journeydate")String journeydate)
	{
		List<ReservationBean> list=administratorDao.viewBookingDetails(Date.valueOf(journeydate), source, destination);
		String responsetext="<table id='customers' class='table table-striped'>";
		
		responsetext=responsetext+"<tr><th>Reservation ID</th>";
		responsetext=responsetext+"<th>User ID</th>";
		responsetext=responsetext+"<th>Route ID</th>";
		responsetext=responsetext+"<th>Vehicle ID</th>";
		responsetext=responsetext+"<th>Booking Date</th>";
		responsetext=responsetext+"<th>Journey Date</th>";
		responsetext=responsetext+"<th>Booking Status</th>";
		for(ReservationBean rb:list)
		{
		responsetext=responsetext+"<tr><td>"+rb.getReservationID()+"</td>";							
		responsetext=responsetext+"<td>"+rb.getUserID()+"</td>";
		responsetext=responsetext+"<td>"+rb.getRouteID()+"</td>";
		responsetext=responsetext+"<td>"+rb.getVehicleID()+"</td>";
		responsetext=responsetext+"<td>"+rb.getBookingDate()+"</td>";
		responsetext=responsetext+"<td>"+rb.getJourneyDate()+"</td>";
		responsetext=responsetext+"<td>"+rb.getBookingStatus()+"</td>";
		}
		responsetext=responsetext+"</table>";
		return responsetext;
	}
	
	@RequestMapping("/viewBookingPage")
	public String viewBookingPage(Model m)
	{
		List<String> result=administratorDao.getAllSource();
		//System.out.println(result.get(0)+" "+result.get(1));
		List<ReservationBean> list=administratorDao.viewAllReservationBookings();
		m.addAttribute("AllReservations",list);
		m.addAttribute("SourceList", result);
		return "ViewBookingAdmin";
	}
}

	
	
	

