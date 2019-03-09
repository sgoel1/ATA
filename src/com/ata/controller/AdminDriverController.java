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
	/*@RequestMapping(value="/add",method=RequestMethod.GET)
	public String helloUser1(Model m)
	{
		m.addAttribute("driverBean",new DriverBean());
		return "AddDriver";
	}*/
	@RequestMapping(value="/addDriver",method=RequestMethod.GET)
	public String helloUser(DriverBean driverBean,Model m)
	{
		  String res=administratorImp.addDriver(driverBean);
		  //String driverAdd="<div class='alert alert-success alert-dismissible fade in' style='width: 500px; margin-left: 30%'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>"+res+"</div>";
		  m.addAttribute("status",true);
		  m.addAttribute("res",res);
		  return showAllDriver(driverBean,m);
	
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
		String msg="";
		boolean status=false;
		boolean res=administratorImp.modifyDriver(driverBean);
		if(res){
			status=true;
			msg="successfully modified Driver with id :"+driverBean.getDriverID();
		}
		else{
			msg="failed :( to modify !! ";
		}
		
		//String driverModify="<div class='alert alert-success alert-dismissible fade in' style='width: 500px; margin-left: 30%'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong>"+res+"</div>";
		m.addAttribute("res", msg);
		m.addAttribute("status",status);
		return showAllDriver(driverBean,m);
	}
	//=============DELETING DRIVER============
	
	
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String delete(@RequestParam("driverID") String driverID,Model m,DriverBean driverBean)
	{	
		String msg = "";
		boolean status=false;
		try{
			int res=administratorImp.deleteDriver(driverID);
		if(res==1){
			msg = "successfully deleted Driver with id :"+driverID;
			status = true;
		}
		else{
			msg="failed :( to delete !! ";
		}
		m.addAttribute("status",status);
		m.addAttribute("res",msg);
		return showAllDriver(driverBean,m);
	}
	catch(Exception e){
		m.addAttribute("status",status);
		m.addAttribute("res","Could not delete Driver "+driverID);
		return showAllDriver(driverBean,m);
	}
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
		public String allotdriver(Model m){
			List<ReservationBean> li=administratorImp.viewDetails();
			List<DriverBean> driverlist=administratorImp.getAllDriver();
			if(li.isEmpty()){
				m.addAttribute("emptyList","No new reservations avaliable!!!");
			}
			else{
				m.addAttribute("ab", li);
				m.addAttribute("ab1",driverlist);
			}
			return "AllotDriver";
		}
		
		@RequestMapping(value="/allotDriver")
		public String allotDriver(@RequestParam("reservationID")String reservationID,@RequestParam("driverID")String driverID,Model m){
			boolean b=administratorImp.allotDriver(reservationID, driverID);
			if(b){
				m.addAttribute("status",b);
				m.addAttribute("res","Driver Alloted");
			}
			else{
				m.addAttribute("status",b);
				m.addAttribute("res","Driver not alloted!!!");
			}
			return allotdriver(m);
		}
	

}
