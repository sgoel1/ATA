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
	
	@RequestMapping("/display")
	public String addVehicle(Model m)
	{
		m.addAttribute("vehicleBean", new VehicleBean());
		return "AddVehicle";
	}
	
	@RequestMapping("/displayEdit")
	public String displayVehicle(Model m, @RequestParam("vehicleID")String vehicleID, @RequestParam("type")String type,@RequestParam("name")String name,@RequestParam("registrationNumber")String registrationNumber,@RequestParam("seatingCapacity")String seatingCapacity,@RequestParam("farePerKM")String farePerKM)
	{
		m.addAttribute("vehicleEditBean", new VehicleBean(vehicleID,name,type,registrationNumber,Integer.parseInt(seatingCapacity),Double.parseDouble(farePerKM)));
		System.out.println(vehicleID+" "+name+" "+type+" "+registrationNumber);
		return "UpdateVehicle";
	}
	
	@RequestMapping("/addvdb")
	public String addTodb(VehicleBean vehicleBean,Model m)
	{
		String res=administratorDao.addVehicle(vehicleBean);
		String vehicleAdd="<div class='alert alert-success alert-dismissible fade in' style='width: 500px; margin-left: 30%'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>"+res+"</div>";
		m.addAttribute("res",vehicleAdd);
		return "AddVehicle";
	}
	
	@RequestMapping("/updatevdb")
	public String updateTodb(VehicleBean vehicleEditBean,Model m)
	{
		System.out.println(vehicleEditBean.getVehicleID()+"jf "+vehicleEditBean.getName());
		boolean res1=administratorDao.modifyVehicle(vehicleEditBean);
		String res="Vehicle Updated";
		String vehicleUpdate="<div class='alert alert-success alert-dismissible fade in' style='width: 500px; margin-left: 30%'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>"+res+"</div>";
		m.addAttribute("res",vehicleUpdate);
		return "redirect:showall";
	}
	
	@RequestMapping("/delvdb")
	public String deleteFromdb(@RequestParam("vehicleID")String vehicleID)
	{
		administratorDao.deleteVehicle(vehicleID);
		return "redirect:showall";
	}
	
	@RequestMapping("/showall")
	public String showAllVehicles(Model m)
	{
		List<VehicleBean> list=administratorDao.showAllVehicles();
		m.addAttribute("vehicleList", list);
		//System.out.println(list.get(1).getName());
		return "Navigation";
	}
	
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
		String responsetext="<table id='customers'>";
		
		responsetext=responsetext+"<tr><th>ReservationID</th>";
		responsetext=responsetext+"<th>Vehicle ID</th>";
		responsetext=responsetext+"<th>UserID</th>";
		responsetext=responsetext+"<th>TotalFare</th>";
		responsetext=responsetext+"<th>Booking Status</th>";
		responsetext=responsetext+"<th>Boarding Point</th>";
		responsetext=responsetext+"<th>Drop Point</th></tr>";
		for(ReservationBean rb:list)
		{
		responsetext=responsetext+"<tr><td>"+rb.getReservationID()+"</td>";							
		responsetext=responsetext+"<td>"+rb.getVehicleID()+"</td>";
		responsetext=responsetext+"<td>"+rb.getUserID()+"</td>";
		responsetext=responsetext+"<td>"+rb.getTotalFare()+"</td>";
		responsetext=responsetext+"<td>"+rb.getBookingStatus()+"</td>";
		responsetext=responsetext+"<td>"+rb.getBoardingPoint()+"</td>";
		responsetext=responsetext+"<td>"+rb.getDropPoint()+"</td></tr>";
		}
		responsetext=responsetext+"</table>";
		return responsetext;
	}
	
	@RequestMapping("/viewBookingPage")
	public String viewBookingPage(Model m)
	{
		List<String> result=administratorDao.getAllSource();
		//System.out.println(result.get(0)+" "+result.get(1));
		m.addAttribute("SourceList", result);
		return "ViewBookingAdmin";
	}
}

	
	
	

